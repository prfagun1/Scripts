mes=$(date +%m)
ano=$(date +%Y)
caminhoDestino=/tmp/$ano/$mes
mkdir -p $caminhoDestino

#Move os arquivos mais velhos que 1 dia
find /opt/caminhoOrigem -type f -mtime +1 -exec mv {} $caminhoDestino \;

