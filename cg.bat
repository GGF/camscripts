@echo off
for /f "tokens=1,2 delims=: " %%i in ('wmic logicaldisk get caption^,drivetype') do (	if %%j==2 SET fl=%%i)
rem dir %fl%:\8000pos\
rem dir %fl%:\8000neg\
rem dir "Z:\На Рисование\8000pos\"
rem dir "Z:\На Рисование\8000neg\"
set num=0
for /f %%i in ('dir /s /b /a-d "%fl%:\"') do (set /a num+=1)
echo На флешке %num% файлов
set znum=0
for /f %%i in ('dir /s /b /a-d "Z:\На Рисование\"') do (set /a znum+=1)
echo На рисование %znum% файлов
if "%znum%"=="0" goto endcg
if not exist %fl%:\8000pos\ mkdir %fl%:\8000pos\
if not exist %fl%:\8000neg\ mkdir %fl%:\8000neg\
if not exist %fl%:\AGFA8000pos\ mkdir %fl%:\AGFA8000pos\
if not exist %fl%:\AGFA8000neg\ mkdir %fl%:\AGFA8000neg\
rem move "Z:\На Рисование\8000pos\*" %fl%:\8000pos\
rem move "Z:\На Рисование\8000neg\*" %fl%:\8000neg\
rem move "Z:\На Рисование\AGFA8000pos\*" %fl%:\AGFA8000pos\
rem move "Z:\На Рисование\AGFA8000neg\*" %fl%:\AGFA8000neg\
copy /v "Z:\На Рисование\8000pos\*" %fl%:\8000pos\
copy /v "Z:\На Рисование\8000neg\*" %fl%:\8000neg\
copy /v "Z:\На Рисование\AGFA8000pos\*" %fl%:\AGFA8000pos\
copy /v "Z:\На Рисование\AGFA8000neg\*" %fl%:\AGFA8000neg\
del /q "Z:\На Рисование\8000pos\*"
del /q "Z:\На Рисование\8000neg\*"
del /q "Z:\На Рисование\AGFA8000pos\*"
del /q "Z:\На Рисование\AGFA8000neg\*"

:endcg
pause