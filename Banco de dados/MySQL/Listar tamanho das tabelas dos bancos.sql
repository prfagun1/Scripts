SELECT @@hostname as `Servidor`,
     t.table_schema as `Banco`, 
     t.table_name AS `Tabela`, 
     round(((t.data_length + t.index_length) / 1024 / 1024), 2) `Tamanho em MB` 
FROM information_schema.TABLES t
where t.table_schema not in ('information_Schema', 'test', 'mysql', 'performance_schema')
ORDER BY table_schema, (data_length + index_length) DESC;