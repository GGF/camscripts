@echo off
chcp 1251>nul 

set nname=%1

if "%nname%" neq "" goto existpar
rem ���� ���� �������� ���� ������ ��� ������

dir neg* >nul
if %errorlevel%==1 goto checkpos
rem ���� ��� ������ ������������ �� neg, �� ��������� �� ������� ������ �� pos
goto existneg

:checkpos
dir pos* >nul
if %errorlevel%==1 goto existpar
rem ���� ��� �� ��� �� ������ ���� ��� ������ ��� ���������, �� ���� ������ ��������� �� ��������� ��, ��� ����.

rem ����� ���� ��������������� � ������� ����� � ���� �� ���� ����

:existneg

set ccd=%cd%
set ccd=%ccd:.=%
set ccd=%ccd:-=%
set "ccd=%ccd:�=a%"
SET "ccd=%ccd:�=b%"
SET "ccd=%ccd:�=v%"
SET "ccd=%ccd:�=g%" 
SET "ccd=%ccd:�=d%"
SET "ccd=%ccd:�=e%"
SET "ccd=%ccd:�=jo%" 
SET "ccd=%ccd:�=zh%" 
SET "ccd=%ccd:�=z%" 
SET "ccd=%ccd:�=i%" 
SET "ccd=%ccd:�=j%" 
SET "ccd=%ccd:�=k%" 
SET "ccd=%ccd:�=l%" 
SET "ccd=%ccd:�=m%" 
SET "ccd=%ccd:�=n%" 
SET "ccd=%ccd:�=o%" 
SET "ccd=%ccd:�=p%" 
SET "ccd=%ccd:�=r%" 
SET "ccd=%ccd:�=s%" 
SET "ccd=%ccd:�=t%" 
SET "ccd=%ccd:�=u%" 
SET "ccd=%ccd:�=f%" 
SET "ccd=%ccd:�=h%"
SET "ccd=%ccd:�=ts%" 
SET "ccd=%ccd:�=ch%" 
SET "ccd=%ccd:�=sh%" 
SET "ccd=%ccd:�=sch%" 
SET "ccd=%ccd:�="%" 
SET "ccd=%ccd:�=y%" 
SET "ccd=%ccd:�=`%" 
SET "ccd=%ccd:�=e%" 
SET "ccd=%ccd:�=ju%" 
SET "ccd=%ccd:�=ja%" 


rem �������� ��� ��� ����������� ������� �� 4 ������ ���� ��������� � 6 ��������� �����
for /f "delims=\; tokens=3" %%i in ("%ccd%") do set name=%%i
set nname=%name:~0,4%
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%nname%_%name:~-6%

:existpar

set n=0
set u=
if "%nname%" neq "" set u=_
echo %u%
echo %CD% >dbq.bat
for /f "delims=\ tokens=1,2,3,4" %%I in (dbq.bat) do set gdir=%%I/%%J/%%K/%%L
for %%i in (*pos*KODAK.gbx) do set /a n+=1 & ren %%i %nname%%u%%%~ni.gbx & copy /Y %nname%%u%%%~ni.gbx "z:\�� ���������\8000pos"
for %%i in (*neg*KODAK.gbx) do set /a n+=1 & ren %%i %nname%%u%%%~ni.gbx & copy /Y %nname%%u%%%~ni.gbx "z:\�� ���������\8000neg"
for %%i in (*pos*AGFA.gbx) do set /a n+=1 & ren %%i %nname%%u%%%~ni.gbx & copy /Y %nname%%u%%%~ni.gbx "z:\�� ���������\AGFA8000pos"
for %%i in (*neg*AGFA.gbx) do set /a n+=1 & ren %%i %nname%%u%%%~ni.gbx & copy /Y %nname%%u%%%~ni.gbx "z:\�� ���������\AGFA8000neg"
if %n% == 0 goto end
set urlq="http://baza4/?level=update&update[act]=phototemplates&user=%username%&filenames=%n%+%gdir%"
echo @d:\bat\tear.exe %urlq% >dbq.bat
call .\dbq.bat
:end
del /q .\dbq.bat
