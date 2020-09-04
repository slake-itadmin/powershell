param ([string] $user_email, $password)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite

$check_account_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if ($check_account_slake.length -eq 0) {
    $check_account_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if ($check_account_slakeacc1.length -eq 0) {
        Write-Host "No Record Found!!!"
    }
    elseif ($check_account_slakeacc1.length -ne 0) {
        $get_samAccount_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
        
		try {
			Set-ADAccountPassword -Server $slakeacc1.HostName[0] -Identity $get_samAccount_slakeacc1 -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)
        }
		catch {
			Write-Host $Error[0]
		}

		Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_samAccount_slakeacc1 $get_samAccount_slakeacc1" | 
		Out-file C:\logs\PasswordResetPortal\UserResetPasswordLogs.txt -append
    }
}
elseif ($check_account_slake.length -ne 0) {
    $get_samAccount_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
	
	try {
		Set-ADAccountPassword -Identity $get_samAccount_slake -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)
	}
	catch {
		Write-Host $Error[0]
	}
  
    Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_samAccount_slake $get_samAccount_slake" | 
	Out-file C:\logs\PasswordResetPortal\UserResetPasswordLogs.txt -append
}