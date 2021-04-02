--Listar features habilitadas no banco

select * from PUB."_Database-Feature"

--Listar informações do banco

select * from PUB."_DbStatus"
select database() as 'Banco', "_DbStatus-starttime" as 'Data inicio',  "_dbStatus-fbDate" as 'Último backup', "_DbStatus-CreateDate" as 'Data criação' from PUB."_DbStatus"

--Listar informações de licenças
select * from PUB."_License"
