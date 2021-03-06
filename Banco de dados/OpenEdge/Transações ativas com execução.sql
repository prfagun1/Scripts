select 	database() as Banco,
		c."_Connect-Id" as 'ID',
		c."_Connect-Time" as 'DataConexao',
		t."_Trans-txtime" as 'InicioTransacao',
		t."_Trans-Duration" as 'TempoSegundos',
		c."_Connect-Name" as 'Usuario',
		c."_Connect-IPAddress" as 'IP',
		c."_Connect-Pid" as 'PID SO',
		c."_Connect-ClientType" as 'TipoConexao',
		c."_Connect-CacheInfo" as 'Execucao'
from pub."_trans" t, pub."_connect" c
where t."_Trans-State" = 'ACTIVE'
		and t."_Trans-Usrnum" = c."_Connect-Usr"
order by t."_Trans-Duration"  desc
