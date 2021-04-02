select top 10	database() as 'Banco', 
		f."_File-Name" as 'Tabela',
		t."_TableStat-read" as 'Read',
		t."_TableStat-update" as 'Update',
		t."_TableStat-create" as 'Insert',
		t."_TableStat-delete" as 'Delete'
from PUB."_TableStat" t, PUB."_File" f
where f."_File-Number" = t."_tablestat-id"
order by 3 desc
