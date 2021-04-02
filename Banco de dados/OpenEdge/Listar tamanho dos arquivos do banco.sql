SELECT * FROM PUB."_Filelist" 
--*_FileList-Size - Tamanho em KB


--Listar AI, BI e tamanho do banco

--Banco
SELECT sum(f."_FileList-Size")/1024
FROM PUB."_Filelist" f
where f."_FileList-Name" like '%.d%'

--AI
SELECT sum(f."_FileList-Size")/1024
FROM PUB."_Filelist" f
where f."_FileList-Name" like '%.a%'

--BI
SELECT sum(f."_FileList-Size")/1024
FROM PUB."_Filelist" f
where f."_FileList-Name" like '%.b%'

Com os 3
select * 
 from 
 (SELECT database() as 'Banco',sum(f."_FileList-Size")/1024 as 'Base' FROM PUB."_Filelist" f where f."_FileList-Name" like '%.d%') d,
 (SELECT sum(f."_FileList-Size")/1024 as 'AI' FROM PUB."_Filelist" f where f."_FileList-Name" like '%.a%') a,
 (SELECT sum(f."_FileList-Size")/1024 as 'BI'
  FROM PUB."_Filelist" f
 where f."_FileList-Name" like '%.b%') b 
 