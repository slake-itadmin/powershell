param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$full_name_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName 

if (!$full_name_slake) {   
    $full_name_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName 
    $full_name_slakeacc1
}

if ($full_name_slake){
	$full_name_slake
}

if (!$full_name_slake -AND !$full_name_slakeacc1) {
    Write-Host "No Record Found!!!"
}