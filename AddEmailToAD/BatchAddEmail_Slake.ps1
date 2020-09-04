$users = Import-Csv E:\OneDrive\Work\PowerShell\AddEmailToAD\Slake_True.csv

foreach ($user in $users) {
    Set-ADUser -Identity $user.SamAccountName -EmailAddress $user.EmailAddress
}