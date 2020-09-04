param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$account_status_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties Enabled | Select -ExpandPropert Enabled 
if ($account_status_slake.length -eq 0) {
    $account_status_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties Enabled | Select -ExpandPropert Enabled 
    if ($account_status_slakeacc1.length -eq 0) {
        Write-Host "No Record Found!!!"
    }
    elseif ($account_status_slakeacc1.length -ne 0) {
        if (!$account_status_slakeacc1) {
            Write-Host "Disabled"
        }
        elseif ($account_status_slakeacc1) {
            Write-Host "Enabled"
        }
    }
}
elseif ($account_status_slake.length -ne 0) {
    if (!$account_status_slake) {
        Write-Host "Disabled"
    }
    elseif ($account_status_slake) {
        Write-Host "Enabled"
    }
}