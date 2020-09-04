#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Check Join Domain Result
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$domain_name = (Get-WmiObject Win32_ComputerSystem).Domain
$slake_domain = $false
if ($domain_name -eq 'slake.sssb.com') {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Join Domain" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Join Domain" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Move PC Specs to \\d0903
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$username = 'slake\sunil'
$password = 'abc$123'
$pwdSecureString = ConvertTo-SecureString -Force -AsPlainText $password
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $pwdSecureString
$file_path = "$home\Desktop\" + $env:UserName + "_PC_SPECS.csv"
$destination = "\\d0903\Documentation\1Laptop Setup\MAC Address PC Specs"
Move-Item -Path $file_path -Destination $destination -Credential $credential

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# I Series 
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
cd $home
Desktop\Installer\V7R1\image64a\setup.exe /S /V" /qn"
Do {
	$ibm_install_status = Test-Path "C:\Program Files (x86)\IBM\Client Access\cwbunnav.exe"
	Write-Host "Installing IBM i Access..."
	Start-Sleep -s 5
} While ($ibm_install_status -eq $False)
if ($ibm_install_status -eq $True) {
	Write-Host "IBM i Access Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful IBM i Access" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($ibm_install_status -eq $False) {
	Write-Host "IBM i Access Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful IBM i Access" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
Copy-Item -Path "$home\Desktop\Installer\V7R1\cwbssldf.kdb" -Destination "C:\Users\Public\Documents\IBM\Client Access" 

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Set DHCP
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Start-Process $home\Desktop\Installer\IP_Address\DHCP

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Delete Task Schedule
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Unregister-ScheduledTask -TaskName "Script" -Confirm:$false

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Delete Installer
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Remove-Item -Path "$home\Desktop\Installer" -Recurse -Force
