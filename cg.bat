@echo off
for /f "tokens=1,2 delims=: " %%i in ('wmic logicaldisk get caption^,drivetype') do (	if %%j==2 SET fl=%%i)
rem dir %fl%:\8000pos\
rem dir %fl%:\8000neg\
rem dir "Z:\�� ��ᮢ����\8000pos\"
rem dir "Z:\�� ��ᮢ����\8000neg\"
set num=0
for /f %%i in ('dir /s /b /a-d "%fl%:\"') do (set /a num+=1)
echo �� 䫥誥 %num% 䠩���
set znum=0
for /f %%i in ('dir /s /b /a-d "Z:\�� ��ᮢ����\"') do (set /a znum+=1)
echo �� �ᮢ���� %znum% 䠩���
if "%znum%"=="0" goto endcg
if not exist %fl%:\8000pos\ mkdir %fl%:\8000pos\
if not exist %fl%:\8000neg\ mkdir %fl%:\8000neg\
if not exist %fl%:\AGFA8000pos\ mkdir %fl%:\AGFA8000pos\
if not exist %fl%:\AGFA8000neg\ mkdir %fl%:\AGFA8000neg\
rem move "Z:\�� ��ᮢ����\8000pos\*" %fl%:\8000pos\
rem move "Z:\�� ��ᮢ����\8000neg\*" %fl%:\8000neg\
rem move "Z:\�� ��ᮢ����\AGFA8000pos\*" %fl%:\AGFA8000pos\
rem move "Z:\�� ��ᮢ����\AGFA8000neg\*" %fl%:\AGFA8000neg\
copy /v "Z:\�� ��ᮢ����\8000pos\*" %fl%:\8000pos\
copy /v "Z:\�� ��ᮢ����\8000neg\*" %fl%:\8000neg\
copy /v "Z:\�� ��ᮢ����\AGFA8000pos\*" %fl%:\AGFA8000pos\
copy /v "Z:\�� ��ᮢ����\AGFA8000neg\*" %fl%:\AGFA8000neg\
del /q "Z:\�� ��ᮢ����\8000pos\*"
del /q "Z:\�� ��ᮢ����\8000neg\*"
del /q "Z:\�� ��ᮢ����\AGFA8000pos\*"
del /q "Z:\�� ��ᮢ����\AGFA8000neg\*"

:endcg
pause