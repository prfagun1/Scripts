--Utilização de CPU por usuário e computador

SELECT n.username, 
n.machine,
s.sid,
s.value
FROM v$sesstat s,v$statname t, v$session n
WHERE s.statistic# = t.statistic#
AND n.sid = s.sid
AND t.name='CPU used by this session'
and username is not null
ORDER BY s.value desc;




--Utilização de tempo da cpu por usuario

select
   ss.machine,
   se.SID,
   VALUE/100 cpu_usage_seconds
from
   v$session ss,
   v$sesstat se,
   v$statname sn
where
   se.STATISTIC# = sn.STATISTIC#
and
   NAME like '%CPU used by this session%'
and
   se.SID = ss.SID
and
   ss.status='ACTIVE'
and
   ss.username is not null
order by VALUE desc;
