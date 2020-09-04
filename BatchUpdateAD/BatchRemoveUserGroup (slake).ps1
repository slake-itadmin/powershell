Import-Module activedirectory

$userlist = Get-Content C:\Users\PNCHIU\OneDrive\Work\PowerShell\BatchUpdateAD\20200702.txt

foreach ($user in $userlist)
{
    Remove-ADGroupMember -Identity "GRPAEONHK_OVPN" -members $user
}

Remove-Variable * -ErrorAction SilentlyContinue