if %1.==. goto ggg
pccards %1
goto end
:ggg
for %%i in (*.pcb) do set fff=%%i
pccards %fff%
:end