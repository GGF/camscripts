rem @echo off
chcp 1251>nul 

rem ��������������� � ������� ����� � ���� �� ���� ����

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

rem �������� ����
for /f "delims=\; tokens=1,2,4,5,6" %%i in ("%ccd%") do (
  set disk=%%i
  set customer=%%j
  set nname=%%k
  set pname=%%l
  set legend=%%m
)

echo %nname%
set name=%nname:~0,1%
set name=%name%%nname:~-6%
echo %name%

rem �������� ������
rem ���� �� ��� - ���������
if /i not "%disk%" == "z:" goto end
rem �� � ���������� - ���� �� ��������
if /i not "%customer%" == "zakazchiki" goto end
rem ����� � ���������� - � ����� ������ �������� ��?
if "%nname%" == "" goto end
rem ��� ��?
if "%pname%" == "" (
  echo "�� � ����� � ������"
  rem ������� gerber
  rem %1 -Mx:\tool\camscripts\creategbx-and-close.scr
  if not exist Legend (
    echo "������� � ������� � ����� � ��������"
    mkdir Legend
  )
  echo "������� � ����� � ��������"
  cd Legend
  if not exist "%name%_cam.pcb" (
    echo "�� ���� ������, ��������"
    mkdir %name%_top
    mkdir %name%_bot
    rem ������� �������� ����
    x:\tool\rem.bat
    rem ������� ������
    del /q mpp.s32
  )
) else (
  echo "�� � ������� ��� ������, ���� �� � �������, �� ������"
  if /i not "%pname%" == "legend" goto end
  if not "%legend%" == "" (
    echo "�� � ����� �������"
    rem ��� ��� ��� �������
    echo %pname%

    rem � ����� �����
    rename pos_m*.* REF.gbr

    rem  � brd.brd ������
    rename brd*.* LAYER.gbr

    rem  � ���������� - ����������
    rename pos_r*.* %pname%.gbr
  ) else (
    echo "������ ����� �� � ����� �������, ���� ��� ������ �������, �� ����������� � ������������� "
    if exist "gerber" (
      copy gerber\brd.brd %name%_top\LAYER.gbr
      copy gerber\brd.brd %name%_bot\LAYER.gbr
      copy gerber\pos_mc.gbx %name%_top\REF.gbr
      copy gerber\pos_ms.gbx %name%_bot\REF.gbr
      copy gerber\pos_rc.gbx %name%_top\%name%_top.gbr
      copy gerber\pos_rs.gbx %name%_bot\%name%_bot.gbr
      rem ���� �����-�� ���������� ��� - ������ ������ �������
      if not exist %name%_bot\%name%_bot.gbr rmdir /s /q %name%_bot
      if not exist %name%_top\%name%_top.gbr rmdir /s /q %name%_top
      rmdir /s /q gerber
    )
  )
)

:end