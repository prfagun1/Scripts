select 	distinct database() as 'Banco',
		c."_Connect-Id" as 'ID',
		c."_Connect-Time" as 'Data Conexao',
		t."_Trans-txtime" as 'Inicio Transacao',
		t."_Trans-Duration" as 'Tempo Segundos',
		c."_Connect-Name" as 'Usuario',
		c."_Connect-IPAddress" as 'IP',
		c."_Connect-Pid" as 'PID SO',
		t.TBL as 'Tabela',
		l."_Lock-Flags" as 'Tipo'
from 	pub."_trans" t, pub."_connect" c, PUB."_Lock" l, sysprogress.SYSTABLES t
where 	t."_Trans-State" = 'ACTIVE'
		and t."_Trans-Usrnum" = c."_Connect-Usr"
		and c."_Connect-Usr" = l."_Lock-Usr"
		and l."_Lock-Table" = t."ID"
		
order by t."_Trans-Duration"  desc