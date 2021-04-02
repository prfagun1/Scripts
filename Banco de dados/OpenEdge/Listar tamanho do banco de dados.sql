select * 
from 
(SELECT database() as 'Banco',sum(f."_FileList-Size")/1024 as 'Base' FROM PUB."_Filelist" f where f."_FileList-Name" like '%.d%') d,
(SELECT sum(f."_FileList-Size")/1024 as 'AI' FROM PUB."_Filelist" f where f."_FileList-Name" like '%.a%') a,
(SELECT sum(f."_FileList-Size")/1024 as 'BI'
 FROM PUB."_Filelist" f
where f."_FileList-Name" like '%.b%') b 