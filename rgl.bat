rem @echo off
chcp 1251>nul 

rem Транслитерируем и удаляем точки и тире из имен плат

set ccd=%cd%
set ccd=%ccd:.=%
set ccd=%ccd:-=%
set "ccd=%ccd:а=a%"
SET "ccd=%ccd:б=b%"
SET "ccd=%ccd:в=v%"
SET "ccd=%ccd:г=g%" 
SET "ccd=%ccd:д=d%"
SET "ccd=%ccd:е=e%"
SET "ccd=%ccd:ё=jo%" 
SET "ccd=%ccd:ж=zh%" 
SET "ccd=%ccd:з=z%" 
SET "ccd=%ccd:и=i%" 
SET "ccd=%ccd:й=j%" 
SET "ccd=%ccd:к=k%" 
SET "ccd=%ccd:л=l%" 
SET "ccd=%ccd:м=m%" 
SET "ccd=%ccd:н=n%" 
SET "ccd=%ccd:о=o%" 
SET "ccd=%ccd:п=p%" 
SET "ccd=%ccd:р=r%" 
SET "ccd=%ccd:с=s%" 
SET "ccd=%ccd:т=t%" 
SET "ccd=%ccd:у=u%" 
SET "ccd=%ccd:ф=f%" 
SET "ccd=%ccd:х=h%"
SET "ccd=%ccd:ц=ts%" 
SET "ccd=%ccd:ч=ch%" 
SET "ccd=%ccd:ш=sh%" 
SET "ccd=%ccd:щ=sch%" 
SET "ccd=%ccd:ъ="%" 
SET "ccd=%ccd:ы=y%" 
SET "ccd=%ccd:ь=`%" 
SET "ccd=%ccd:э=e%" 
SET "ccd=%ccd:ю=ju%" 
SET "ccd=%ccd:я=ja%" 

rem разберем путь
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

rem Проверка уровня
rem диск не тот - закончили
if /i not "%disk%" == "z:" goto end
rem не в заказчиках - тоже не работаем
if /i not "%customer%" == "zakazchiki" goto end
rem прямо в заказчиках - с какой платой работать то?
if "%nname%" == "" goto end
rem где мы?
if "%pname%" == "" (
  echo "Мы в папке с платой"
  rem выгнать gerber
  rem %1 -Mx:\tool\camscripts\creategbx-and-close.scr
  if not exist Legend (
    echo "Создали и перешли в папку с легендой"
    mkdir Legend
  )
  echo "перешли в папку с легендой"
  cd Legend
  if not exist "%name%_cam.pcb" (
    echo "Не было файлов, создадим"
    mkdir %name%_top
    mkdir %name%_bot
    rem Вызвать создание кама
    x:\tool\rem.bat
    rem удалить лишнее
    del /q mpp.s32
  )
) else (
  echo "Мы в легенде или глубже, если не в легенде, то уходим"
  if /i not "%pname%" == "legend" goto end
  if not "%legend%" == "" (
    echo "Мы в папке готовых"
    rem имя как имя проекта
    echo %pname%

    rem В маске метки
    rename pos_m*.* REF.gbr

    rem  В brd.brd Контур
    rename brd*.* LAYER.gbr

    rem  В маркировке - маркировка
    rename pos_r*.* %pname%.gbr
  ) else (
    echo "Скорее всего мы в папке легенды, если уже готовы герберы, то скопировать и переименовать "
    if exist "gerber" (
      copy gerber\brd.brd %name%_top\LAYER.gbr
      copy gerber\brd.brd %name%_bot\LAYER.gbr
      copy gerber\pos_mc.gbx %name%_top\REF.gbr
      copy gerber\pos_ms.gbx %name%_bot\REF.gbr
      copy gerber\pos_rc.gbx %name%_top\%name%_top.gbr
      copy gerber\pos_rs.gbx %name%_bot\%name%_bot.gbr
      rem Если какой-то маркировки нет - удалим лишний каталог
      if not exist %name%_bot\%name%_bot.gbr rmdir /s /q %name%_bot
      if not exist %name%_top\%name%_top.gbr rmdir /s /q %name%_top
      rmdir /s /q gerber
    )
  )
)

:end