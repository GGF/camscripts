chcp 1251>nul 
rem Это для всех
copy x:\tool\cam350m.pcb cam.pcb
attrib -R cam.pcb
set ccd=%cd%
set ccd=%ccd:.=%
set ccd=%ccd:-=%
set "ccd=%ccd:а=a%"
SET "ccd=%ccd:б=b%"
SET "ccd=%ccd:в=v%"
SET "ccd=%ccd:г=g%" 
SET "ccd=%ccd:д=d%"
SET "ccd=%ccd:е=e%"
SET "ccd=%ccd:ё=jo%" 
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
SET "ccd=%ccd:я=ja%" 

rem Собираем имя для подстановки вначале из 1 первых букв блока и 6 последних блока
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%name:~0,1%
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%nname%%name:~-6%_cam.pcb
if not exist %nname% ren cam.pcb %nname%

copy z:\igor\mpp16.s32 mpp.s32
ren *.zip origin.zip
ren *.cam *.pcb


rem Это для Авроры
rem Переименовываем маски
ren M*2.gbr mcomp.gbr
ren M*1.gbr msolder.gbr

rem Переименовываем comp
rem ДПП
ren W*2.gbr comp.gbr
rem МПП
ren 1*_2.gbr comp.gbr

rem Внутренние
ren 1*_1.gbr i3.gbr

ren 2*_2.gbr i2.gbr

rem Если есть
ren 3*_2.gbr i4.gbr
if %errorlevel%==0 ren 2*_1.gbr i5.gbr

rem ДПП
ren W*1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 dpp.s32

rem МПП
ren 2*_1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 mpp4.s32
ren 3*_1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 mpp6.s32

rem Сверловки
ren s*.lnz 2*.frz
ren w*.lnz 2*.mkr
ren l*.lnz 2*.mkr
