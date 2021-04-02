--Lista permissões específicas
select * from DBA_TAB_PRIVS where GRANTEE = 'USUARIO' order by GRANTEE

--Conceder permissão
grant select on tabela to 'USUARIO' 

--Remover permissão
revoke select on tabela from 'USUARIO' 

--Lista roles
select * from dba_role_privs where grantee = 'USUARIO';

--Adicionar usuário na role
grant role to USUARIO;

--Remover usuário de uma Role
revoke role from USUARIO;