#Listar programas instalados
rpm -qa

#Desinstalar
rpm -e OB2-CORE-A.07.00-1

#Instalar
rpm –ivh pacote.rpm

#Listar Fabricante do device
cat /sys/block/sda/device/vendor
