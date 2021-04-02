Select * from sysprogress.systables;
Select * from sysprogress.systables where left(tbl,3) <> 'SYS' and left(tbl,1) <> '_';

SELECT * FROM PUB."_File" where "_Tbl-Type" = 'T'