select fs.name as "Tablespace",
f.phyblkrd as "Physical|Blk Read",
f.phyblkwrt as "Physical|Blks Wrtn", 
f.readtim as "Read|Time",
f.writetim as "Write|Time"
from v$filestat f, v$datafile fs 
where f.file# = fs.file# 
order by fs.name ;