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
echo %0 - преобразует .PLT файлы в текущем каталоге
echo Сначала преобразует в русские буквы
echo Потом вызывает mic
echo После pcphoto для каждого файла c аппертурами и конфигурацией из x:\ps_emma\pcphoto
echo Параметры - координаты окна преобразования
echo Формат 4.2, абсолюьтные, нормальная ориентация, масштаб - 1
:end
