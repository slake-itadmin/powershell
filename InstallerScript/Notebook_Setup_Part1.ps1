#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Select version want to install
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Do {
	$symantec_version = Read-Host "Select the version of Symantec - [ITEC_SLAKE, ITEC_SLAKEACC1, SCOMM, SDE, SDIST, SSSVC]"
	If ($symantec_version -eq "ITEC_SLAKE" -or $symantec_version -eq "ITEC_SLAKEACC1" -or $symantec_version -eq "SCOMM" -or $symantec_version -eq "SDE" -or $symantec_version -eq "SDIST" -or $symantec_version -eq "SSSVC") {
		$valid_symantec_version = "True"
    }
	Else {
		$valid_symantec_version = "False"
	}
}
Until ($valid_symantec_version -eq "True")

Do {
	$msoffice_version = Read-Host "Select the version of Microsoft Office - [2016, 2019]"
	If ($msoffice_version -eq "2016" -or $msoffice_version -eq "2019") {
		$valid_office_version = "True"
    }
	Else {
		$valid_office_version = "False"
	}
}
Until ($valid_office_version -eq "True")

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Set Static IP
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Function Test-InternetConnection {
	[CmdletBinding()]
	param()
	process {
		[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
	}
}
$test_internet_connection = Test-InternetConnection
if ($test_internet_connection -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_41
	Start-Sleep -s 6
	Function Test-InternetConnection1 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection1 = Test-InternetConnection1
}
if ($test_internet_connection1 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.41" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection1 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_42
	Start-Sleep -s 6
	Function Test-InternetConnection2 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection2 = Test-InternetConnection2
}
if ($test_internet_connection2 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.42" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection2 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_43
	Start-Sleep -s 6
	Function Test-InternetConnection3 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection3 = Test-InternetConnection3
}
if ($test_internet_connection3 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.43" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection3 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_44
	Start-Sleep -s 6
	Function Test-InternetConnection4 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection4 = Test-InternetConnection4
}
if ($test_internet_connection4 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.44" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection4 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_45
	Start-Sleep -s 6
	Function Test-InternetConnection5 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection5 = Test-InternetConnection5
}
if ($test_internet_connection5 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.45" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection5 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_46
	Start-Sleep -s 6
	Function Test-InternetConnection6 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection6 = Test-InternetConnection6
}
if ($test_internet_connection6 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.46" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection6 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_47
	Start-Sleep -s 6
	Function Test-InternetConnection3 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection7 = Test-InternetConnection7
}
if ($test_internet_connection7 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.47" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection7 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_48
	Start-Sleep -s 6
	Function Test-InternetConnection8 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection8 = Test-InternetConnection8
}
if ($test_internet_connection8 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.48" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($test_internet_connection8 -eq $False) {
	Start-Process $home\Desktop\Installer\IP_Address\SLAKE_STATICIP_49
	Start-Sleep -s 6
	Function Test-InternetConnection9 {
		[CmdletBinding()]
		param()
		process {
			[Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]'{DCB00C01-570F-4A9B-8D69-199FDBA5723B}')).IsConnectedToInternet
		}
	}
	$test_internet_connection9 = Test-InternetConnection9
}
if ($test_internet_connection9 -eq $True) {
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 172.16.1.49" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Create PC Specs
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$filePath = "$home\Desktop\" + $env:UserName + "_PC_SPECS.csv"
$extractDate = $('{0:dd-MM-yyyy} {0:HH:mm:ss}' -f (Get-Date)) 
$serialNo = Get-Ciminstance Win32_Bios | Select-Object SerialNumber
$cpuDetails = Get-WmiObject Win32_Processor
$memoryGB = Get-WmiObject CIM_PhysicalMemory | Measure-Object -Property Capacity -Sum | % {[Math]::round(($_.sum / 1GB),2)} 
$hardDisk = Get-PhysicalDisk | Select-Object Size
$hardDiskTotalGB = ""
if ($hardDisk[0].Size) {
	$hardDiskTotalGB = [Math]::Round($hardDisk.Size[0]/1000000000)
}
if ($hardDisk[1].Size) {
	$hardDiskTotalGB += [Math]::Round($hardDisk.Size[1]/1000000000)
}
# Get MAC addresses (and after that remove dashes)
$macAddressEthernet = Get-Netadapter | Where-Object Name -eq "Ethernet"
$macAddressWiFi = Get-Netadapter | Where-Object Name -eq "Wi-Fi"
# Output in a single line for better CSV processing
$csvLine =  """$($env:UserName)"",""$($extractDate)"",""$($cpuDetails.MaxClockSpeed)"",""$($memoryGB)"",""$($hardDiskTotalGB)"",""$($serialNo.SerialNumber)"",""$($cpuDetails.Name)"",""$($macAddressEthernet.MacAddress.Replace(`"-`",`"`"))"",""$($macAddressWiFi.MacAddress.Replace(`"-`",`"`"))"""
Write-Output $csvLine | Out-file $filePath -NoNewline

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Configure Windows VPN
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$vpnregfile = "$home\Desktop\Installer\SLAKE_VPN\NoCertRevocationCheck.reg"
reg IMPORT $vpnregfile
Add-VpnConnection -Name "VPN Connection to SLAKE" -ServerAddress "slake.silverglobe.com" -AllUserConnection -TunnelType "Sstp" -EncryptionLevel "Required" -AuthenticationMethod Chap,MSChapv2 -PassThru
Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Windows VPN" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Change Computer Name
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$computer_name = $env:UserName
Rename-Computer -NewName $computer_name

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Create Adminla and Backup and add them into Administrator Group
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$adminla_password = 'c0ffe@ndm0Ch@'
New-LocalUser "Adminla" -Password $adminla_password -UserMayNotChangePassword -AccountNeverExpires -PasswordNeverExpires
$backup_password = 'B@ckup@1'
New-LocalUser "Backup" -Password $backup_password -UserMayNotChangePassword -AccountNeverExpires -PasswordNeverExpires

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Create Task Schedule
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-executionpolicy bypass -noprofile -file $home\Desktop\Installer\Notebook_Setup_Part2.ps1"
$trigger = New-ScheduledTaskTrigger -Atlogon
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopOnIdleEnd -Priority 3 -WakeToRun -Compatibility Win8 -MultipleInstances IgnoreNew
Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "Script" -RunLevel Highest -Force

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# 7-Zip Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing 7-Zip..."
Start-Process -FilePath "$home\Desktop\Installer\exe\7z920_x64.msi" -ArgumentList "/q" -Wait
Do {
	$7zip_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "7-Zip"
} While ($7zip_install_status -eq $null) 
$7zip_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "7-Zip"
if ($7zip_install_status -ne $null) {
	Write-Host "7-Zip Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful 7-Zip" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "7-Zip Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful 7-Zip" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Adobe Reader Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing Adobe Reader..."
Start-Process -FilePath "$home\Desktop\Installer\exe\AdbeRdr1013_en_US.exe" -ArgumentList "/qn /sAll /rs" -Wait
Do {
    $SoftwareKey = "HKLM:\Software" 
    if ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -Match "64-bit") { 
        $SoftwareKey = "HKLM:\Software\WOW6432Node"
    }
    if (Test-Path "$SoftwareKey\adobe\Acrobat Reader") { 
        $adobeversion = get-childitem "$SoftwareKey\adobe\Acrobat Reader"
    }
} While ($adobeversion -eq $null) 
$SoftwareKey = "HKLM:\Software" 
    if ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -Match "64-bit") { 
        $SoftwareKey = "HKLM:\Software\WOW6432Node"
    }
    if (Test-Path "$SoftwareKey\adobe\Acrobat Reader") { 
        $adobeversion = get-childitem "$SoftwareKey\adobe\Acrobat Reader"
    }
