SELECT        @@hostname as `Servidor`,
		t.table_schema AS "Banco de dados",
		SUM(t.data_length + t.index_length) / 1024 / 1024 AS "Tamanho em (MB)"
FROM information_schema.TABLES t
where t.table_schema not in ('information_Schema', 'test', 'mysql', 'performance_schema')
GROUP BY table_schema ;
