Set objEmail = CreateObject("CDO.Message") 

objEmail.From = "from@e-mail.com"

objEmail.Subject = "E-mail enviado" 
objEmail.To = "destino@e-mail.com"

objEmail.Textbody = Body

objEmail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
objEmail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = _
"webmail.dominio.com.br"
objEmail.Configuration.Fields.Item _
 ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
objEmail.Configuration.Fields.Update
objEmail.Configuration.Fields.Update
objEmail.Send