SELECT AuditFile.* 
FROM sys.dm_server_audit_status AS AuditStatus 
CROSS APPLY 
sys.fn_get_audit_file (AuditStatus.audit_file_path, default, default) AS AuditFile 
WHERE AuditStatus.name = 'Audit'; 
SELECT * FROM fn_get_audit_file ('c:\MSSQL10_50.MSSQLSERVER\MSSQL\audit\*',default, default) 
where statement like '%comando%'