SELECT OBJECT_NAME(a.object_id), b.name AS IndexName, 
  a.avg_fragmentation_in_percent AS PercentFragment,
  a.fragment_count AS TotalFrags,
  a.avg_fragment_size_in_pages AS PagesPerFrag,
  a.page_count AS NumPages
FROM sys.dm_db_index_physical_stats(DB_ID(), NULL, NULL, NULL , 'DETAILED') AS a
JOIN sys.indexes AS b 
ON a.object_id = b.object_id
  AND a.index_id = b.index_id
WHERE a.avg_fragmentation_in_percent > 0
ORDER BY 3 desc