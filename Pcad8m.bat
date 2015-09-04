@echo off
title PCAD8
SET PCADDRV=X:\PCADCFG\Win2k
if not exist %PCADDRV%\PCADDRV.SYS goto no_sys
PATH=X:\PCAD8\EXE;x:\tool;c:\bat;c:\windows;c:\windows\system32;c:\windows\system32\wbem
goto END
rem********************* ERRORS *******************
:no_sys
echo File %PCADDRV%\PCADDRV.SYS not exist !
goto end
:end
