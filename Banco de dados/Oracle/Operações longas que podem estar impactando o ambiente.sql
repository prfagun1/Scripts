set lines 220;
set pages 400;
col opname for a40;
alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';
select TIME_REMAINING, opname, start_time, elapsed_seconds, totalwork, sofar, last_update_time from gv$session_longops where start_time > trunc(sysdate)-1
and sofar<totalwork
order by start_time;