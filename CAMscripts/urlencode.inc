' encodestr
URL_encode:
encodestr1$=""
for n%=1 to len(encodestr$)
	s$=mid$(encodestr$,n%,1)
	select case s$
	case "�"
		s$="%%C0"
	case "�"
		s$="%%C1"
	case "�"
		s$="%%C2"
	case "�"
		s$="%%C3"
	case "�"
		s$="%%C4"
	case "�"
		s$="%%C5"
	case "�"
		s$="%%A8"
	case "�"
		s$="%%C6"
	case "�"
		s$="%%C7"
	case "�"
		s$="%%C8"
	case "�"
		s$="%%C9"
	case "�"
		s$="%%CA"
	case "�"
		s$="%%CB"
	case "�"
		s$="%%CC"
	case "�"
		s$="%%CD"
	case "�"
		s$="%%CE"
	case "�"
		s$="%%CF"
	case "�"
		s$="%%D0"
	case "�"
		s$="%%D1"
	case "�"
		s$="%%D2"
	case "�"
		s$="%%D3"
	case "�"
		s$="%%D4"
	case "�"
		s$="%%D5"
	case "�"
		s$="%%D6"
	case "�"
		s$="%%D7"
	case "�"
		s$="%%D8"
	case "�"
		s$="%%D9"
	case "�"
		s$="%%DA"
	case "�"
		s$="%%DB"
	case "�"
		s$="%%DC"
	case "�"
		s$="%%DD"
	case "�"
		s$="%%DE"
	case "�"
		s$="%%DF"
	case "�"
		s$="%%E0"
	case "�"
		s$="%%E1"
	case "�"
		s$="%%E2"
	case "�"
		s$="%%E3"
	case "�"
		s$="%%E4"
	case "�"
		s$="%%E5"
	case "�"
		s$="%%B8"
	case "�"
		s$="%%E6"
	case "�"
		s$="%%E7"
	case "�"
		s$="%%E8"
	case "�"
		s$="%%E9"
	case "�"
		s$="%%EA"
	case "�"
		s$="%%EB"
	case "�"
		s$="%%EC"
	case "�"
		s$="%%ED"
	case "�"
		s$="%%EE"
	case "�"
		s$="%%EF"
	case "�"
		s$="%%F0"
	case "�"
		s$="%%F1"
	case "�"
		s$="%%F2"
	case "�"
		s$="%%F3"
	case "�"
		s$="%%F4"
	case "�"
		s$="%%F5"
	case "�"
		s$="%%F6"
	case "�"
		s$="%%F7"
	case "�"
		s$="%%F8"
	case "�"
		s$="%%F9"
	case "�"
		s$="%%FA"
	case "�"
		s$="%%FB"
	case "�"
		s$="%%FC"
	case "�"
		s$="%%FD"
	case "�"
		s$="%%FE"
	case "�"
		s$="%%FF"
	case " "
		s$="%%20"
	case "$"
		s$="%%24"
	case "&"
		s$="%%26"
	case "+"
		s$="%%2B"
	case ","
		s$="%%2C"
	case "/"
		s$="%%2F"
	case ":"
		s$="%%3A"
	case ";"
		s$="%%3B"
	case "="
		s$="%%3D"
	case "?"
		s$="%%3F"
	case "@"
		s$="%%40"
	case ">"
		s$="%%3C"
	case "<"
		s$="%%3E"
	case "#"
		s$="%%23"
	case "%%"
		s$="%%25"
	case "{"
		s$="%%7B"
	case "}"
		s$="%%7D"
	case "|"
		s$="%%7C"
	case "\"
		s$="%%5C"
	case "^"
		s$="%%5E"
	case "~"
		s$="%%7E"
	case "["
		s$="%%5B"
	case "]"
		s$="%%5E"
	case "`"
		s$="%%60"
	case else
	end select
	encodestr1$ = encodestr1$+s$
next
encodestr$ = encodestr1$
return
