# Join Domain
$credentials = get-credential
$credentials | Export-CliXml -Path "$home\Desktop\Installer\edmund.txt"
$credfile = Import-CliXml -Path "$home\Desktop\Installer\edmund.txt"

Add-Computer -DomainName "slake.sssb.com" -Credential $credfile



# Get Office 365 Info
$credentials = get-credential
$credentials | Export-CliXml -Path "$home\Desktop\edmund.txt"
$credfile = Import-CliXml -Path "$home\Desktop\edmund.txt"
Connect-msolService -Credential $credfile
Get-Msoluser -all | Export-Csv -path "$home\desktop\o365user.txt"


#Show SecureString password
$credfile.GetNetworkCredential().password




$Key = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file $home\desktop\aes.key
(get-credential).Password | ConvertFrom-SecureString -key (get-content $home\desktop\aes.key) | set-content "$home\desktop\password.txt"
$password = Get-Content $home\desktop\password.txt | ConvertTo-SecureString -Key (Get-Content $home\desktop\aes.key)
$credential = New-Object System.Management.Automation.PsCredential("edmundchiu@silverglobe.com",$password)
Connect-msolService -Credential $credential
Get-MsolCompanyInformation





'ecpn$73547275' | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | set-content "$home\desktop\password.txt"
$username = 'edmundchiu@silverglobe.com'
$password = Get-Content $home\Desktop\password.txt
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $username,($password | ConvertTo-SecureString)
Connect-msolService -Credential $cred
Get-MsolCompanyInformation
