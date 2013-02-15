@echo off
x:\pcad4\exe\pipe %1
copy %1.plt %1.lat >nul
if not errorlevel 1 del %1.plt
copy %1.kir %1.plt >nul
del %1.kir
pcphoto %1 -s 1 -f 2 4 -o N -m a -c x:\ps_emma\pcphoto\pcphoto.cfg -a x:\ps_emma\pcphoto\pcphoto.apr
