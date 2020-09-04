# Get AD user detail 
#$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\userlist.csv | foreach-object {Get-AdUser -Identity #$user -Properties * | Select-object SamAccountName,DisplayName,EmailAddress} | Export-CSV -Path C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\Test2.csv


Import-CSV "C:\Users\PNCHIU\OneDrive\Work\PowerShell\BatchEmailSending\SetPassword\Cases\#5479.csv" | ForEach-Object { 
$SamAccount = $_.SamAccountName
$UserName = $_.DisplayName
$EmailTo = $_.EmailAddress

# Reset password
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

# Get full name
$FullName = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { SamAccountName -eq $SamAccount } -Properties DisplayName | Select -ExpandPropert DisplayName

# Reset AD password
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
Set-ADAccountPassword -Server $slakeacc1.HostName[0] -Identity $SamAccount -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)

# Send email notice user
$PSEmailServer = "172.16.1.21"
$SMTPPort = "587"
$MailFrom = "PC Support <pcsupport@silverglobe.com>"
$credential = Import-CliXml -Path "C:\pcsupport.txt"
$MailTo = $EmailTo
$Cc = "pcsupport@silverglobe.com"
$MailSubject = "Reset Password for Domain ID ($SamAccount)"
$Attachment = "C:\Guide\HOWTO-Change domain password over FortiClient-VPN-Win10.pdf","C:\Guide\HOWTO-Setup VPN-FortiClient-Win10.pdf"
$MailBody =
"<div style='font-family: Calibri, sans-serif;'>
	<p>Hi $UserName,</p>
	<p>
		Your domain id's password is expired and it has been reset to <b>$Password</b> .<br>
        Please follow the guide in attachment to change your domain id's password.<br>
        If FortiClient is not installed, please follow the guide to install it.
	<p style='font-size: 10pt; font-family: Arial, sans-serif;'>
		Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
	</p>
</div>
<br></br></br>"

Send-MailMessage -From $MailFrom -To $MailTo -Cc $Cc -Subject $MailSubject -Body $MailBody -Port $SMTPPort -Credential $Credential -BodyAsHTML -Attachments $Attachment -DeliveryNotificationOption 'OnFailure','Delay'
}

#Import-CSV "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530.csv" | 
#Select-Object *,@{Name='Status';Expression={Get-Date -Format “dd/MM/yyyy HH:mm K”}} | 
#Export-CSV "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530-temp.csv" -NoTypeInformation
#Remove-Item -Path "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530.csv"
#Rename-Item -Path "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530-temp.csv" -NewName '#4530.csv'