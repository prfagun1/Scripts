--Matar a sessão
 
ALTER SYSTEM KILL SESSION 'sid,serial#' IMMEDIATE;
ALTER SYSTEM KILL SESSION '514,503' IMMEDIATE;
 
--Matar processo
 
orakill ORACLE_SID spid