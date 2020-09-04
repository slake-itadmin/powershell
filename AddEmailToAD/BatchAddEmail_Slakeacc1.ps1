$users = Import-Csv E:\OneDrive\Work\PowerShell\AddEmailToAD\Slakeacc1_True_Test.csv

foreach ($user in $users) {
	$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
    Set-ADUser -Server $slakeacc1.HostName[0] -Identity $user.SamAccountName -EmailAddress $user.EmailAddress
}