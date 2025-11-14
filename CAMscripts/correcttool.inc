' подпрограмма корекции параметров инструментов'
corecttool:
	lines%=0

	OPEN tablefile$ FOR INPUT as #1
		' тут бы не плохо условие linrs<200? а то выход за массив будет, но пусть лучше падает скрипт'
		DO WHILE NOT EOF (1) =1
			lines% = lines% + 1;
			INPUT #1, d#(lines%), if#(lines%), of#(lines%), r#(lines%)
			frezy(lines%)=0
		LOOP
	CLOSE #1

	' пройти только по нужному слою'
	setlayer@ selected_layer
	table = tooltable!
	number = 1;
	fre=1;
	for i=1 to Highesttoolref! 
		set_current_toolref@ i
		if Toolused! =1 then
			sizes#(number)=toolsize!
			numbers(number)=i
			number=number+1
		else
			nc_delete_tool@ table,i
		end if
	next
	number=number-1
	'sort'
	for j=1 to number-1
		for i=1 to number-j
			if sizes#(i)>sizes#(i+1) then
				temp#=sizes#(i)
				sizes#(i)=sizes#(i+1)
				sizes#(i+1) = temp#
				temp=numbers(i)
				numbers(i)=numbers(i+1)
				numbers(i+1)=temp
			end if
		next
	next
	' end sort'
	' renumber '
	for i=1 to number
		nc_set_tool_id@ table,numbers(i),i
	next
	'end renumber'

	for i=1 to number 
		toolref = numbers(i)
		set_current_toolref@ toolref
		
		if tooltype! = 2 then goto freza

		for index=1 to lines%
			if d#(index)=toolsize! then exit for
		next
		if index>lines% then goto notoolintable
		if units! = 1 then
			nc_set_tool_infeed@ table,toolref,if#(index)*10/6
			nc_set_tool_outfeed@ table,toolref,of#(index)*10/6
		else
			nc_set_tool_infeed@ table,toolref,if#(index)*10/6
			nc_set_tool_outfeed@ table,toolref,of#(index)*10/6
		end if
		nc_set_tool_rpms@ table,toolref,r#(index)*1000
		goto notoolintable
		
		freza:
		'print_msg "Есть фреза!" + CR!
		'messagebox "frzexist!","frzexist",OK
		frezy(fre) = Toolnum! 'было i вместо Toolnum!'
		fre = fre + 1
		nc_set_tool_infeed@ table,toolref,8.3333
		nc_set_tool_outfeed@ table,toolref,75
		nc_set_tool_rpms@ table,toolref,30000
		ts# = toolsize!
		if ts# < 1 then
			ts# = 1 ' проверка на маленькие фрезы'
		end if
		nc_set_tool_feedrate@ table,toolref,ts#*10/6 'преобразование
		'25-05-2016 корекция фидрейта для Плюритек и Минима'
		if minimafr=1 then
			if ts#=1 then
				nc_set_tool_feedrate@ table,toolref,4 
			end if
			if ts#=2 then
				nc_set_tool_feedrate@ table,toolref,15 
			end if
			if ts#=3 then
				nc_set_tool_feedrate@ table,toolref,16 
			end if
		end if
		notoolintable:
	next

return
