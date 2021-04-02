SET PAUSE ON
SET PAUSE 'Press Return to Continue'
SET PAGESIZE 60
SET LINESIZE 300
 
COLUMN username FORMAT A30
COLUMN sid FORMAT 999,999,999
COLUMN serial# FORMAT 999,999,999
COLUMN "cpu usage (seconds)"  FORMAT 999,999,999.0000
 
SELECT
   s.username,
   t.sid,
   s.serial#,
   SUM(VALUE/100) as "cpu usage (seconds)"
FROM
   v$session s,
   v$sesstat t,
   v$statname n
WHERE
   t.STATISTIC# = n.STATISTIC#
AND
   NAME like '%CPU used by this session%'
AND
   t.SID = s.SID
AND
   s.status='ACTIVE'
AND
   s.username is not null
GROUP BY username,t.sid,s.serial#