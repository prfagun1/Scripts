#Listar arquivos que estão abertos pelo sistema operacional
lsof /opt | grep "deleted" | sort -k7 -n

#Apagar estes arquivos
#Acessar a pasta /proc/numero do processo/fd
ls -la numero informado na 4 coluna, para o exemplo "_proapsv  103469        root  548ur  REG 253,17 1939946640  284282 /opt/teste.log (deleted)"

#Será 548
#Para zerar o arquivo: > 548