param ([string] $LoginUser, $DomainId, $RandomKey) 

$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$full_name_slake = Get-ADuser -Filter { EmailAddress -eq $LoginUser } -Properties DisplayName | Select -ExpandPropert DisplayName 

if (!$full_name_slake) {   
	$full_name_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $LoginUser } -Properties DisplayName | Select -ExpandPropert DisplayName 
		
	# Send reset password's link to user's email
	$PSEmailServer = "172.16.1.21"
	$SMTPPort = "25"
	$MailFrom = "PC Support <pcsupport@silverglobe.com>"
	$MailTo = $LoginUser
	$Reset_link = 'http://172.16.1.168:8080/PasswordResetPortal/KeyCheck?random_key=' + $RandomKey + '&commit=Check'
	# $Cc = "pcsupport@silverglobe.com"
	$MailSubject = "Password Reset Link for Domain ID ($DomainId)"
	$MailBody = 
	"<div style='font-family: Calibri, sans-serif;'>
	<p>Hi $full_name_slakeacc1,</p>
	<p>You have request to reset your domain id's password.<br>Please click the link below to change your domain id's password.<br>
	<b><p style='font-size: 16pt;'><a href=$Reset_link>
	Reset Password Link</p></a>
	<p style='font-size: 10pt; font-family: Arial, sans-serif;'>
	Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
	47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
	</p>
	</div>"

	Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -BodyAsHTML -DeliveryNotificationOption 'OnFailure','Delay'

	Write-Host "Reset password link has send to your company email."
	Write-Host "Please click the link in your email to reset your password."
	Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $LoginUser $LoginUser" | 
	Out-file C:\logs\PasswordResetPortal\RequestResetPasswordLogs.txt -append
}

if ($full_name_slake -ne ""){
	# Send reset password's link to user's email
	$PSEmailServer = "172.16.1.21"
	$SMTPPort = "25"
	$MailFrom = "PC Support <pcsupport@silverglobe.com>"
	$MailTo = $LoginUser
	$Reset_link = 'http://172.16.1.168:8080/PasswordResetPortal/KeyCheck?random_key=' + $RandomKey + '&commit=Check'
	# $Cc = "pcsupport@silverglobe.com"
	$MailSubject = "Password Reset Link for Domain ID ($DomainId)"
	$MailBody = 
	"<div style='font-family: Calibri, sans-serif;'>
	<p>Hi $full_name_slake,</p>
	<p>You have request to reset your domain id's password.<br>Please click the link below to change your domain id's password.<br>
	<b><p style='font-size: 16pt;'><a href=$Reset_link>
	Reset Password Link</p></a>
	<p style='font-size: 10pt; font-family: Arial, sans-serif;'>
	Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
	47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
	</p>
	</div>"

	Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -BodyAsHTML -DeliveryNotificationOption 'OnFailure','Delay'

	Write-Host "Reset password link has send to your company email."
	Write-Host "Please click the link in your email to reset your password."
	Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $LoginUser $LoginUser" | 
	Out-file C:\logs\PasswordResetPortal\RequestResetPasswordLogs.txt -append
	}