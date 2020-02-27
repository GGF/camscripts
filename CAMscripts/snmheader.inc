' подпрограмма создания заголовка для zieb und mayer'
createheader:
	open head$ for output as #1
		print #1,"%%3000"
		' двусторонние вычисление высоты первой кнопки для фрезеровки кратной 10'
		if mpp = -1 then
			zz%=((Y%-180)/2)/10
			Z#=zz%*10
			if Z#<=0 then Z#=10
			xprob# = 10
		else
			if sz485x585 = 1 then
			' 4-06-2018'
				Z#=202.5
				xprob# = 10
			end if
		end if

		print #1, USING "M47, ###*###  ##";X%;Y%;Z#

		' сверловки для многослоек'
		if fr <> 1 then
			if hh = 2 then
				ny#=-6.25
				nx# = -X%/2.0
				if sz230x395 = 1 then
					nx#=-115
					ny#=70
				end if
				if sz280x395 = 1 then
					nx#=-140
					ny#=70
				end if
				if sz280x380 = 1 then
					nx#=-140
					ny#=85
				end if
			end if
			if hh=4 then
				'07-04-2017 двусторонние будут делаться на штифтах'
				ny# = 100.75 ' это высилялось как y координата нижнего штифта минус 6.25
				nx# = 270-X%/2.0 ' это x координата штифта
				if sz230x395 = 1 then
					nx#=150
					ny#=203.0
				end if
				if sz280x395 = 1 then
					nx#=125
					ny#=203.0
				end if
				if sz485x585 = 1 then
					nx#=27.5
					ny#=115
				end if
			end if
		else
			'Фрезеровка'
			nullx# = 99.375
			nully# = 277.375
			nx# = nullx#-xprob#
			ny# = nully#-Z#
		end if

		print #1, USING "X##.###Y##.###M50";nx#;ny#
	close #1
return
