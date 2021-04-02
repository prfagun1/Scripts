IF OBJECT_ID('#tempUsuarios') IS NOT NULL 
    DROP TABLE #tempUsuarios
select SAMAccountName as 'NAME', 
cast(DATEADD(mi,(cast(pwdLastSet as bigint) / 600000000) - 157258080 + DATEDIFF(Minute,GetUTCDate(),GetDate()),0)
as datetime) as 'DATE', mail as 'Email'
into  #tempUsuarios
from openquery
( ADSI,'SELECT SAMAccountName,lastLogonTimestamp, mail, pwdLastSet FROM ''LDAP://dominio.com:3268/dc=dominio,dc=com'' WHERE objectCategory = ''Person'' AND 
objectClass = ''user''')
where pwdLastSet != '0' and mail is not NULL

select 
NAME, 30 - cast((GETDATE() - DATE) as int) as 'DAYS', DATE, Email as "EMAIL"
from #tempUsuarios
where DATE > GETDATE() - 30
and DATE < GETDATE() - 25


order by 2
    DROP TABLE #tempUsuarios
