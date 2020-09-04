param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$last_bad_password_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LastBadPasswordAttempt | Select -ExpandPropert LastBadPasswordAttempt
if (!$last_bad_password_slake) {
    $last_bad_password_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LastBadPasswordAttempt | Select -ExpandPropert LastBadPasswordAttempt
    if (!$last_bad_password_slakeacc1) {
        Write-Host "No Record Found!!!"
    }
    elseif ($last_bad_password_slakeacc1) {
        ($last_bad_password_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }
}
else {
    ($last_bad_password_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
