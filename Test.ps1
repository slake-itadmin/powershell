OU=SYMGADM,DC=slake,DC=sssb,DC=com

#Export aduser to CSV 
Get-ADUser -Filter * -SearchBase "OU=SYMGADM,DC=slake,DC=sssb,DC=com" | Select-Object name | export-csv -path "E:\OneDrive\PowerShell\BatchUpdateADUser\aduser.csv"

#Show aduser logon workstations
$Workstations = (Get-ADUser sunil `-Properties LogonWorkstations).LogonWorkstations
$Workstations



$users = Import-Csv -Path E:\OneDrive\PowerShell\BatchUpdateADUser\aduser.csv


ForEach ($user in $users) {

    Try {
        Get-ADUser -Identity $user -ErrorAction Stop | Out-Null
    }
    Catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
        get-ADUser -Name $user -SamAccountName $user -WhatIf
    }
    Catch {
        Throw $Error[0]
    }

}


Get-ADUser -Filter * -SearchBase "OU=SYMGADM,DC=slake,DC=sssb,DC=com" | Select-Object name | export-csv -path "E:\OneDrive\PowerShell\BatchUpdateADUser\aduser.csv"

Get-ADUser Sunil -Properties LogonWorkstations | `Format-List Name, LogonWorkstations


$user = "sunil"
$aduser = Get-ADUser -Filter 'Name -Eq $User' -Properties *
$computer = "N4258"

$workstations = $aduser.LogonWorkstations
$workstations += ",$computer"
$aduser.LogonWorkstations = $workstations
Set-ADUser -Confirm -Instance $aduser




$userList = "E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.csv"


foreach ($name in $userList) 
{
    $UserProperties = Get-AdUser -Identity $username -Properties LogonWorkstations
    $comparray = ($UserProperties).LogonWorkstations
    foreach($comp in $complist)
        {
        $comparray += "," + $comp
        }
    Set-ADUser -Identity username -LogonWorkstations $comparray
}


$userList = Get-ADUser -Filter * -SearchBase "OU=SYMGADM,DC=slake,DC=sssb,DC=com"

$computer = "N1111"
$userlist = Get-Content E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.csv


foreach ($user in $userlist)
{
Set-ADUser -Identity $user -LogonWorkstations $computer
}




Get-ADUser -Filter * -SearchBase "OU=GRPAS400,DC=slake,DC=sssb,DC=com" | Select-Object name | export-csv -path "E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.csv"


$User = "sunil"
$NewWorkstation = "Workstation03"

$LogonWorkstations = Get-AdUser -Identity $User -Properties LogonWorkstations | select -ExpandProperty LogonWorkstations #get current computernames that user can access

if ($LogonWorkstations) {
    Set-ADUser -Identity $User -LogonWorkstations "$LogonWorkstations,$NewWorkstation" #add new workstation to existing entries
}
else { 
    Set-ADUser -Identity $User -LogonWorkstations $NewWorkstation #only add new workstation
}



$userlist = Import-Csv -Path E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.csv

$computer = "N4257"
$userlist = Import-Csv -Path E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.csv
foreach ($user in $userlist)
{
Set-ADUser -Identity $user -LogonWorkstations $computer
}






$user = "sunil"
$aduser = Get-ADUser -Filter 'Name -Eq $User' -Properties *
$computer = "N4258"

$workstations = $aduser.LogonWorkstations
$workstations += ",$computer"
$aduser.LogonWorkstations = $workstations
Set-ADUser -Confirm -Instance $aduser


import-module activedirectory
$computer = "computername"
$userlist = Get-Content E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.txt
foreach ($user in $userlist)
{
Set-ADUser -Identity $user -LogonWorkstations $computer
}



import-module activedirectory
$computer1 = "N4444"
$computer2 = "N6666"
$computer3 = "N7777"
$userlist = Get-Content E:\OneDrive\PowerShell\BatchUpdateADUser\userlist.txt
foreach ($user in $userlist)
{
$LogonWorkstations = Get-AdUser -Identity $user -Properties LogonWorkstations | select -ExpandProperty LogonWorkstations
if ($LogonWorkstations -gt 1) {
    Set-ADUser -Identity $user -LogonWorkstations "$LogonWorkstations,$computer1,$computer2,$computer3"
}
else { 
    Set-ADUser -Identity $user -LogonWorkstations $computer1,$computer2,$computer3
}
}


Remove-Variable * -ErrorAction SilentlyContinue





Get-ADUser -Filter * -Properties * -SearchBase "CN=GRPCBI_OVPN,OU=GRPOVPN,DC=slake,DC=sssb,DC=com" | Select-Object SamAccountName,DisplayName,Enabled | Out-File -FilePath C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI_OVPN.csv -Encoding ascii



Get-ADUser -Filter * -Properties * -SearchBase "OU=SD_ADMIN,OU=SYMGADM,DC=slake,DC=sssb,DC=com" | Select-Object SamAccountName

Get-ADGroupMember -Property * -identity "CN=GRPCBI_OVPN,OU=GRPOVPN,DC=slake,DC=sssb,DC=com" | Select-Object SamAccountName,DisplayName,Enabled | Out-File -FilePath C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI_OVPN.csv -Encoding ascii


Get-ADGroupMember -identity "CN=GRPCBI_OVPN,OU=GRPOVPN,DC=slake,DC=sssb,DC=com" | Get-ADUser  | Select-Object SamAccountName,DisplayName,Enabled

---------------------

Get-ADGroupMember -identity "CN=GRPCBI_OVPN,OU=GRPOVPN,DC=slake,DC=sssb,DC=com" | Select name | Export-CSV -Path "C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI.csv"

$namelist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI.csv

foreach ($name in $namelist)
{
    $name1 = "*" + $name + "*"
    $UserStatus = Get-AdUser -filter {SamAccountName -like $name}  | Format-Table SamAccountName,GivenName,SurName,Enabled -A
}

$UserStatus | Out-File -FilePath C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI_OVPN.csv -Encoding ascii

Remove-Variable * -ErrorAction SilentlyContinue
cls



Get-ADGroupMember GRPCBI_OVPN -Recursive | Get-ADUser -Properties * | Format-Table SamAccountName,DisplayName,Enabled -A | Out-File -FilePath C:\Users\PNCHIU\OneDrive\PowerShell\GroupMemberStatus\GRPCBI_OVPN.csv -Encoding ascii




$Users = Get-ADUser -Filter * -Properties * -SearchBase "OU=GRPCBI,DC=slake,DC=sssb,DC=com" | Select-Object SamAccountName,DisplayName,Enabled,MemberOf

$Users | Where {$_.MemberOf -eq "CN=VPN,OU=SD_ADMIN,OU=SYMGADM,DC=slake,DC=sssb,DC=com"} | select SamAccountName,DisplayName,Enabled | Export-CSV -Path C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI-VPN.csv











