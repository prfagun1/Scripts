#Link para download:  https://yum.postgresql.org/packages/#pg13

#Desabilitar o repositório nativo:
dnf -qy module disable postgresql

#Instalação do repositório
dnf install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm


#Instalar pacotes
dnf install postgresql13 postgresql13-server rsync -y


#Criar pasta da base e ajustar permissoes:
mkdir -p /opt/postgresql
chmod 700 /opt/postgresql/

#Iniciar banco:
/usr/pgsql-13/bin/postgresql-13-setup initdb

#Parar o banco
systemctl stop postgresql-13

#Mover pasta do banco:
rsync -av  /var/lib/pgsql/13/data/ /opt/postgresql/


#Ajustar o arquivo de configuração para a nova pasta da base
sed -i "s:^#data_directory.*$:data_directory = '/opt/postgresql/':g" /var/lib/pgsql/13/data/postgresql.conf


#Apagar os arquivos e pastas
rm -rf /opt/postgresql/pg_hba.conf
rm -rf /opt/postgresql/pg_ident.conf 
rm -rf /opt/postgresql/postgresql.auto.conf 
rm -rf /opt/postgresql/postgresql.conf 
rm -rf /var/lib/pgsql/13/data/base/*


#Habilitar e iniciar serviço
systemctl enable --now postgresql-13
systemctl start postgresql-13


#Para confirmar a pasta:
su - postgres
psql
SHOW data_directory;


#Ajustar senha do administrador
su - postgres 
psql -c "alter user postgres with password 'senha para ajustar'"

psql -c "alter user postgres with password '9b826ee5703ecbd603ec85531d3e0810'"


#Habilitar acesso remoto
sed -i "s:^#listen_addresses.*$:listen_addresses = '0.0.0.0':g" /var/lib/pgsql/13/data/postgresql.conf
echo 'host    all             all             10.0.0.0/16             md5' >> /var/lib/pgsql/13/data/pg_hba.conf


#Reiniciar serviço
systemctl restart postgresql-13


#Testar acesso ao banco
psql -U <dbuser> -h <serverip> -p 5432 <dbname>
