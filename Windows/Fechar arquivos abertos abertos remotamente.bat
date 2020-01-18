net files | find /i "NomeArquivo" > arquivosAbertos.txt
for /f "tokens=1" %%a in (arquivosAbertos.txt) do net files %%a /close