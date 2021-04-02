--Lista tablespaces
select * from v$tablespace



--Criar uma tablespace
CREATE TABLESPACE TS_DBA
  DATAFILE '+ASMDATA/orahuc/datafile/ts_dba_dat01.dat' 
    SIZE 100M
    REUSE
    AUTOEXTEND ON NEXT 100M MAXSIZE 1000M;
    

--Apagar uma tablespace
DROP TABLESPACE tbs_01 
    INCLUDING CONTENTS 
        CASCADE CONSTRAINTS; 


--Listar tamanho das tablespaces
select tarea.tablespace_name,
        tarea.tsize,
        tcorrente,
        round(tarea.tsize-tcorrente+sum(nvl(free.bytes,0))/1024/1024,0) livre,
        round(((tarea.tsize-tcorrente+sum(nvl(free.bytes,0))/1024/1024)*100)/tarea.tsize,0) "% Livre"
 from dba_free_space free,
 (select tablespace_name, sum(a.bytes)/1024/1024 tcorrente,sum(decode(nvl(a.maxbytes,0),0,a.bytes,a.maxbytes))/1024/1024 tsize
 from dba_data_files A
 group by tablespace_name) tarea
 where free.tablespace_name(+)=tarea.tablespace_name
 group by tarea.tablespace_name,tarea.tsize,tcorrente
 order by 1;
 

-- aumentar tamanho de uma tablespace
  
ALTER DATABASE
 DATAFILE '+ASMDATA_banco/servidor/datafile/ts_teste.dbf'
 RESIZE 30000M;