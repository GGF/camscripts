chcp 1251>nul 
SETLOCAL ENABLEDELAYEDEXPANSION

set nname=%1

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
