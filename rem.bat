chcp 1251>nul 
rem ��� ��� ����
copy x:\tool\cam350m.pcb cam.pcb
attrib -R cam.pcb
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

rem �������� ��� ��� ����������� ������� �� 1 ������ ���� ����� � 6 ��������� �����
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%name:~0,1%
for /f "delims=\; tokens=4" %%i in ("%ccd%") do set name=%%i
set nname=%nname%%name:~-6%_cam.pcb
if not exist %nname% ren cam.pcb %nname%

copy z:\igor\mpp16.s32 mpp.s32
ren *.zip origin.zip
ren *.cam *.pcb


rem ��� ��� ������
rem ��������������� �����
ren M*2.gbr mcomp.gbr
ren M*1.gbr msolder.gbr

rem ��������������� comp
rem ���
ren W*2.gbr comp.gbr
rem ���
ren 1*_2.gbr comp.gbr

rem ����������
ren 1*_1.gbr i3.gbr

ren 2*_2.gbr i2.gbr

rem ���� ����
ren 3*_2.gbr i4.gbr
if %errorlevel%==0 ren 2*_1.gbr i5.gbr

rem ���
ren W*1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 dpp.s32

rem ���
ren 2*_1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 mpp4.s32
ren 3*_1.gbr solder.gbr
if %errorlevel%==0 ren mpp.s32 mpp6.s32

rem ���������
ren s*.lnz 2*.frz
ren w*.lnz 2*.mkr
ren l*.lnz 2*.mkr
