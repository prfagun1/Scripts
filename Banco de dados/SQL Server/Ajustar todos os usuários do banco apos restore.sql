declare user_cursor cursor forward_only read_only for
     SELECT  distinct u.name
     FROM    sysusers u
     JOIN    master.dbo.syslogins l ON l.name = u.name COLLATE SQL_Latin1_General_CP1_CI_AS
     WHERE   u.issqluser <> 0
declare @user sysname;
  
open user_cursor
fetch next from user_cursor into @user;
  
while @@fetch_status = 0  
     begin
     if @user <> 'dbo'
         begin
         print ''  
         print 'Updating user "' + @user + '"'
         exec sp_change_users_login 'Auto_Fix', @user  
         
         --EXEC sp_change_users_login UPDATE_ONE, @user, @user
         
         end
     fetch next from user_cursor into @user
     end;  
close user_cursor
deallocate user_cursor