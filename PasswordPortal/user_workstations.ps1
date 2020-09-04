param ([string] $user_email)


$user_email = 'edmund@silverglobe.com'
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$workstation_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties UserWorkstations | Select -ExpandPropert UserWorkstations
$test_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName

if (!$workstation_slake) {
    $workstation_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties UserWorkstations | Select -ExpandPropert UserWorkstations
    $test_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName
	if ($workstation_slakeacc1) {
        $workstation_slakeacc1
    }
    elseif ($test_slake) {
        Write-Host "All Computers"
    }
	elseif ($test_slakeacc1) {
		Write-Host "All Computers"
	}
    else {
        Write-Host "No Record Found!!!"
    }
}
else {
    $workstation_slake
}