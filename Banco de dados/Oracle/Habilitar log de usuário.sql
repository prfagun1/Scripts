create or replace TRIGGER USER_TRACE_TRG
AFTER LOGON ON DATABASE
BEGIN
IF USER = 'EMSFND'
THEN
EXECUTE IMMEDIATE 'alter session set tracefile_identifier = ''TRACE_DBA''';
EXECUTE IMMEDIATE 'alter session set statistics_level=ALL';
EXECUTE IMMEDIATE 'alter session set max_dump_file_size=UNLIMITED';
execute immediate 'alter session set events ''10046 trace name context forever, level 12''';
END IF;
EXCEPTION
WHEN OTHERS THEN
NULL;
END;

--Habilitar o trace:
ALTER SESSION SET SQL_TRACE=true;

--Os logs devem ficar em uma pasta parecida com esta: /opt/oracle/app/oracle/diag/rdbms/erpprot1/erpprot11/trace