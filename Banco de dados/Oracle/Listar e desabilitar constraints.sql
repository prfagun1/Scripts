--Listar constraints
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EXCHANGEMESSAGE';

 
--Desabilitar constraints
--Exemplo:
alter table   EXCHANGEMESSAGE Enable constraint   SYS_C00685260 cascade;