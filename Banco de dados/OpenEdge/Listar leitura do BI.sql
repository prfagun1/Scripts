SELECT database() as Banco, u."_UserIO-Name" as 'Usuario', u."_UserIO-BIRead" as 'Leitura BI', u."_UserIO-BiWrite" as 'EscritaBI'
 FROM PUB."_UserIO" u
 where u."_UserIO-BiRead" > 0 or u."_UserIO-BiWrite" > 0
 order by u."_UserIO-BiWrite" desc