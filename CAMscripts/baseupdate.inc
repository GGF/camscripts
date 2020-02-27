' записать данные в базу
' добавлением скрипта пути и имена определяем заказчика и блок'
' параметром dopurl$ определяем действие update и дополнительные параметры'
' параметр outfile$ определяет куда записать вывод и выполняет этот получившийся батфайл, может быть пустым'
' после очередного обновления windows нужно curl копировать в локальный каталог'
encodestr$=customer$
gosub URL_encode
customer$=LTRIM$(RTRIM$(encodestr$))
encodestr$=board$
gosub URL_encode
board$=LTRIM$(RTRIM$(encodestr$))

break
url$="d:\bat\curl "
url$=url$+" -o "+outfile$+ " "
url$=url$+chr$(34)
url$=url$+"http://baza4.mpp/?customer="
url$=url$+customer$
url$=url$+"&board="
url$=url$+board$
' квадратные скобки экранируются для curl'
url$=url$+"&level=update&update\[act\]="
' длинный dopurl "мажет память"' 21-02-2014 но я полечил отрезав от гапсов лишние знаки после запятой
url$=url$+dopurl$
url$=url$+chr$(34)

disk$=left$(path$,2)

open path$+"dbq.bat" for output as #1
	print #1,"chcp 1251"
	print #1,disk$
	print #1,"cd "+path$
	print #1,url$
	print #1,outfile$
	'print #1,"pause"
close #1

s1$ = chr$(34)+path$+"dbq.bat"+chr$(34)
WinCall s1$,MinimizedNoFocus,done%

kill path$+"dbq.bat"

goto bu_endscript

!INCLUDE "urlencode.inc"

bu_endscript: