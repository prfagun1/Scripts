#Apagar rotas
route del -net 10.1.0.0 netmask 255.255.0.0L

#Alterar rota de forma temporária
ip route replace default via 10.0.10.1 dev eth0 

#Alterar rota de forma temporária, segunda forma
route del -net default gateway 10.0.1.10
route add default gw 10.0.10.1