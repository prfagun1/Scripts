--Listar indices hipoteticos

Select  Name,
        Case When Status & 1 = 1 Then 'Y' Else '' End As IgnoreDuplicateKeys,
        Case When Status & 2 = 2 Then 'Y' Else '' End As [Unique],
        Case When Status & 4 = 4 Then 'Y' Else '' End As IgnoreDuplicateRows,
        Case When Status & 16 = 16 Then 'Y' Else '' End As [Clustered],
        Case When Status & 32 = 32 Then 'Y' Else '' End As Hypothetical,
        Case When Status & 64 = 64 Then 'Y' Else '' End As [Statistics],
        Case When Status & 2048 = 2048 Then 'Y' Else '' End As PrimaryKey,
        Case When Status & 4096 = 4096 Then 'Y' Else '' End As UniqueKey,
        Case When Status & 8388608 = 8388608 Then 'Y' Else '' End As AutoCreate,
        Case When Status & 16777216 = 16777216 Then 'Y' Else '' End As StatsNoRecompute
From     sysindexes
Where   Status & 64 = 0
        And Status & 32 = 32


--comando para gerar o script para apagar os indices hipoteticos
        
Select  'Drop Index [' + Object_Name(id) + '].[' + Name + ']' ,
        Case When Status & 1 = 1 Then 'Y' Else '' End As IgnoreDuplicateKeys,
        Case When Status & 2 = 2 Then 'Y' Else '' End As [Unique],
        Case When Status & 4 = 4 Then 'Y' Else '' End As IgnoreDuplicateRows,
        Case When Status & 16 = 16 Then 'Y' Else '' End As [Clustered],
        Case When Status & 32 = 32 Then 'Y' Else '' End As Hypothetical,
        Case When Status & 64 = 64 Then 'Y' Else '' End As [Statistics],
        Case When Status & 2048 = 2048 Then 'Y' Else '' End As PrimaryKey,
        Case When Status & 4096 = 4096 Then 'Y' Else '' End As UniqueKey,
        Case When Status & 8388608 = 8388608 Then 'Y' Else '' End As AutoCreate,
        Case When Status & 16777216 = 16777216 Then 'Y' Else '' End As StatsNoRecompute
From     sysindexes
Where   Status & 64 = 0
        And Status & 32 = 32