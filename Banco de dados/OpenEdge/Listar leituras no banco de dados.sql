--Listar leituras no banco de dados

SELECT  distinct top 5 c."_Connect-IPAddress" as 'IP',
			c."_Connect-Type" as 'Tipo conexao',
			c."_Connect-Name" as 'Usuario',
			c."_Connect-Pid" as 'PID',
			f."_File-Name" as 'Tabela',
			u."_UserTableStat-Read" as 'Leituras',
			u."_UserTableStat-Create" as 'Escritas',
			u."_UserTableStat-Update" as 'Alteracoes',
			u."_UserTableStat-Delete" as 'Remocoes',
			database() as 'Banco'
FROM PUB."_UserTableStat" u, PUB."_File" f, PUB."_Connect" c
where (u."_UserTableStat-Read" > 0 
			or u."_UserTableStat-Create" > 0
			or u."_UserTableStat-Update" > 0
			or u."_UserTableStat-Delete" > 0)
			and f."_File-Number" = u."_UserTableStat-Num"
			and c."_Connect-Id" = u."_UserTableStat-Conn" + 1
order by u."_UserTableStat-Read" desc


--Segunda versão, somente com conexões remotas

SELECT distinct 
	c."_Connect-IPAddress", c."_Connect-Type", c."_Connect-Name", c."_Connect-Pid",
	f."_File-Name", u."_UserTableStat-Read", u."_UserTableStat-Create", u."_UserTableStat-Update", u."_UserTableStat-Delete"
FROM PUB."_UserTableStat" u, PUB."_File" f, PUB."_Connect" c
where (u."_UserTableStat-Read" > 0
or u."_UserTableStat-Create" > 0
or u."_UserTableStat-Update" > 0
or u."_UserTableStat-Delete" > 0)
and f."_File-Number" = u."_UserTableStat-Num"
and c."_Connect-Id" = u."_UserTableStat-Conn" + 1
and c."_Connect-Type" <> 'SELF'

order by u."_UserTableStat-Read"" desc

--select * from PUB."_Connect" c where c."_Connect-Pid" = 127637


--Terceira versão - somente com tabelas

select f."_file-name", t."_tablestat-create", t."_tablestat-update", t."_tablestat-read", t."_tablestat-delete"
from PUB."_tablestat" t, PUB."_file" f
where f."_file-number" =  t."_tablestat-id"
order by t."_tablestat-read" desc