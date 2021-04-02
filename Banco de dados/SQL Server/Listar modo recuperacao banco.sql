SELECT name AS [Database Name],
recovery_model_desc AS [Recovery Model]
FROM sys.databases
GO

ALTER DATABASE dwdata SET RECOVERY SIMPLE ;