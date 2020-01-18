$SearchBase = "OU=Origem,DC=domain,DC=domain,DC=COM"
$Users = Get-ADUser -filter * -SearchBase $SearchBase -Properties MemberOf
ForEach($User in $Users){
    $User.MemberOf | Remove-ADGroupMember -Member $User -Confirm:$false
} 