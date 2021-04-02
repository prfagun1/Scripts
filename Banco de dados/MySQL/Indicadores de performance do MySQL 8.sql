select * from performance_schema.global_status
where VARIABLE_NAME like 'BYTES_RECEIVED%';