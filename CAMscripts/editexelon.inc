' подпрограмма редактирования exelon'
editexelon:
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
						goto breakfr
					end if
					if left$(s$,4) = FMTUSING$("T##C",frezy(i)) and frezy(i) >= 10 then
						s$ = left$(s$,4) + "-" + MID$(s$,5)
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
				if s$<>"" and s$<>"F042" then print #2,s$
			end if	
			if s$="%" and first=0 then 
				if sz485x585 = 1 then
					print #2,USING "G93X-##.###Y#.###"; STX#; STY#
				else
					print #2,USING "G93X-##.###Y##.###"; STX#; STY#
				end if
				first = 1
			end if
		loop until EOF(1) = 1
	close #1
	close #2
	kill exelonfile1$
return
