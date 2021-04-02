select owner, segment_type, segment_name, count(1) qtde, sum(bytes/1024/1024) tot_mb 
from dba_segments 
where tablespace_name = 'SYSAUX' 
group by owner, segment_type, segment_name
order by 1,2;
