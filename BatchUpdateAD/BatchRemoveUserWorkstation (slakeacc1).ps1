Import-Module activedirectory

$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\userlist.txt

foreach ($user in $userlist)
{
    $slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
    $user = Get-ADUser -Server $slakeacc1.HostName[0] -Identity $user -Properties userWorkstations
    $userWorkstations = [System.Collections.ArrayList] $user.userWorkstations.Split(",")
    $userWorkstations.Remove("V0811")
    $userWorkstations.Remove("V0812")
    $userWorkstations.Remove("V0830")
    $user.userWorkstations = $userWorkstations -join ","
    Set-ADUser -Instance $user
}

Remove-Variable * -ErrorAction SilentlyContinue