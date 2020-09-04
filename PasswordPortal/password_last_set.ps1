param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$password_last_set_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties PasswordLastSet | Select -ExpandPropert PasswordLastSet
if (!$password_last_set_slake) {
    $password_last_set_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties PasswordLastSet | Select -ExpandPropert PasswordLastSet
    if (!$password_last_set_slakeacc1) {
        Write-Host "No Record Found!!!"
    }
    elseif ($password_last_set_slakeacc1) {
        ($password_last_set_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }   
}
else {
    ($password_last_set_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
