' utf2chr
' Преобразует UTF-8 в 1251, работает только для русских букв, ну а что еще надо
utf2chr:
  utf2chr1$=""

  russian = 0
  for n%=1 to len(utf2chr$)
    s$=mid$(utf2chr$,n%,1)
    byte = asc(s$)
    'messagebox str$(byte)
    ' от А до п
    if byte = -48 then russian = 304
    ' от А до п не в седьмом каме
    if Version! > 7 and byte = 208 then russian = 48
    ' от р
    if byte = -47 then russian = 368
    ' от p не в седьмом каме
    if Version! > 7 and byte = 209 then russian = 112
    ' отдельными потому что выход из под end if может вызвать проблемы
    if byte = -48  then goto nextbyte
    if byte = -47  then goto nextbyte
    if Version! > 7 and byte = 208 then goto nextbyte
    if Version! > 7 and byte = 209 then goto nextbyte
    'messagebox str$(byte)
    if russian then 
      byte = byte + russian
      russian = 0
    end if
    'messagebox str$(byte)
    s$=chr$(byte)
    utf2chr1$ = utf2chr1$+s$
    nextbyte:
  next
  utf2chr$ = utf2chr1$
return