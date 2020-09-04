param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$last_logon_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LastLogonDate | Select -ExpandPropert LastLogonDate
if (!$last_logon_slake) {
    $last_logon_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LastLogonDate | Select -ExpandPropert LastLogonDate
    if (!$last_logon_slakeacc1) {
        Write-Host "No Record Found!!!"
    }
    elseif ($last_logon_slakeacc1) {
        ($last_logon_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }   
}
else {
    ($last_logon_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
