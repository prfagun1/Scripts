select rdb$get_context('SYSTEM', 'DB_NAME')  as Banco, RDB$TRANSACTION_STATE as Status, RDB$TIMESTAMP as Horario, 
	RDB$TRANSACTION_DESCRIPTION as Descricao, 
	s.MON$SQL_TEXT as SQL, a.MON$REMOTE_ADDRESS as IP
	, a.MON$REMOTE_PROCESS as Programa, a.MON$SERVER_PID as Processo
 from RDB$TRANSACTIONS t, MON$STATEMENTS s, MON$ATTACHMENTS a
 where t.RDB$TRANSACTION_ID = s.MON$TRANSACTION_ID
 	and s.MON$STAT_ID = a.MON$STAT_ID ;