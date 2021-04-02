alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';
set pages 400;
set lines 180;
col machine for a20;
col program for a45;
col username for a20;
col event for a45;
col c for a10;
select sql_id, last_call_et, username, program, event, sid||','||serial# c, inst_id from gv$session where username is not null and status = 'ACTIVE' order by last_call_et desc, machine;