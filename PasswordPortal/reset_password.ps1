param ([string] $login_email, $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite

function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs = ""
    return [String]$characters[$random]
}
function Scramble-String([string]$inputString) {     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}

$password = Get-RandomCharacters -length 4 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 2 -characters '1234567890'
$password += Get-RandomCharacters -length 1 -characters '!$%&?@#'
$password = Scramble-String $password

$check_account_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if ($check_account_slake.length -eq 0) {
    $check_account_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if ($check_account_slakeacc1.length -eq 0) {
        Write-Host "No Record Found!!!"
    }
    elseif ($check_account_slakeacc1.length -ne 0) {
        $get_login_user_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $login_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
        $get_samAccount_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
        $get_userName_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName
        
        Set-ADAccountPassword -Server $slakeacc1.HostName[0] -Identity $get_samAccount_slakeacc1 -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)
        
        $PSEmailServer = "172.16.1.21"
        $SMTPPort = "25"
        $MailFrom = "PC Support <pcsupport@silverglobe.com>"
        $credential = Import-CliXml -Path "E:\pcsupport.txt"
        $MailTo = "edmundchiu@silverglobe.com"
        $Cc = "pcsupport@silverglobe.com"
        $MailSubject = "Reset Password for Domain ID ($get_samAccount_slakeacc1)"
        $Attachment = "E:\Guide\HOWTO-Change domain password over FortiClient-VPN-Win10.pdf", "E:\Guide\HOWTO-Setup VPN-FortiClient-Win10.pdf"
        $MailBody =
        "<div style='font-family: Calibri, sans-serif;'>
        <p>Hi $get_userName_slakeacc1,</p>
        <p>Your domain id's password is expired and it has been reset to :-<br>
        <b><p style='font-size: 24pt;'>$password</p></b><br>
        Please follow the guide in attachment to change your domain id's password.<br>
        If your laptop doesn't have FortiClient, please follow the guide to install it.
        <p style='font-size: 10pt; font-family: Arial, sans-serif;'>
        Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
        47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
        </p>
        </div>
        <br>"
        Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -Credential $Credential -BodyAsHTML -Attachments $Attachment -DeliveryNotificationOption 'OnFailure', 'Delay'
        
        Write-Host "Reset Successfully, please check your email."
	Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_login_user_slakeacc1 $get_samAccount_slakeacc1" | Out-file C:\logs\PasswordResetPortal\ResetPasswordLogs.txt -append
    }
}
elseif ($check_account_slake.length -ne 0) {
    $get_login_user_slake = Get-ADuser -Filter { EmailAddress -eq $login_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    $get_samAccount_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    $get_userName_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName

    Set-ADAccountPassword -Identity $get_samAccount_slake -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)

    $PSEmailServer = "172.16.1.21"
    $SMTPPort = "25"
    $MailFrom = "PC Support <pcsupport@silverglobe.com>"
    $credential = Import-CliXml -Path "E:\pcsupport.txt"
    $MailTo = "edmundchiu@silverglobe.com"
    $Cc = "pcsupport@silverglobe.com"
    $MailSubject = "Reset Password for Domain ID ($get_samAccount_slake)"
    $Attachment = "E:\Guide\HOWTO-Change domain password over FortiClient-VPN-Win10.pdf", "E:\Guide\HOWTO-Setup VPN-FortiClient-Win10.pdf"
    $MailBody =
    "<div style='font-family: Calibri, sans-serif;'>
<p>Hi $get_userName_slake,</p>
<p>Your domain id's password is expired and it has been reset to :-<br>
<b><p style='font-size: 24pt;'>$password</p></b><br>
Please follow the guide in attachment to change your domain id's password.<br>
If your laptop doesn't have FortiClient, please follow the guide to install it.
<p style='font-size: 10pt; font-family: Arial, sans-serif;'>
Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
</p>
</div>
<br>"
    Send-MailMessage -From $MailFrom -To $MailTo -Subject $MailSubject -Body $MailBody -Port $SMTPPort -Credential $Credential -BodyAsHTML -Attachments $Attachment -DeliveryNotificationOption 'OnFailure', 'Delay'

    Write-Host "Reset Successfully, please check your email."
    Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $get_login_user_slake $get_samAccount_slake" | Out-file C:\logs\PasswordResetPortal\ResetPasswordLogs.txt -append
}