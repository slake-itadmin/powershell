param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite
$group_member_slake = Get-ADuser -Filter { EmailAddress -eq $user_email }
if (!$group_member_slake) {
    $test_group = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName
    if (!$test_group) {
        Write-Host "No Record Found!!!"
    }
    else {
        $group_member_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email }
        $ou_slakeacc1 = $group_member_slakeacc1.distinguishedname.substring($group_member_slakeacc1.distinguishedname.indexof(",") + 1, $group_member_slakeacc1.distinguishedname.Length - $group_member_slakeacc1.distinguishedname.indexof(",") - 2)
        $workstation_slakeacc1 = $ou_slakeacc1.Trim("OU=")
        $group_member_slakeacc1_result = $workstation_slakeacc1.Trim(",DC=slakeacc1,DC=sssb,DC=com")
        $group_member_slakeacc1_result
    }
}
else {
    $ou_slake = $group_member_slake.distinguishedname.substring($group_member_slake.distinguishedname.indexof(",") + 1, $group_member_slake.distinguishedname.Length - $group_member_slake.distinguishedname.indexof(",") - 1)
    $workstation_slake = $ou_slake.Trim("OU=")
    $group_member_slake_result = $workstation_slake.Trim(",DC=slake,DC=sssb,DC=com")
    $group_member_slake_result
}
