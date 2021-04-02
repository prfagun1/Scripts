SELECT "_dbStatus-fbDate" ,"_DbStatus-ibdate", "_DbStatus-IbSeq", "_dbstatus-lasttran"   FROM PUB."_DbStatus"

--Listar informações do AI como ultimo backup
select * from PUB."_Logging"


--Lista plano de excução das últimas consultas no banco
select * from PUB."_SQL_Qplan"