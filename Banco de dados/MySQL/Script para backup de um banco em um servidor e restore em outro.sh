usuario=root
senha=senhaUsada
servidor=10.0.0.xx
listagemBancos="banco1 banco2 banco3"

for banco in $listagemBancos
do
        mysqldump -h $servidor -u$usuario -p$senha $banco > /backup/MySQL/backup-$banco.dump
        mysql -u$usuario -p$senha -e "drop schema $banco"
        mysql -u$usuario -p$senha -e "create schema $banco"
        mysql -u$usuario -p$senha $banco < /backup/MySQL/backup-$banco.dump
done