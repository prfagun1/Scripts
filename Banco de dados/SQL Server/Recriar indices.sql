--Método 1
DBCC DBREINDEX('dbo.EmployeeDim', 'IX_EmployeeDim')

Reindexar todos os indices de um banco

--Método 2
USE MyDatabase
GO
EXEC sp_MSforeachtable @command1="print '?' DBCC DBREINDEX ('?', ' ', 90)"
GO
EXEC sp_updatestats
GO 

--Método 3
DECLARE @MyTable VARCHAR(255)
DECLARE @Schema VARCHAR(255)
DECLARE @Tabela VARCHAR(255)
DECLARE myCursor
CURSOR FOR
SELECT table_name, table_schema
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE'
OPEN myCursor
FETCH NEXT
FROM myCursor INTO @MyTable, @Schema
WHILE @@FETCH_STATUS = 0
BEGIN
set @Tabela = @Schema + '.' + @MyTable
--DBCC SHOWCONTIG(@Tabela)
--DBCC DBREINDEX(@Tabela)
print 'print getdate()'
print 'print ''' + @Tabela + ''''
print 'ALTER INDEX ALL ON ' + @Tabela + ' REBUILD WITH (ONLINE = ON)'
print 'go'
print ''
FETCH NEXT
FROM myCursor INTO @MyTable, @Schema
END
CLOSE myCursor
DEALLOCATE myCursor
  GO
print 'EXEC sp_updatestats'
GO 


--segunda versão 
DECLARE @TableName VARCHAR(255)
DECLARE @sql NVARCHAR(500)
DECLARE @fillfactor INT
SET @fillfactor = 80
DECLARE TableCursor CURSOR FOR

SELECT OBJECT_SCHEMA_NAME([object_id])+'.'+name AS TableName
FROM sys.tables
OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName
    WHILE @@FETCH_STATUS = 0

    BEGIN
        SET @sql = 'ALTER INDEX ALL ON ' + @TableName + ' REBUILD WITH (ONLINE=ON, FILLFACTOR = ' + CONVERT(VARCHAR(3),@fillfactor) + ')'
        EXEC (@sql)
        FETCH NEXT FROM TableCursor INTO @TableName
    END
CLOSE TableCursor
DEALLOCATE TableCursor
GO
EXEC sp_updatestats
