select * from (
select name,phyrds, phywrts,readtim,writetim
from v$filestat a, v$datafile b
where a.file#=b.file#
order by readtim desc) where rownum <6;