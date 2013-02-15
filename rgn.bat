chcp 1251
set n=0
echo %CD% >dbq.bat
for /f "delims=\ tokens=1,2,3,4" %%I in (dbq.bat) do set gdir=%%I/%%J/%%K/%%L
for %%i in (pos*KODAK.gbx) do set /a n+=1 & ren %%i %1_%%~ni.gbx & copy /Y %1_%%~ni.gbx "z:\на рисование\8000pos"
for %%i in (neg*KODAK.gbx) do set /a n+=1 & ren %%i %1_%%~ni.gbx & copy /Y %1_%%~ni.gbx "z:\на рисование\8000neg"
for %%i in (pos*AGFA.gbx) do set /a n+=1 & ren %%i %1_%%~ni.gbx & copy /Y %1_%%~ni.gbx "z:\на рисование\AGFA8000pos"
for %%i in (neg*AGFA.gbx) do set /a n+=1 & ren %%i %1_%%~ni.gbx & copy /Y %1_%%~ni.gbx "z:\на рисование\AGFA8000neg"
if %n% == 0 goto end
set urlq="http://baza4/?level=update&update[act]=phototemplates&user=%username%&filenames=%n%+%gdir%"
echo @tear.exe %urlq% >dbq.bat
call .\dbq.bat
:end
del /q .\dbq.bat
