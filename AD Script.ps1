# Export all AD user
Get-ADUser -Filter * -Properties * | export-csv -path c:\export\allusers.scv

# Export all AD user from other domain
$dc = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
Get-ADUser -Server $dc.HostName[0] -Filter * -properties * | export-csv -path c:\acc1allusers.csv

# Export selected object 
Get-ADUser -Filter * -Properties * | Select-object CanonicalName, Name, DisplayName, whenCreated, 
LastLogonDate, LastBadPasswordAttempt, PasswordLastSet, LockedOut, LogonWorkstations| export-csv c:\ADusers.csv

# Find user belong to what group
(Get-ADUser edmund –Properties MemberOf).MemberOf

# Find out who in this group
Get-ADGroupMember -identity "CN=GRPSystem,OU=SYMGADM,DC=slake,DC=sssb,DC=com" | Select name

# Get all user of one group
Get-ADUser -Filter * -SearchBase "OU=GRPSSMS,DC=slake,DC=sssb,DC=com" | Select-Object Name

# Check whole group workstation
Get-ADUser -Filter * -Properties * -SearchBase "OU=GRPAS400,DC=slake,DC=sssb,DC=com" | Select-object CanonicalName,Name,LogonWorkstations

# Search user
Get-ADUser -Filter 'Name -like "*amxjliau"' -Properties * | Select-object CanonicalName,Name,LogonWorkstations

# Search other domain user
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
Get-ADUser -Server $slakeacc1.HostName[0] -Filter * -properties * -SearchBase "OU=GRPhr,DC=slakeacc1,DC=sssb,DC=com" | Select-object CanonicalName,displayName,LogonWorkstations

# Find out 1 company's users who is in VPN group.
$Users = Get-ADUser -Filter * -Properties * -SearchBase "OU=GRPCBI,DC=slake,DC=sssb,DC=com" | Select-Object SamAccountName,DisplayName,Enabled,MemberOf
$Users | Where {$_.MemberOf -eq "CN=VPN,OU=SD_ADMIN,OU=SYMGADM,DC=slake,DC=sssb,DC=com"} | select SamAccountName,DisplayName,Enabled | Export-CSV -Path C:\Users\PNCHIU\OneDrive\PowerShell\GRPCBI-VPN.csv

# Check selected user workstation
$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\20200420.txt

foreach ($user in $userlist)
{
    Get-AdUser -Identity $user -Properties LogonWorkstations | Select-object CanonicalName,Name,LogonWorkstations
}

# Check selected user account status
$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\20200420.txt

Foreach($user in $userlist)
{
    Get-ADUser -Identity $user -Properties * | select @{Name="Domain ID";Expression={$_.SamAccountName}},@{Name="Full Name";Expression={$_.DisplayName}},@{Name="Account Status";Expression={$_.Enabled}}
}

# Select specify and export specify object in AD
$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\userlist.csv | foreach-object {Get-AdUser -Identity $user -Properties * | Select-object SamAccountName,DisplayName,EmailAddress} | Export-CSV -Path C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\Test2.csv

# Find Which AD User got EmailAddress
Get-ADUser -Filter {EmailAddress -like "*"} -Properties EmailAddress | Select Name, EmailAddress  | Export-CSV E:\OneDrive\Work\PowerShell\AddEmailToAD\20200710-1346.csv

# Test AD's ID
runas /u:slake.sssb.com\sunil notepad.exe