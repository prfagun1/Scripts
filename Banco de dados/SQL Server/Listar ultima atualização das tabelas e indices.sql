SELECT OBJECT_NAME(OBJECT_ID) AS DatabaseName, last_user_update,*
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID( 'MATRIX_TST')
order by 2 desc

--segunda versão
SELECT         
     t.name AS Table_Name
        ,i.name AS Index_Name
        ,i.type_desc AS Index_Type
        ,STATS_DATE(i.object_id,i.index_id) AS Date_Updated
FROM         
     sys.indexes i JOIN
     sys.tables t ON t.object_id = i.object_id
WHERE         
     i.type > 0 
ORDER BY
     t.name ASC
    ,i.type_desc ASC
    ,i.name ASC 