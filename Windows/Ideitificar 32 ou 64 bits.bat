@echo off
echo %PROCESSOR_ARCHITECTURE% | find "64" > nul
if %ERRORLEVEL% == 0 goto instala64
echo estou executando 32
goto fim

:instala64
echo estou executando 64
goto fim

:fim
echo cheguei no fim