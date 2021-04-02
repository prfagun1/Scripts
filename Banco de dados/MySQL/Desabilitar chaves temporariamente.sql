--o disable foreign key constraints when you want to truncate a table:
Use FOREIGN_KEY_CHECKS
SET FOREIGN_KEY_CHECKS=0;
--and remember to enable it when you’re done:
SET FOREIGN_KEY_CHECKS=1;

--Or you can use DISABLE KEYS:
ALTER TABLE table_name DISABLE KEYS;
--Again, remember to enable if thereafter:
ALTER TABLE table_name ENABLE KEYS;