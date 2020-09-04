Import-CSV "E:\OneDrive\Work\PowerShell\BatchEmailSending\SetPassword\Cases\#6963.csv" | ForEach-Object { 
$SamAccount = $_.SamAccountName
$EmailTo = $_.EmailAddress

# Generate random password
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

# Get Full Name
$FullName = Get-ADuser -Filter { SamAccountName -eq $SamAccount } -Properties DisplayName | Select -ExpandPropert DisplayName

# Reset AD password
Set-ADAccountPassword -Identity $SamAccount -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)

# Send email notice user
$PSEmailServer = "172.16.1.21"
$SMTPPort = "25"
$MailFrom = "PC Support <pcsupport@silverglobe.com>"
$Credential = Import-CliXml -Path "E:\pcsupport.txt"
$MailTo = $EmailTo
$Cc = "pcsupport@silverglobe.com"
$MailSubject = "Reset Password for Domain ID ($SamAccount)"
$MailBody =
"<div style='font-family: Calibri, sans-serif;'>
<p>Hi $FullName,</p>
<p>Your domain id's password is expired and it has been reset to :-<br></b>
<b><p style='font-size: 24pt;'>$password</p></b></b>
<p style='font-size: 10pt; font-family: Arial, sans-serif;'>
Thanks.<br><br>Regards,<br><br>PC Support<br>System Department<br>Silverlake Group of Companies<br>Level 2A KPMG Tower,<br>First Avenue, Bandar Utama,<br>
47800 Petaling Jaya,<br>Selangor Darul Ehsan, Malaysia.
	</p>
</div>"

Send-MailMessage -From $MailFrom -To $MailTo -Cc $Cc -Subject $MailSubject -Body $MailBody -Port $SMTPPort -Credential $Credential -BodyAsHTML -DeliveryNotificationOption 'OnFailure','Delay'
}

#Import-CSV "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530.csv" | 
#Select-Object *,@{Name='Status';Expression={Get-Date -Format “dd/MM/yyyy HH:mm K”}} | 
#Export-CSV "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530-temp.csv" -NoTypeInformation
#Remove-Item -Path "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530.csv"
#Rename-Item -Path "C:\Users\PNCHIU\OneDrive\PowerShell\BatchEmailSending\SetPassword\#4530-temp.csv" -NewName '#4530.csv'