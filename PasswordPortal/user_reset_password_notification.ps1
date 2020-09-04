param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite

$check_account_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if ($check_account_slake.length -eq 0) {
    $check_account_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if ($check_account_slakeacc1.length -eq 0) {
        Write-Host "No Record Found"
    }
    elseif ($check_account_slakeacc1.length -ne 0) {
        $get_SamAccountName_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
        $get_DisplayName_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName
		
		# Send successful reset password notification to user
		$PSEmailServer = "172.16.1.21"
		$SMTPPort = "25"
		$MailFrom = "PC Support <pcsupport@silverglobe.com>"
		$MailTo = $user_email
		# $Cc = "pcsupport@silverglobe.com"
		$MailSubject = "Password Reset Successfully for Domain ID ($get_SamAccountName_slakeacc1)"
		$MailBody = 
		"<div style='font-family: Calibri, sans-serif;'>
		<p>Hi $get_DisplayName_slakeacc1,</p>
		<p>Your domain id's password has been reset successfully.<br><br>
		Thanks.<br><br>
		Regards,<br><br>
		PC Support<br>System Department<br>
		Silverlake Group of Companies<br>
		Level 2A KPMG Tower,<br>
		First Avenue, Bandar Utama,<br>
		47800 Petaling Jaya,<br>
		Selangor Darul Ehsan, Malaysia.
		</p>
		</div>"

		Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -BodyAsHTML -DeliveryNotificationOption 'OnFailure','Delay'
		
		Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_SamAccountName_slakeacc1 $get_SamAccountName_slakeacc1 - Reset Successfully" | 
		Out-file C:\logs\PasswordResetPortal\UserResetPasswordSuccessfulLogs.txt -append
    }
}
elseif ($check_account_slake.length -ne 0) {
    $get_SamAccountName_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    $get_DisplayName_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName
		
	# Send successful reset password notification to user
	$PSEmailServer = "172.16.1.21"
	$SMTPPort = "25"
	$MailFrom = "PC Support <pcsupport@silverglobe.com>"
	$MailTo = $user_email
	# $Cc = "pcsupport@silverglobe.com"
	$MailSubject = "Password Reset Successfully for Domain ID ($get_SamAccountName_slake)"
	$MailBody = 
	"<div style='font-family: Calibri, sans-serif;'>
	<p>Hi $get_DisplayName_slake,</p>
	<p>Your domain id's password has been reset successfully.<br><br>
	Thanks.<br><br>
	Regards,<br><br>
	PC Support<br>System Department<br>
	Silverlake Group of Companies<br>
	Level 2A KPMG Tower,<br>
	First Avenue, Bandar Utama,<br>
	47800 Petaling Jaya,<br>
	Selangor Darul Ehsan, Malaysia.
	</p>
	</div>"

	Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -BodyAsHTML -DeliveryNotificationOption 'OnFailure','Delay'
		
	Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_SamAccountName_slake $get_SamAccountName_slake - Reset Successfully" | 
	Out-file C:\logs\PasswordResetPortal\UserResetPasswordSuccessfulLogs.txt -append
}