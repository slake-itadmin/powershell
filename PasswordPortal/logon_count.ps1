param ([string] $user_email)
$result1 = Get-ADuser -Filter {EmailAddress -eq $user_email} -Properties logonCount | Select -ExpandPropert logonCount
$result1

if (!$result1) {
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$result2 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter {EmailAddress -eq $user_email} -Properties logonCount | Select -ExpandPropert logonCount
$result2
}

if(!$result1 -AND !$result2){
Write-Host "No Record Found!!!"
}