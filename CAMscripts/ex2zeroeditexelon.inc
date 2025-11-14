' подпрограмма редактирования exelon'
'  для скрипта ex2zero 
editexelon:
	itsfrez = -1
	open exelonfile1$ for input as #1
	open exelonfile$ for output as #2

		first=0
		do
			line input #1,s$
			
			if left$(s$,1) = "T" then
				'for i=1 to 10 
				i=1
					fff:
					if frezy(i) = 0 then goto breakfr
					if left$(s$,4) = FMTUSING$("T0#C",frezy(i)) and frezy(i) < 10 then
						' MessageBox FMTUSING$("T0#C",frezy(i)) + str$(i)
						s$ = left$(s$,4) + "-" + MID$(s$,5)
						itsfrez = 1
						goto breakfr
					end if
					if left$(s$,4) = FMTUSING$("T##C",frezy(i)) and frezy(i) >= 10 then
						s$ = left$(s$,4) + "-" + MID$(s$,5)
						itsfrez = 1
						goto breakfr
					end if
					i = i + 1
				if i<=4 then goto fff
				'next
				nnn:
			end if
			breakfr:

			if left$(s$,3) = "M06" then
				'если попадается опциональная остановка, которая в файле стоит в нуле, да еще и сжатом, 
				' поменяем на просто отъезд подальшею В примере указаны координаты X325.0Y770.0
				' 14:28 не получилось :(
				print #2,"M06X0.0Y70.0"
			else
				' писать строку
				' почему f042 я уже не помню
				'if s$<>"" and s$<>"F042" then print #2,s$
				'19-11-2020 убираю все строки задания скорости подачи фрезы, потому что станки сильно умные и сами вычисляют
				if s$<>"" and left$(s$,1) <> "F" then print #2,s$
				
			end if	
			' во фрезеровке не нужна эта шапка
			if (itsfrez = -1) then
				if s$="%" and first=0 then 
					if sz230x395 = 1 then
						print #2,"M47,\P:M16,M2"
						print #2,""
						print #2,"M47,\P:M12,I1,D4.0,T*ImpulsHole*"
						print #2,"X-97.500Y367.500"
						print #2,"X67.500Y367.500"
						print #2,"X-97.500Y7.500"
						print #2,"X67.500Y7.500"
						print #2,""
						print #2,"M47,\P:M01,I1,D4.0,T*ImpulsHole*"
						print #2,"X-97.500Y367.500"
						print #2,"X67.500Y367.500"
						print #2,"X-97.500Y7.500"
						print #2,"X67.500Y7.500"
						print #2,"M47,\P:M99,K1,S1"
						print #2,"G00M09"
					end if
					if sz280x395 = 1 then
						print #2,"M47,\P:M16,M2"
						print #2,""
						print #2,"M47,\P:M12,I1,D4.0,T*ImpulsHole*"
						print #2,"X-122.500Y367.500"
						print #2,"X92.500Y367.500"
						print #2,"X92.500Y7.500"
						print #2,"X-122.500Y7.500"
						print #2,""
						print #2,"M47,\P:M01,I1,D4.0,T*ImpulsHole*"
						print #2,"X-122.500Y367.500"
						print #2,"X92.500Y367.500"
						print #2,"X92.500Y7.500"
						print #2,"X-122.500Y7.500"
						print #2,"M47,\P:M99,K1,S1"
						print #2,"G00M09"
					end if
					if sz485x585 = 1 then
						print #2,"M47,\P:M16,M2"
						print #2,""
						print #2,"M47,\P:M12,I1,D4.0,T*ImpulsHole*"
						print #2,"X-234.950Y558.800"
						print #2,"X205.050Y558.800"
						print #2,"X205.050Y6.300"
						print #2,"X-234.950Y6.300"
						print #2,""
						print #2,"M47,\P:M01,I1,D4.0,T*ImpulsHole*"
						print #2,"X-234.950Y558.800"
						print #2,"X205.050Y558.800"
						print #2,"X205.050Y6.300"
						print #2,"X-234.950Y6.300"
						print #2,"M47,\P:M99,K1,S1"
						print #2,"G00M09"
					end if
					first = 1
				end if
			end if
		loop until EOF(1) = 1
	close #1
	close #2
	kill exelonfile1$
return
