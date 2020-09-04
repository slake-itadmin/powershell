param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$password_expired_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties PasswordExpired | Select -ExpandPropert PasswordExpired
if ($password_expired_slake.length -eq 0) {
    $password_expired_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties PasswordExpired | Select -ExpandPropert PasswordExpired
    if ($password_expired_slakeacc1.length -eq 0) {
        Write-Host "No Record Found!!!"
    }
    elseif ($password_expired_slakeacc1.length -ne 0) {
        $password_expired_slakeacc1
    }
}
elseif ($password_expired_slake.length -ne 0) {
    $password_expired_slake
}