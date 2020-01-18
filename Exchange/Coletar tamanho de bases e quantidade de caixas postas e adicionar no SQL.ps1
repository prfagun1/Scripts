add-pssnapin Microsoft.Exchange.Management.PowerShell.SnapIn
 
$conn = New-Object System.Data.SqlClient.SqlConnection("Data Source=servidor sql; Initial Catalog=banco; Integrated Security=SSPI")
$conn.Open()
$cmd = $conn.CreateCommand()
$data = Get-Date -format yyyy/MM/dd
 
 
$database = Get-MailboxDatabase -IncludePreExchange2013 -status
$database = $database += Get-PublicFolderDatabase -Status
 
 
foreach($db in $database) {
 
	$nome = $db.Name
	$tamanho = $db.DatabaseSize.ToMB()
	$livre = $db.AvailableNewMailboxSpace.ToMB()
	$server = $db.Server
	if ($nome -like 'PUBLIC*'){
		$emails = "0"    
	} else{
		$emails = (Get-Mailbox -ResultSize Unlimited -Database $nome).count
	}
 
	#write-host $nome - $tamanho - $livre
	$cmd.CommandText =“insert into indicadorExchange values ('$nome', '$tamanho', '$livre', '$data', '$server', '$emails' );” + $cmd.CommandText
	#write-host $nome, $tamanho, $livre, $data, $server, $emails
}
 
$cmd.ExecuteReader()
$conn.Close()