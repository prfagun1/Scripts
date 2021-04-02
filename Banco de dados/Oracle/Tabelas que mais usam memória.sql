select * from gv$session_longops where opname='Table Scan' and target not like 'SYS%'
 
select memoria.*,objetos.tamanho tamanho_objeto,round(memoria.uso_memoria*100/objetos.tamanho,2) "% em Memória" from (select
   o.owner          owner,
   o.object_name    object_name,
   o.subobject_name subobject_name,
   o.object_type    object_type,
   count(distinct file# || block#)         num_blocks,
   count(distinct file# || block#)*8192/1024/1024         uso_memoria
from
   dba_objects  o,
   v$bh         bh
where
   o.data_object_id  = bh.objd
and
   o.owner not in ('SYS','SYSTEM')
and
   bh.status != 'free'
group by
   o.owner,
   o.object_name,
   o.subobject_name,
   o.object_type
) memoria,
   (select segment_name object_name,owner,segment_type object_type,bytes/1024/1024 tamanho from dba_segments ) objetos
   where memoria.object_name=objetos.object_name
         and memoria.owner=objetos.owner
         and memoria.object_type=objetos.object_type
order by uso_memoria desc   
