select 	database() as Banco,
		u."_UserIO-Name" as 'Usuario',
		u."_UserIO-BiWrite" as 'EscritaBI',
		u."_UserIO-BIRead" as 'LeituraBI',
		c."_Connect-Time" as 'DataConexao',
		t."_Trans-txtime" as 'InicioTransacao',
		t."_Trans-Duration" as 'TempoSegundos',
		c."_Connect-Name" as 'Usuario',
		c."_Connect-IPAddress" as 'IP',
		c."_Connect-Pid" as 'PID SO',
		c."_Connect-ClientType" as 'TipoConexao',
		c."_Connect-CacheInfo" as 'Execucao'
from pub."_trans" t, pub."_connect" c, PUB."_UserIO" u
where 	u."_UserIO-BiWrite" > 0
		and t."_Trans-State" = 'ACTIVE'
		and t."_Trans-Usrnum" = c."_Connect-Usr"
		and c."_Connect-Usr" = u."_UserIO-Usr"
order by u."_UserIO-BiWrite" desc