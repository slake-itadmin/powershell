param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$account_locked_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LockedOut | Select -ExpandPropert LockedOut
if ($account_locked_slake.length -eq 0) {
    $account_locked_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LockedOut | Select -ExpandPropert LockedOut
    if ($account_locked_slakeacc1.length -eq 0) {
        Write-Host "No Record Found!!!"
    }
    elseif ($account_locked_slakeacc1.length -ne 0) {
        $account_locked_slakeacc1
    }
}
elseif ($account_locked_slake.length -ne 0) {
    $account_locked_slake
}