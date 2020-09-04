Import-Module activedirectory

$userlist = Get-Content C:\Users\PNCHIU\OneDrive\Work\PowerShell\BatchUpdateAD\20200630.txt

foreach ($user in $userlist)
{
    $user = Get-ADUser -Identity $user -Properties userWorkstations
    $userWorkstations = [System.Collections.ArrayList] $user.userWorkstations.Split(",")
    $userWorkstations.Remove("V0811")
    $userWorkstations.Remove("V0812")
    $userWorkstations.Remove("V0830")
    $user.userWorkstations = $userWorkstations -join ","
    Set-ADUser -Instance $user
}

Remove-Variable * -ErrorAction SilentlyContinue