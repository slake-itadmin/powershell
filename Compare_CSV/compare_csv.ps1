$oldpcspec = Import-Csv -Path E:\OneDrive\Work\PowerShell\Compare_CSV\OldN5410.csv -Header 'PCID', 'Date Captured', 'Clock Speed', 'RAM', 'HHD', 'Serial', 'CPU', 'Ethernet', 'WIFI'
$check = $oldpcspec | Group-Object -AsHashTable -AsString -Property PCID

$newpcspec = Import-Csv -Path E:\OneDrive\Work\PowerShell\Compare_CSV\NewN5410.csv -Header 'PCID', 'Date Captured', 'Clock Speed', 'RAM', 'HHD', 'Serial', 'CPU', 'Ethernet', 'WIFI'
$newpcspec | foreach {
    $PCID = $_.PCID
    Write-Verbose "Looking for $PCID"
    if ($check.ContainsKey($PCID))
    {        
        $oldRAM = ($check[$PCID]).RAM; $oldHHD = ($check[$PCID]).HHD; $oldSerial = ($check[$PCID]).Serial; $oldCPU = ($check[$PCID]).CPU;$oldEthernet = ($check[$PCID]).Ethernet; $oldWIFI = ($check[$PCID]).WIFI
    }
    else
    {       
        $oldPCID = "Unknown"; $oldRAM = "Unknown"; $oldHHD = "Unknown"; $oldSerial = "Unknown"; $oldCPU = "Unknown";$oldEthernet = "Unknown"; $oldWIFI = "Unknown"
    }
    if ($_.RAM -ne $oldRAM)
    {
        Write-Host("RAM ERROR | Previous: " + $oldRAM + "  Now: " + $_.RAM | Out-GridView)   
    } 
    if ($_.HHD -ne $oldHHD)
    {
        Write-Host("HHD ERROR | Previous: " + $oldHHD + "  Now: " + $_.HHD | Out-GridView)   
    }
    if ($_.Serial -ne $oldSerial)
    {
        Write-Host("Serial ERROR | Previous: " + $oldSerial + "  Now: " + $_.Serial | Out-GridView)   
    }
    if ($_.CPU -ne $oldCPU)
    {
        Write-Host("CPU ERROR | Previous: " + $oldCPU + "  Now: " + $_.CPU | Out-GridView)   
    }
    if ($_.Ethernet -ne $oldEthernet)
    {
        Write-Host("Ethernet ERROR | Previous: " + $oldEthernet + "  Now: " + $_.Ethernet | Out-GridView)
    }
    if ($_.WIFI -ne $oldWIFI)
    {
        Write-Host("WIFI ERROR | Previous: " + $oldWIFI + "  Now: " + $_.WIFI | Out-GridView)
    }
}

if ($newpcspec.RAM -eq $oldRAM)
{
    Write-Host("Ram OK" )
}
if ($newpcspec.HHD -eq $oldHHD)
{
    Write-Host("HHD OK")
}
if ($newpcspec.Serial -eq $oldSerial)
{
    Write-Host("Serial OK")
}
if ($newpcspec.CPU -eq $oldCPU)
{
    Write-Host("CPU OK")
}
if ($newpcspec.Ethernet -eq $oldEthernet)
{
    Write-Host("Ethernet OK")
}
if ($newpcspec.WIFI -eq $oldWIFI)
{
    Write-Host("WIFI OK")
}

#Sample Output
#$newpcspec | Out-GridView
#$newpcspec | Out-File -FilePath C:\Users\Edmund\Desktop\Result.txt -Encoding ascii
#$newpcspec | Export-Csv -Path C:\Users\Edmund\Desktop\Result.csv -NoType -Encoding ASCII