if ($adobeversion -ne $null) {
    Write-Host "Adobe Reader Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Adobe Reader" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "Adobe Reader Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Adobe Reader" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -append
}

#----------------------------------------------------------------------------------------------------------------------------------------------------------
# Chrome Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing Chrome..."
Start-Process -FilePath "$home\Desktop\Installer\exe\Chrome64.exe" -Args "/silent /install" -Verb RunAs -Wait
Do {
	$chrome_install_status = (Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo
} While ($chrome_install_status -eq $null)
$chrome_install_status = (Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo 
if ($chrome_install_status -ne $null) {
	Write-Host "Chrome Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Google Chrome" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "Chrome Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Google Chrome" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#--------------------- --------------------------------------------------------------------------------------------------------------------------------------
# vcredist_x86 Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing vcredist_x86..."
Start-Process -FilePath "$home\Desktop\Installer\exe\vcredist_x86.exe" -ArgumentList "/q" -Wait
Do {
	$vcredist_x86_install_status = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%Microsoft Visual C++ 2005 Redistributable%'"
} While ($vcredist_x86_install_status -eq $null)
$vcredist_x86_install_status = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%Microsoft Visual C++ 2005 Redistributable%'"
if ($vcredist_x86_install_status -ne $null) {
	Write-Host "vcredist_x86 Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful vcredist_x86" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "vcredist_x86 Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful vcredist_x86" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# vcredist_x64 Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing vcredist_x64..."
Start-Process -FilePath "$home\Desktop\Installer\exe\vcredist_x64.exe" -ArgumentList "/q" -Wait
Do {
	$vcredist_x64_install_status = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%Microsoft Visual C++ 2005 Redistributable (x64)%'"
} While ($vcredist_x64_install_status -eq $null)
$vcredist_x64_install_status = Get-WmiObject -Class Win32_Product -Filter "Name LIKE '%Microsoft Visual C++ 2005 Redistributable (x64)%'"
if ($vcredist_x64_install_status -ne $null) {
	Write-Host "vcredist_x64 Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful vcredist_x64" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "vcredist_x64 Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful vcredist_x64" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# FortiClient VPN Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing FortiClient VPN..."
Start-Process -FilePath "$home\Desktop\Installer\exe\FortiClientVPN_full.exe" -ArgumentList "/quiet" -Wait
Do {
	$forticlient_install_status =  (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "FortiClient VPN"
} While ($forticlient_install_status -eq $null) 
$forticlient_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "FortiClient VPN"
if ($forticlient_install_status -ne $null) {
	Write-Host "FortiClient VPN Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful FortiClient VPN" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "FortiClient VPN Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful FortiClient VPN" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# TeamViewer Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing TeamViewer..."
Start-Process -FilePath "$home\Desktop\Installer\exe\TeamViewer_Setup.exe" -ArgumentList "/S" -Wait
Do {
	$teamviewer_install_status =  (gp HKLM:\SOFTWARE\WOW6432Node\*).InstallationDirectory -Match "TeamViewer"
} While ($teamviewer_install_status -eq $null)
$teamviewer_install_status =  (gp HKLM:\SOFTWARE\WOW6432Node\*).InstallationDirectory -Match "TeamViewer"
if ($teamviewer_install_status -ne $null) {
	Write-Host "TeamViewer Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful TeamViewer" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "TeamViewer Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful TeamViewer" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Microsoft Teams Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Write-Host "Installing Microsoft Teams..."
Start-Process -FilePath "$home\Desktop\Installer\exe\TeamsWindows_x64.exe" -ArgumentList "/s" -Wait
Do {
	$teams_install_status =  Test-Path $home\AppData\Local\Microsoft\Teams\current\Teams.exe
} While ($teams_install_status -eq $False)
$teams_install_status =  Test-Path $home\AppData\Local\Microsoft\Teams\current\Teams.exe
if ($teams_install_status -eq $True) {
	Write-Host "Microsoft Teams Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Microsoft Teams" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
elseif ($teams_install_status -eq $False) {
	Write-Host "Microsoft Teams Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Microsoft Teams" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Microsoft Office Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
if (msoffice_version = "2019") {
	Mount-DiskImage -PassThru $home\Desktop\Installer\OFFICE2019\HomeBusiness2019Retail.img
	Write-Host "Installing Microsoft Office 2019 (64Bit)..."
	Start-Sleep -s 2
	$cd_driver_letter = (Get-WmiObject win32_logicaldisk -filter 'DriveType=5' | ForEach-Object { $_.DeviceID })
	if ($cd_driver_letter -eq "D:") {
		cd D:
		Start-Process -FilePath D:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "E:") {
		cd E:
		Start-Process -FilePath E:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "F:") {
		cd F:
		Start-Process -FilePath F:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "G:") {
		cd G:
		Start-Process -FilePath G:\Office\Setup64.exe -Verb RunAs -Wait
	}
	$Office2019_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Office Home and Business 2019"
	if ($Office2019_install_status -ne $null) {
		Dismount-DiskImage $home\Desktop\Installer\OFFICE2019\HomeBusiness2019Retail.img
		Write-Host "Microsoft Office 2019 Installation Is Completed"
		Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Microsoft Office 2019" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
	}
	else {
		Write-Host "Microsoft Office 2019 Installation Is Not Completed"
		Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Microsoft Office 2019" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
	}
}
elseif (msoffice_version = "2016") {
	Mount-DiskImage -PassThru $home\Desktop\Installer\OFFICE2016\HomeBusiness2016Retail.img
	Write-Host "Installing Microsoft Office 2016 (64Bit)..."
	Start-Sleep -s 2
	$cd_driver_letter = (Get-WmiObject win32_logicaldisk -filter 'DriveType=5' | ForEach-Object { $_.DeviceID })
	if ($cd_driver_letter -eq "D:") {
		cd D:
		Start-Process -FilePath D:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "E:") {
		cd E:
		Start-Process -FilePath E:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "F:") {
		cd F:
		Start-Process -FilePath F:\Office\Setup64.exe -Verb RunAs -Wait
	}
	elseif ($cd_driver_letter -eq "G:") {
		cd G:
		Start-Process -FilePath G:\Office\Setup64.exe -Verb RunAs -Wait
	}
	$Office2019_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "Office Home and Business 2016"
	if ($Office2019_install_status -ne $null) {
		Dismount-DiskImage $home\Desktop\Installer\OFFICE2019\HomeBusiness2016Retail.img
		Write-Host "Microsoft Office 2016 Installation Is Completed"
		Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Microsoft Office 2016" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
	}
	else {
		Write-Host "Microsoft Office 2016 Installation Is Not Completed"
		Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Microsoft Office 2016" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
	}
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Symantec Endpoint Protection Installtion
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$symantec_installer = "${home}\Desktop\Installer\SYMANTEC\" + $symantec_version.ToUpper() + '\setup.exe'
Write-Host "Installing Symantec Endpoint Protection..."
Start-Process -FilePath $symantec_installer -ArgumentList '/s /v"/qn"' -Verb RunAs -Wait
$symantec_install_status = (gp HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*).DisplayName -Match "symantec endpoint protection"
if ($symantec_install_status -ne $null) {
	Write-Host "Symantec Endpoint Protection Installation Is Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Successful Symantec Endpoint Protection" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}
else {
	Write-Host "Symantec Endpoint Protection Installation Is Not Completed"
	Write-Output "$('[{0:MM/dd/yyyy} {0:HH:mm:ss}]' -f (Get-Date)) Unsuccessful Symantec Endpoint Protection" | Out-file "$home\Desktop\Notebook_Setup_Log.txt" -Append
}

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Join Domain
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
$computer_name = $env:computername
$username = 'slake\sunil'
$password = 'abc$123'
$domain = 'slake.sssb.com'
$pwdSecureString = ConvertTo-SecureString -Force -AsPlainText $password
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $userName, $pwdSecureString
Add-Computer -ComputerName $computer_name -DomainName $domain -Credential $credential

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
# Add GRPSupport domain account to Administrator Group
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
Add-LocalGroupMember -Group "Administrators" -Member "SLAKE\GRPSupport"
gpupdate /force