ALTER PROCEDURE [dbo].[deleta_old_registros]
AS
BEGIN
declare @v_cod1 int
DECLARE deleta_cursor CURSOR FOR
    select ID from session where datee < (GETDATE()-140) ;
OPEN deleta_cursor;
FETCH FROM deleta_cursor into @v_cod1;
while @@FETCH_STATUS = 0
begin
    begin TRY
         delete  FROM session WHERE ID = @v_cod1;
    END TRY
    BEGIN CATCH
       IF ERROR_NUMBER() = 1205 
       BEGIN  
           FETCH FROM deleta_cursor into @v_cod1;
           PRINT 'Registro Bloqueado'
       END
    END CATCH  
    FETCH FROM deleta_cursor into @v_cod1;         
end
CLOSE deleta_cursor;
DEALLOCATE deleta_cursor;
