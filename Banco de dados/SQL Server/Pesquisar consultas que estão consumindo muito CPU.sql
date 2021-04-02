--Primeira versao

SELECT            
highest_cpu_queries.plan_handle,            
highest_cpu_queries.commands,            
highest_cpu_queries.cpu,            
highest_cpu_queries.reads,            
highest_cpu_queries.duration,            
queries.dbid,            
queries.objectid,            
queries.number,            
queries.encrypted,            
queries.[text],            
queryplans.query_plan            
FROM            
(            
SELECT TOP 100            
qs.plan_handle,            
qs.execution_count AS commands,            
qs.total_worker_time AS cpu,            
qs.total_physical_reads + qs.total_logical_reads AS reads,            
qs.total_elapsed_time AS duration            
FROM sys.dm_exec_query_stats qs            
WHERE qs.last_execution_time >= DATEADD(minute, -60, GETDATE())            
ORDER BY qs.total_worker_time DESC            
) AS highest_cpu_queries            
CROSS APPLY sys.dm_exec_sql_text(plan_handle) AS queries            
CROSS APPLY sys.dm_exec_query_plan(plan_handle) AS queryplans            
ORDER BY 3 DESC


--segunda versão
SELECT TOP 10 SUBSTRING(qt.TEXT, (qs.statement_start_offset/2)+1,
((CASE qs.statement_end_offset
WHEN -1 THEN DATALENGTH(qt.TEXT)
ELSE qs.statement_end_offset
END - qs.statement_start_offset)/2)+1),
qs.execution_count,
qs.total_logical_reads, qs.last_logical_reads,
qs.total_logical_writes, qs.last_logical_writes,
qs.total_worker_time,
qs.last_worker_time,
qs.total_elapsed_time/1000000 total_elapsed_time_in_S,
qs.last_elapsed_time/1000000 last_elapsed_time_in_S,
qs.last_execution_time,
qp.query_plan
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp
--ORDER BY qs.total_logical_reads DESC -- logical reads
-- ORDER BY qs.total_logical_writes DESC -- logical writes
ORDER BY qs.total_worker_time DESC-- CPU time
