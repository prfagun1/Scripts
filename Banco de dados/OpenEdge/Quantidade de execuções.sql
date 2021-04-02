select database() as 'Banco', c."_Connect-CacheInfo" as 'Execucao', count(c."_Connect-CacheInfo") as 'Quantidade'
from pub."_connect" c
where c."_Connect-CacheInfo" is not null
group by c."_Connect-CacheInfo"
order by 3 desc