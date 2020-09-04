# 64Bit Windows with 32bit Microsoft Office 2016/2019
cd 'C:\Program Files (x86)\Microsoft Office\Office16'

# 64Bit Windows with 64bit Microsoft Office 2016/2019
cd 'C:\Program Files\Microsoft Office\Office16'

# Check Microsoft Office License's Status
cscript ospp.vbs /dstatus

# Activate Office
powershell.exe -executionpolicy bypass -command C:\ActivateOffice.ps1 -OfficeProductKey "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX" -ActivateOffice

# Uninstall Microsoft Office Product Key
cscript ospp.vbs /unpkey:XXXXX