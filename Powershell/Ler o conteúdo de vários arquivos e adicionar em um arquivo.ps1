#A pasta de destino precisa existir
$pastaLogs="c:\logs\*.txt"
 
 
$arquivos = dir $pastaLogs
foreach ($arquivo in $arquivos){
    Get-Content $arquivo >> c:\temp\log.txt
 
}
