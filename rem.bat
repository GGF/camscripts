rem Это для всех
copy x:\tool\cam350m.pcb cam.pcb
attrib -R cam.pcb
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
