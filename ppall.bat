@echo off
if "%1"=="" goto usage
if "%2"=="" goto usage
if "%3"=="" goto usage
if "%4"=="" goto usage
call p2call
mic
for %%i in (*.plt) do pcphoto %%i -w %1 %2 %3 %4 -s 1 -o N -f 2 4 -m a -c x:\ps_emma\pcphoto\pcphoto.cfg -a x:\ps_emma\pcphoto\pcphoto.apr
goto end
:usage
echo %0 x1 y1 x2 y2
echo
echo %0 - �८�ࠧ�� .PLT 䠩�� � ⥪�饬 ��⠫���
echo ���砫� �८�ࠧ�� � ���᪨� �㪢�
echo ��⮬ ��뢠�� mic
echo ��᫥ pcphoto ��� ������� 䠩�� c �������ࠬ� � ���䨣��樥� �� x:\ps_emma\pcphoto
echo ��ࠬ���� - ���न���� ���� �८�ࠧ������
echo ��ଠ� 4.2, ��᮫����, ��ଠ�쭠� �ਥ����, ����⠡ - 1
:end
