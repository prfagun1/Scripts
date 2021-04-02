--Versao 01

select NAME, 
cast((dateadd(mi,( cast(lastlogontimestamp as bigint) / 600000000) - 157258080,0))as date) as data_login

from openquery(
    ADSI,'SELECT NAME, lastLogonTimestamp
        FROM ''LDAP://dominio.com:3268/dc=dominio,dc=com''
        WHERE objectCategory = ''computer'' AND objectClass = ''computer'''
    )
order by data_login




--Versao 02

SELECT  SAMAccountName as 'Usuario', displayName as 'Nome', mail as 'Email', physicalDeliveryOfficeName as 'Setor',
        whenCreated as 'DataCriacao',
        CAST(DATEADD(mi, CAST(lastLogonTimestamp AS bigint) / 600000000 - 157258080 , 0) AS datetime) AS 'UltimoLogon',
        CASE pwdLastSet WHEN CAST(0 AS bigint) THEN 0 
        ELSE CAST(DATEADD(mi, (CAST(pwdLastSet AS bigint) / 600000000) - 157258080 + DATEDIFF(Minute, GetUTCDate(),
        GetDate()), 0) AS datetime) END AS 'UltimaAlteracaoSenha'

FROM    OPENQUERY(ADSI, 
        'SELECT SAMAccountName, userAccountControl, displayName, lastLogonTimestamp, mail, whenCreated,
        physicalDeliveryOfficeName, pwdLastSet 
         
        FROM ''LDAP://dominio.net:3268/dc=dominio,dc=net'' 
        WHERE objectCategory = ''Person'' AND objectClass = ''user'' ')
AS AD
order by 2