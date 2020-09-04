param ([string] $login_email, $user_email)

$login_user_slake = Get-ADuser -Filter {EmailAddress -eq $login_email} -Properties SamAccountName | Select -ExpandPropert SamAccountName
$result1 = Get-ADuser -Filter {EmailAddress -eq $user_email} -Properties SamAccountName | Select -ExpandPropert SamAccountName
if ($result1.length -gt 0) {
	Unlock-ADAccount -Identity $result1
	$get_DisplayName_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName
	
	# Send successful reset password notification to user
	$PSEmailServer = "172.16.1.21"
	$SMTPPort = "25"
	$MailFrom = "PC Support <pcsupport@silverglobe.com>"
	$MailTo = $user_email
	# $Cc = "pcsupport@silverglobe.com"
	$MailSubject = "Unlock ID Successfully for Domain ID ($result1)"
	$MailBody = 
	"<div style='font-family: Calibri, sans-serif;'>
	<p>Hi $get_DisplayName_slake,</p>
	<p>Your domain id has been unlock successfully.<br><br>
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
	
	Write-Host "Account Unlocked!!!"
	Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $login_user_slake $result1" | Out-file C:\logs\PasswordResetPortal\UnlockAccountLogs.txt -append
}
elseif (!$result1) {
	$login_user_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter {EmailAddress -eq $login_email} -Properties SamAccountName | Select -ExpandPropert SamAccountName
	$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
	$result2 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter {EmailAddress -eq $user_email} -Properties SamAccountName | Select -ExpandPropert SamAccountName
	if ($result2.length -gt 0) {
		$credfile = Import-CliXml -Path "C:\slakeacc1_edmund.txt"
		Unlock-ADAccount -Server "slakeacc1.sssb.com" -Credential $credfile -Identity $result2
		$get_DisplayName_slakeacc1 = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName
		
		# Send successful reset password notification to user
		$PSEmailServer = "172.16.1.21"
		$SMTPPort = "25"
		$MailFrom = "PC Support <pcsupport@silverglobe.com>"
		$MailTo = $user_email
		# $Cc = "pcsupport@silverglobe.com"
		$MailSubject = "Unlock ID Successfully for Domain ID ($result2)"
		$MailBody = 
		"<div style='font-family: Calibri, sans-serif;'>
		<p>Hi $get_DisplayName_slakeacc1,</p>
		<p>Your domain id has been unlock successfully.<br><br>
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
		
		Write-Host "Account Unlocked!!!"
		Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $login_user_slakeacc1 $result2" | Out-file C:\logs\PasswordResetPortal\UnlockAccountLogs.txt -append
	}
	elseif(!$result1 -AND !$result2){
		Write-Host "No Record Found!!!"
	}
}