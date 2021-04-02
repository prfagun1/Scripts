SELECT table_name, table_type, engine, TABLE_COMMENT 
   FROM information_schema.tables 
Where 
   TABLE_SCHEMA IN ('mysql','information_schema','performance_schema')
ORDER BY engine DESC