#-----Get OVPN List
#Get-ADGroup -Filter * -SearchBase "ou=grpovpn,dc=slake,dc=sssb,dc=com" | select-object name | sort-object name


$namelist = Get-Content E:\OneDrive\Work\PowerShell\GroupMemberStatus\GRPDATAC1.csv

Foreach($name in $OVPNList)
{
    $filelocation = "E:\OneDrive\Work\PowerShell\GroupMemberStatus"
    $path = $filelocation + '\' + $name +"_memberlist.csv"
    Get-ADGroupMember -Identity $name -Recursive | Get-ADUser -Properties * | select @{Name="Domain ID";Expression={$_.SamAccountName}},@{Name="Full Name";Expression={$_.DisplayName}},@{Name="Account Status";Expression={$_.Enabled}} | export-csv -Path $path -NoTypeInformation
}

