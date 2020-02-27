' закрыть текущий без сохранения'
if closefile% then 
	if Version! > 7 then 
		setquit@ 
	else 
	' в седьмом каме нет закрытия. Пришлось делать средствами системы. Закрывая с детьми taskkill /t убивал и бат файл, не давая удалить себя. Тасклист резал вывод по /v, пришлось вывод списком делать и фильстровать только имя файла.'
		open path$+"closecam.bat" for output as #1
			print #1,"chcp 1251"
			print #1,"for /f "+chr$(34)+"usebackq tokens=2"+chr$(34)+" %%a in (`tasklist ^| find "+chr$(34)+"camnt95"+chr$(34)+"`) do ("
			print #1,"tasklist /v /fi "+chr$(34)+"PID eq %%a"+chr$(34)+" /fo list | find "+chr$(34)+"pcb"+chr$(34)+" | find "+chr$(34)+"\"+shortfilename$+chr$(34)+" /c >nul && taskkill /PID %%a /F"
			print #1,")"
			print #1,"erase /f /q "+chr$(34)+path$+"closecam.bat"+chr$(34)
		close #1

		s1$ = chr$(34)+path$+"closecam.bat"+chr$(34)
		WinExec s1$,MinimizedNoFocus
	end if
end if
' тут конец, выйти (exit, break)