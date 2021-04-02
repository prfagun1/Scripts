SELECT sess.process, sess.status, sess.username, sess.schemaname, sql.sql_text
  FROM v$session sess,
       v$sql     sql
  WHERE sql.sql_id(+) = sess.sql_id;
 
 
SELECT SID, SERIAL#, STATUS, SERVER
   FROM V$SESSION
   where status <> 'ACTIVE'
   ;
 
 
SELECT MACHINE, count(PROGRAM)
  FROM v$session sess,
       v$sql     sql
  WHERE sql.sql_id(+) = sess.sql_id
  and program = 'zzz.exe'
  group by MACHINE
  order by count(PROGRAM) desc
  ;
  
  
  SELECT MACHINE, program
  FROM v$session sess,
       v$sql     sql
  WHERE sql.sql_id(+) = sess.sql_id
  and machine = 'zzz'
  ;
  
  
select COUNT(sid) from v$session;

select * from v$resource_limit where resource_name = 'processes';
