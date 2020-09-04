Import-Module activedirectory

$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\userlist.txt

foreach ($user in $userlist)
{
    $slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
    Remove-ADGroupMember -Server $slakeacc1.HostName[0] -Identity "GRPSupport" -members $user
}

Remove-Variable * -ErrorAction SilentlyContinue