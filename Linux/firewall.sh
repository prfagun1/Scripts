#Criar redirecionamento: 
firewall-cmd --zone=internal --add-forward-port=port=5061:proto=tcp:toaddr=192.168.200.201


#Parar logs de hardware
service mcelogd stop

systemctl stop firewalld 
systemctl disable firewalld 
systemctl enable firewalld 

#Listar zonas: 
firewall-cmd --get-default-zone

#Recarregar configurações: 
firewall-cmd --reload

#Redirecionar porta:
firewall-cmd --zone="public" --add-forward-port=port=8080:proto=tcp:toport=80 --permanent

#Liberar todo o tráfego IPv4:
firewall-cmd --zone=public --add-rich-rule 'rule family="ipv4" source address="all" accept' --permanent

#Liberar todas as portas:
firewall-cmd --permanent --zone=public --add-port=1-65000/tcp

firewall-cmd --permanent --zone=public --add-port=1270 /tcp
iptables -I INPUT -p tcp -m tcp --dport 1270 -j ACCEPT
firewall-cmd --direct --add-rule tcp nat POSTROUTING 0 -o ens192 -j MASQUERADE 
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ens160 -o ens192 -j ACCEPT 
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i ens192 -o ens160 -m state --state RELATED,ESTABLISHED -j ACCEPT 
firewall-cmd --zone=internal --add-forward-port=port=443:proto=tcp:toaddr=192.168.200.201 --permanent
firewall-cmd --zone=internal --add-forward-port=port=50000-59999:proto=tcp:toaddr=192.168.200.201