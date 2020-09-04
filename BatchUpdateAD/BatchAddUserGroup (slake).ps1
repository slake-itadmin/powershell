Import-Module activedirectory

$userlist = Get-Content C:\Users\PNCHIU\OneDrive\PowerShell\BatchUpdateAD\userlist.txt

foreach ($user in $userlist)
{
    Add-AdGroupMember -Identity "GRPSupport" -members $user
}

Remove-Variable * -ErrorAction SilentlyContinue