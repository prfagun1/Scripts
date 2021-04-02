select database() as 'Banco',
c."_Connect-type" as 'Tipo de conexao', c."_Connect-PID" as 'PID', c."_connect-ipaddress" as 'IP', c."_Connect-CacheInfo" as 'Execucao'
from pub."_connect" c
where c."_Connect-CacheInfo" is not null 