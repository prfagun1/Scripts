--Dar permissão para o envio de email
 
begin
dbms_network_acl_admin.create_acl ( acl => 'grant_acl.xml', description => 'Permite enviar e-mail', principal => 'ADMWPD', is_grant => TRUE, privilege => 'connect' );
end;
commit;
 
begin
   dbms_network_acl_admin.assign_acl( acl => 'grant_acl.xml', host => '*' );
end; 
 
   commit;
/

--Enviar email
declare   l_mail_conn UTL_SMTP.connection;
begin
      l_mail_conn := UTL_SMTP.open_connection('servidor', 25);
      UTL_SMTP.helo(l_mail_conn, 'servidor');
      UTL_SMTP.mail(l_mail_conn, 'email@email.com');
	  UTL_SMTP.rcpt(l_mail_conn, 'email@email.com');
      UTL_SMTP.open_data(l_mail_conn);
      UTL_SMTP.write_data(l_mail_conn, 'teste' || UTL_TCP.crlf);
      
      UTL_SMTP.close_data(l_mail_conn);
      UTL_SMTP.quit(l_mail_conn);
	  
end;