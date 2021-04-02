select o.object_name as "object_name",
       s.sid as "sid",
       s.serial# as "serial#",
       s.username as "username",
       sq.sql_fulltext as "sql_fulltext"
  from v$locked_object l, dba_objects o, v$session s,
       v$process p, v$sql sq
  where l.object_id = o.object_id
    and l.session_id = s.sid and s.paddr = p.addr
    and s.sql_address = sq.address;