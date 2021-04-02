--Sequence
GRANT UPDATE,SELECT ON SEQUENCE pub.seq_teste to pub;

--Permissão tabela
sqlexp -db banco -S porta  -user usuario -password senha
grant select on PUB."f-fanfor" to usuario;