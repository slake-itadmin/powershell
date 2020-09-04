$group = "GRPAEONHK_OVPN"
$filelocation = "E:\OneDrive\Work\PowerShell\GroupMemberStatus"
$path = $filelocation + '\' + $group + "_memberlist.csv"
Get-ADGroupMember -Identity $group -Recursive | Get-ADUser -Properties * | select @{Name="Domain ID";Expression={$_.SamAccountName}} | 
export-csv -Path $path -NoTypeInformation 
set-content $path ((get-content $path) -replace '"')

$memberlistpath = $filelocation + '\' + $group + "_memberlist.csv"
$namelist = Get-Content $memberlistpath

Foreach($name in $namelist)
{
	$group_member_slake = Get-ADuser -Filter 'Name -like $name'
	$ou_slake = $group_member_slake.distinguishedname.substring($group_member_slake.distinguishedname.indexof(",") + 1, 
	$group_member_slake.distinguishedname.Length - $group_member_slake.distinguishedname.indexof(",") - 1)
    $workstation_slake = $ou_slake.Trim("OU=")
    $group_member_slake_result = $workstation_slake.Trim(",DC=slake,DC=sssb,DC=com")
	$resultpath = $filelocation + '\' + $group + "_OVPN.csv"
	Get-ADUser -Filter 'Name -like $name' | select-object @{Name="Domain ID";Expression={$_.SamAccountName}}, 
	@{Name="Group";Expression={$group_member_slake_result}}, @{Name="Account Status";Expression={$_.Enabled}} | 
	export-csv -Path $resultpath -append
}