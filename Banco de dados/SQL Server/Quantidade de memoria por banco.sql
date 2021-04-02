SELECT DB_NAME(database_id) AS [Database Name], 
COUNT(*) * 8/1024.0 AS [Cached Size (MB)] 
FROM sys.dm_os_buffer_descriptors 
WHERE database_id > 4 -- system databases 
AND database_id <> 32767 -- ResourceDB 
GROUP BY DB_NAME(database_id)     
ORDER BY [Cached Size (MB)] DESC OPTION (RECOMPILE); 