--Listar conexões
select * from sys.dm_exec_connections

--Alterar o ID 51 pela conexão desejada
CREATE TABLE #tmpDBCCinputbuffer(
[EVENT TYPE] NVARCHAR(512),
[PARAMETERS] INT, 
[EVENT Info] NVARCHAR(512)
)
INSERT INTO #tmpDBCCinputbuffer
EXEC ('DBCC INPUTBUFFER(51)')

  select con.session_id, con.connect_time, con.client_net_address, 
          pro.loginame, pro.hostname, pro.program_name,
  (
    SELECT [EVENT Info]
    FROM #tmpDBCCinputbuffer
  ) as comando
  
  from master.sys.dm_exec_connections con, master.dbo.sysprocesses pro
  where con.session_id = pro.spid
  and con.session_id = '51'  


  drop table #tmpDBCCinputbuffer
