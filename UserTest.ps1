#Get-ADGroupMember -identity "CN=GRPCBI_OVPN,OU=GRPOVPN,DC=slake,DC=sssb,DC=com" | Select-Object name | Export-CSV -Path "C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI.csv"

$names = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI.csv

$Result = Foreach ($name in $names)
{
    $name1 = "*" + $name + "*"
    Get-AdUser -Filter {Name -like $name1} | Format-Table SamAccountName,GivenName,SurName,Enabled -A
}

$Result | Export-CSV -Force -Append C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI_OVPN.csv

#| Export-CSV -Force -Append C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI_OVPN.csv

#Format-Table SamAccountName,GivenName,SurName,Enabled -A

#$users = Get-Content "C:\PowerShellScript\CSV\swyxusers.csv"
#
#$test = Foreach ($user in $users){
#    $user = "*" + $user + "*"
#    Get-ADUser -Filter {Name -like $user } | Select-Object SamAccountName, Enabled} 
#
#$test| export-csv -Force -Append "C:\PowerShellScript\CSV\skit.csv"