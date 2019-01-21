chcp 1251>nul 
SETLOCAL ENABLEDELAYEDEXPANSION

set nname=%1

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


rem —обираем им€ дл€ подстановки вначале из 4 первых букв заказчика и 6 последних блока
for /f "delims=\; tokens=3" %%i in ("%ccd%") do set name=%%i
set nname=%name:~0,4%
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%nname%_%name:~-6%

set n=0
set u=
if "%nname%" neq "" set u=_
echo %u%
echo %nname%

for /r %%i in (*p?.gbx) do (
    set /a n=!n!+1
    echo !n!
    ren %%i %nname%_pos_!n!_KODAK.gbx 
)
for /r %%i in (*n?.gbx) do (
    set /a n=!n!+1
    echo !n!
    ren %%i %nname%_neg_!n!_KODAK.gbx 
)

:end
