select
   'ALTER ' || OBJECT_TYPE || ' ' ||
   OWNER || '.' || OBJECT_NAME || ' COMPILE;'
from
   dba_objects
where
   status = 'INVALID'
and
   object_type in ('PACKAGE','FUNCTION','PROCEDURE')
;


select
   'ALTER ' || OBJECT_TYPE || ' ' ||
   OWNER || '.' || OBJECT_NAME || ' COMPILE;'
from
   dba_objects
where
   status = 'INVALID'
and
   object_type in ('VIEW','SYNONYM','TRIGGER','PROCEDURE','FUNCTION','INDEXTYPE','INDEX','OPERATOR')
and
   owner = 'usuario';
