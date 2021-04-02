cd /tmp
wget https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
yum install epel-release -y
yum install postgresql96-server postgresql96-contrib -y
systemctl enable postgresql-9.6

mkdir -p /opt/postgresql
chown -R postgres:postgres /opt/postgresql

systemctl status postgresql-9.6
vim /usr/lib/systemd/system/postgresql-9.6.service

sed -i -e 's/\/var\/lib\/pgsql\/9.6\/data\//\/opt\/postgresql\//g' /usr/lib/systemd/system/postgresql-9.6.service

/usr/pgsql-9.6/bin/postgresql96-setup initdb

systemctl daemon-reload
systemctl start postgresql-9.6

su - postgres
psql -d template1 -c "ALTER USER postgres WITH PASSWORD 'senha';"
psql postgres
createdb banco
create user mirth with encrypted password '23face704d7843e2c3861fc5a38c00a4'
grant all privileges on database mirthdb to banco
\q