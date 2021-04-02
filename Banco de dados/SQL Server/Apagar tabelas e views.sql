--Apagar todas as tabelas de um banco

exec sp_MSforeachtable "DROP TABLE ? PRINT '? dropped' "




--Apagar todas as views em um banco

-- variable to object name
declare @name  varchar(100)
-- variable to hold object type
declare @xtype char(1)
-- variable to hold sql string
declare @sqlstring nvarchar(1000)

declare SPViews_cursor cursor for
SELECT sysobjects.name, sysobjects.xtype
FROM sysobjects
  join sysusers on sysobjects.uid = sysusers.uid
where OBJECTPROPERTY(sysobjects.id, N'IsView') = 1 

open SPViews_cursor

fetch next from SPViews_cursor into @name, @xtype

while @@fetch_status = 0
  begin
-- test object type if it is a stored procedure
   if @xtype = 'P'
      begin
        set @sqlstring = 'drop procedure ' + @name
        exec sp_executesql @sqlstring
        set @sqlstring = ' '
      end
-- test object type if it is a view
   if @xtype = 'V'
      begin
         set @sqlstring = 'drop view ' + @name
         exec sp_executesql @sqlstring
         set @sqlstring = ' '
      end

-- get next record
    fetch next from SPViews_cursor into @name, @xtype
  end

close SPViews_cursor
deallocate SPViews_cursor
