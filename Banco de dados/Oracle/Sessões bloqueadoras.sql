--1 - Identificar bloqueador
 
select vl.sid
     , decode(vl.block,1,'',0,'bloqueado',vl.block) Status
     , vl.id1
     , vl.id2
from v$lock vl
where vl.kaddr in ( select lockwait
                    from v$session
                    where lockwait is not null )
union
select vl.sid
     , decode(vl.block,1,'*BLOQUEADOR*',0,'',vl.block) Status
     , vl.id1
     , vl.id2
from v$lock vl
where vl.id1 is not null
  and vl.id2 is not null
  and vl.block = 1
order by id1
/
 
Exemplo de saída..
      SID  STATUS                                   ID1               ID2     
---------- ---------------------------------------- ---------- ----------
      5381 *BLOQUEADOR*                  72871        0
      5305 bloqueado                      12320776       280131
 
--2 - Pegar o SID

select 'ALTER SYSTEM KILL SESSION '''||sid||','||serial#||''' IMMEDIATE;' from v$session where sid = 5381;
 
--3 - Copiar o resultado e executar

ALTER SYSTEM KILL SESSION '532,33270' IMMEDIATE;


--Versão 2

SELECT INST_ID, 
 SID, 
 TYPE, 
 ID1, 
 ID2, 
 LMODE, 
 REQUEST, 
 CTIME, 
 BLOCK 
 FROM
 GV$LOCK 
 WHERE 
 (ID1,ID2,TYPE) IN 
 (SELECT ID1, ID2, TYPE FROM GV$LOCK WHERE request>0);   
