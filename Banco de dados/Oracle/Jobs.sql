SELECT * FROM ALL_SCHEDULER_JOBS
 
SELECT
    job
  , log_user username
  , what
  , TO_CHAR(next_date, 'DD-MON-YYYY HH24:MI:SS') next_date
  , interval
  , TO_CHAR(last_date, 'DD-MON-YYYY HH24:MI:SS') last_date
  , failures
  , broken
FROM
    dba_jobs
order by 2 desc


--Listar jobs ativos
select owner, job_name, enabled from DBA_SCHEDULER_JOBS;

select 'execute dbms_scheduler.disable('||''''||owner||'.'||job_name||''''||');' from dba_scheduler_jobs where enabled='TRUE' and owner not in ('SYS', 'EXFSYS', 'ORACLE_OCM', 'ADMWPD', 'WPD', 'US_DBA', 'ADVIT') ;


--Desativar jobs
execute dbms_scheduler.disable('owner.job');

--Ativar jobs
exec dbms_scheduler.enable('SCHEMA_MNTC_JOB');

--Ativar jobs executando
SELECT * FROM ALL_SCHEDULER_RUNNING_JOBS;

--Parar um job 
EXEC DBMS_SCHEDULER.STOP_JOB (job_name => 'owner.JOB_NAME');


--Verifica jobs com erro
 
SELECT to_char(log_date, 'DD-MON-YY HH24:MM:SS') TIMESTAMP, job_name, status,
   SUBSTR(additional_info, 1, 40) ADDITIONAL_INFO
   FROM DBA_scheduler_job_run_details
   where log_date > sysdate -2
   and STATUS <> 'SUCCEEDED'
  ORDER BY log_date
   ;

--Listar jobs que executaram com erro no último dia

SELECT * 
from all_scheduler_job_run_details
where ERROR# <> 0
and LOG_Date > sysdate -1
order by owner, job_name;

--Versão 2

SELECT LOG_DATE, owner, Job_name, ADDITIONAL_INFO
from all_scheduler_job_run_details
where ERROR# <> 0
and LOG_Date > sysdate -1
order by owner, job_name;

--Versão 3

SELECT to_char(j.log_date, 'DD-MON-YY HH24:MM:SS') as Data,
       j.owner as Proprietario,
       j.job_name as Job,
       j.status as Status,
       to_char(j.RUN_DURATION, 'DD-MON-YY HH24:MM:SS') as Duracao,
       additional_info as Informacao
 From DBA_scheduler_job_run_details j
 Where log_date > sysdate - 2
     and STATUS <> 'SUCCEEDED'
 ORDER BY STATUS, log_date;

