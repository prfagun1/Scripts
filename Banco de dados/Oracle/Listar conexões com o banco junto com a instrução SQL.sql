SELECT  S.SID, S.SERIAL#, P.SPID, S.USERNAME,
               S.STATUS, S.OSUSER, S.MACHINE,
               S.PROGRAM, S.MODULE,
               TO_CHAR(S.LOGON_TIME, 'dd/mm/yyyy hh24:mi:ss') LOGON_TIME,
               S.blocking_session, -- id da sessao bloqueadora (qdo for o caso)
               DBMS_LOB.SUBSTR(a.SQL_FULLTEXT, 4000,1) sql_text
FROM    V$SESSION S
JOIN    V$PROCESS P
ON    P.addr = S.paddr
JOIN    V$SQLAREA A
ON   s.sql_hash_value = a.hash_value
WHERE   TYPE = 'USER'
      -- AND  S.USERNAME = 'X1' -- substituir X1 pelo nome do usuario no BD
      -- AND  S.OSUSER = 'X2'  -- substituir X2 pelo nome do usuario no SO
      -- AND  S.MACHINE = 'X3' -- subst. X3 pelo nome da máquina q está se conectando no BD
      -- AND  S.PROGRAM = 'X4' -- subst. X4 pelo nome do programa q está se conectando no BD
      -- AND  A.sql_text like '%X5%' -- subst. X5 por parte do SQL desejado