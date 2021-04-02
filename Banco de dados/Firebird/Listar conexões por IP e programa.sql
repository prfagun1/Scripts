select rdb$get_context('SYSTEM', 'DB_NAME')  as Banco, a.MON$REMOTE_ADDRESS as IP, a.MON$TIMESTAMP as Conexao, a.MON$REMOTE_PROCESS as Programa, MON$PAGE_READS as LeituraDisco
 		, MON$PAGE_WRITES as GravacaoDisco, MON$PAGE_FETCHES as LeituraCache
 from MON$ATTACHMENTS a, MON$IO_STATS i
 where a.MON$STAT_ID = i.MON$STAT_ID
 order by  MON$PAGE_READS desc
 ;