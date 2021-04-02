select 	l."_Lock-Usr" as 'ID',
		l."_Lock-Name" as 'Usuario',
		c."_Connect-IPAddress" as 'IP',
		l."_Lock-Flags" as 'Tipo 1',
		l."_Lock-Type" as 'Tipo 2',
		tb.TBL as 'Tabela',
		l."_Lock-RecId" as 'Registro',
		database() as 'Banco',
		c."_Connect-Pid" as 'PID SO',
		t."_Trans-Duration" as 'Tempo Segundos',
		'Bloqueador' as 'Status'
from PUB."_Lock" l
cross join sysprogress.SYSTABLES tb
cross join pub."_connect" c
left join pub."_trans" t on
		t."_Trans-Usrnum" = c."_Connect-Usr"
join PUB."_Lock" l1 on 
		l1."_Lock-Usr" is not null
		and l1."_Lock-Table" = l."_Lock-Table"
		and l1."_Lock-RecId" = l."_Lock-RecId"
		and l1."_Lock-Flags" like '%Q%'
where
	c."_Connect-Usr" = l."_Lock-Usr"
	and l."_Lock-Usr" is not null
	and l."_Lock-Table" = tb."ID"
	and l."_Lock-Flags" not like '%Q%'


union

select 	l."_Lock-Usr" as 'ID',
		l."_Lock-Name" as 'Usuario',
		c."_Connect-IPAddress" as 'IP',
		l."_Lock-Flags" as 'Tipo 1',
		l."_Lock-Type" as 'Tipo 2',
		tb.TBL as 'Tabela',
		l."_Lock-RecId" as 'Registro',
		database() as 'Banco',
		c."_Connect-Pid" as 'PID SO',
		t."_Trans-Duration" as 'Tempo Segundos',
		'Bloqueado' as 'Status'
from PUB."_Lock" l
cross join sysprogress.SYSTABLES tb
cross join pub."_connect" c
left join pub."_trans" t on
		t."_Trans-Usrnum" = c."_Connect-Usr"
where 	l."_Lock-Flags" like '%Q%'
		and c."_Connect-Usr" = l."_Lock-Usr"
		and l."_Lock-Usr" is not null
		and l."_Lock-Table" = tb."ID"
