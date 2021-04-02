SELECT sess.sid,
       sess.username,
       sess.module,
       sess.machine,
       sqla.optimizer_mode,
       sqla.hash_value,
       sqla.address,
       sqla.cpu_time,
       sqla.elapsed_time,
       sqla.sql_text
  FROM v$sqlarea sqla, v$session sess
 WHERE sess.sql_hash_value = sqla.hash_value
   AND sess.sql_address = sqla.address


Ou

SELECT 
      s.sid
     ,s.CLIENT_INFO
     ,s.MACHINE
     ,s.PROGRAM
     ,s.TYPE
     ,s.logon_time
     ,s.osuser
     ,sq.sorts
     ,sq.DISK_READS
     ,sq.BUFFER_GETS
     ,sq.ROWS_PROCESSED
     ,sq.SQLTYPE
     ,sq.SQL_TEXT
 FROM gv$session s    
    , gv$sql sq
WHERE s.SQL_HASH_VALUE = sq.HASH_VALUE
  AND sq.inst_id= s.inst_id;
