EXEC sp_MSforeachtable 'SELECT ''?'', Count(*) as NumberOfRows FROM ?' 