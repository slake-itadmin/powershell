Import-Module activedirectory

$computer1 = "V0811"
$computer2 = "V0812"
$computer3 = "V0830"
$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\userlist.txt

foreach ($user in $userlist)
{
    $slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
    $LogonWorkstations = Get-AdUser -Server $slakeacc1.HostName[0] -Identity $user -Properties LogonWorkstations | select -ExpandProperty LogonWorkstations
    if ($LogonWorkstations -gt 1) 
    {
    Set-ADUser -Server $slakeacc1.HostName[0] -Identity $user -LogonWorkstations "$LogonWorkstations,$computer1,$computer2,$computer3"
    }
    else 
    { 
    Set-ADUser -Server $slakeacc1.HostName[0] -Identity $user -LogonWorkstations "$computer1,$computer2,$computer3"
    }
}

Remove-Variable * -ErrorAction SilentlyContinue