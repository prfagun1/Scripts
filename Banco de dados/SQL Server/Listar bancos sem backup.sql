SET NOCOUNT ON;
declare @diasSemBackup int
set @diasSemBackup = 2
SET NOCOUNT ON
SET ANSI_WARNINGS off

declare @bancos varchar(max);

select @bancos = servidor + '-' + banco from listaBancosSemBackup

print @bancos

SELECT   DISTINCT
         '2' as 'Status',
         d.name as 'Banco', 
         @@servername as 'Servidor',
         LastBackup as 'Ultimo backup'
         
FROM     master.sys.databases d 
         LEFT JOIN (         
            SELECT sdb.name AS database_name,
                COALESCE(CONVERT(VARCHAR(12), MAX(bus.backup_finish_date), 101),null) AS LastBackup
            FROM sys.sysdatabases sdb
                LEFT OUTER JOIN msdb.dbo.backupset bus ON bus.database_name = sdb.name

            GROUP BY sdb.name
        ) b 
        ON d.name = b.database_name 
        where 
            DATABASEPROPERTYEX(d.name,'Status') = 'Online'
            and ( LastBackup <= getdate() - @diasSemBackup or LastBackup is null)
            and @@servername + '-' + d.name not in( 
            
            @bancos
            
--termino da listagem dos bancos
)
ORDER BY d.name

--Formato tabela listaBancosSemBackup
--'servidor\instancia-banco',
