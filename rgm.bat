rem @echo off
setlocal enableextensions enabledelayedexpansion
chcp 1251>nul 

rem переименовать neg & pos в n1.. & p1..
for %%f in (pos*.gbx) do (
	for /f "delims=_ tokens=1,2,3* " %%i in ("%%f") do (
		ren %%i_%%j_%%k p%%j.gbx 
	)
)
for %%f in (neg*.gbx) do (
	for /f "delims=_ tokens=1,2,3* " %%i in ("%%f") do (
		ren %%i_%%j_%%k n%%j.gbx 
	)
)

set nname=%1

if "%nname%" neq "" goto existpar
rem ≈сли есть параметр идти делать как раньше

dir n?.gbx >nul
if %errorlevel%==1 goto checkpos
rem ≈сли нет файлов начинающихс€ на neg, то проверить на наличие файлов на pos
goto existneg

:checkpos
dir p?.gbx >nul
if %errorlevel%==1 goto existpar
rem ≈сли нет ни тех ни других идем как обычно без параметра, то есть просто скидываем на рисование то, что есть.

rem »наче путь транслитерируем и удал€ем точки и тире из имен плат

:existneg

set ccd=%cd%
set ccd=%ccd:.=%
set ccd=%ccd:-=%
set "ccd=%ccd:а=a%"
SET "ccd=%ccd:б=b%"
SET "ccd=%ccd:в=v%"
SET "ccd=%ccd:г=g%" 
SET "ccd=%ccd:д=d%"
SET "ccd=%ccd:е=e%"
SET "ccd=%ccd:Є=jo%" 
SET "ccd=%ccd:ж=zh%" 
SET "ccd=%ccd:з=z%" 
SET "ccd=%ccd:и=i%" 
SET "ccd=%ccd:й=j%" 
SET "ccd=%ccd:к=k%" 
SET "ccd=%ccd:л=l%" 
SET "ccd=%ccd:м=m%" 
SET "ccd=%ccd:н=n%" 
SET "ccd=%ccd:о=o%" 
SET "ccd=%ccd:п=p%" 
SET "ccd=%ccd:р=r%" 
SET "ccd=%ccd:с=s%" 
SET "ccd=%ccd:т=t%" 
SET "ccd=%ccd:у=u%" 
SET "ccd=%ccd:ф=f%" 
SET "ccd=%ccd:х=h%"
SET "ccd=%ccd:ц=ts%" 
SET "ccd=%ccd:ч=ch%" 
SET "ccd=%ccd:ш=sh%" 
SET "ccd=%ccd:щ=sch%" 
SET "ccd=%ccd:ъ="%" 
SET "ccd=%ccd:ы=y%" 
SET "ccd=%ccd:ь=`%" 
SET "ccd=%ccd:э=e%" 
SET "ccd=%ccd:ю=ju%" 
SET "ccd=%ccd:€=ja%" 


rem —обираем им€ дл€ подстановки вначале из 2 первых букв заказчика и 4 последних блока
for /f "delims=\; tokens=3" %%i in ("%ccd%") do set name=%%i
set nname=%name:~0,1%
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%nname%%name:~-4%

:existpar


set n=0
echo %CD% >dbq.bat
for /f "delims=\ tokens=1,2,3,4" %%I in (dbq.bat) do set gdir=%%I/%%J/%%K/%%L
for %%i in (*.gbx) do (
	set /a n+=1 
	ren %%i %nname%%%~ni.gbx 
	copy /Y %nname%%%~ni.gbx "z:\на рисование\miva"
)
if %n% == 0 goto end
set urlq="http://baza4/?level=update&update[act]=phototemplates&user=%username%&filenames=%n%+%gdir%"
echo @d:\bat\tear.exe %urlq% >dbq.bat
call .\dbq.bat
:end
del /q .\dbq.bat
