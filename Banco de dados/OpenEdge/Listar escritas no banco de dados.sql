SELECT  distinct top 5	c."_Connect-IPAddress" as 'IP',
			c."_Connect-Type" as 'Tipo conexao',
			c."_Connect-Name" as 'Usuario',
			c."_Connect-Pid" as 'PID',
			f."_File-Name" as 'Tabela',
			u."_UserTableStat-Create" as 'Escritas',
			u."_UserTableStat-Read" as 'Leituras',
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
order by u."_UserTableStat-Create" desc
