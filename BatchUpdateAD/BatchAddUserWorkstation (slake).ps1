Import-Module activedirectory

$computer1 = "V0811"
$computer2 = "V0812"
$computer3 = "V0830"
$userlist = Get-Content C:\Users\PNCHIU\OneDrive\Work\PowerShell\BatchUpdateAD\20200630.txt


foreach ($user in $userlist)
{
    $LogonWorkstations = Get-AdUser -Identity $user -Properties LogonWorkstations | select -ExpandProperty LogonWorkstations
    if ($LogonWorkstations -gt 1) 
    {
        Set-ADUser -Identity $user -LogonWorkstations "$LogonWorkstations,$computer1,$computer2,$computer3"
    }
    else 
    { 
    Set-ADUser -Identity $user -LogonWorkstations "$computer1,$computer2,$computer3"
    }
}

Remove-Variable * -ErrorAction SilentlyContinue