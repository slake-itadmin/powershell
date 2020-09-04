param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$domain_id_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if (!$domain_id_slake) {
    $domain_id_slakacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if (!$domain_id_slakacc1) {
        Write-Host "No Record Found!!!"
    }
    elseif ($domain_id_slakacc1) {
		$slakeacc1_domain_name = 'SLAKEACC1\'
		$domain_id_slakacc1 = $domain_id_slakacc1.ToUpper()
        Write-Host $slakeacc1_domain_name$domain_id_slakacc1
    }
}
elseif ($domain_id_slake) {
	$slake_domain_name = 'SLAKE\'
	$domain_id_slake = $domain_id_slake.ToUpper()
    Write-Host $slake_domain_name$domain_id_slake
}