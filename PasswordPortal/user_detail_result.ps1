param ([string] $user_email)
$slakeacc1 = Get-ADDomainController -DomainName slakeacc1.sssb.com -Discover -NextClosestSite

#================FULL NAME======================================================
$full_name_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName 
$full_name_slake

if (!$full_name_slake) {   
    $full_name_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName | Select -ExpandPropert DisplayName 
    $full_name_slakeacc1
}

if (!$full_name_slake -AND !$full_name_slakeacc1) {
    Write-Host "No Record Found"
}
#================================================================================


#================DOMAIN NAME=======================================================
$domain_id_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if (!$domain_id_slake) {
    $domain_id_slakacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if (!$domain_id_slakacc1) {
        Write-Host "No Record Found"
    }
    elseif ($domain_id_slakacc1) {
		$slakeacc1_domain_name = 'SLAKEACC1\'
        $slakeacc1_domain_name
    }
}
elseif ($domain_id_slake) {
	$slake_domain_name = 'SLAKE\'
	$slake_domain_name
}
#================================================================================


#================DOMAIN ID=======================================================
$domain_id_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
if (!$domain_id_slake) {
    $domain_id_slakacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties SamAccountName | Select -ExpandPropert SamAccountName
    if (!$domain_id_slakacc1) {
        Write-Host "No Record Found"
    }
    elseif ($domain_id_slakacc1) {
		$domain_id_slakacc1.ToUpper()
    }
}
elseif ($domain_id_slake) {
	$domain_id_slake.ToUpper()
}
#================================================================================


#================GROUP MEMBER====================================================
$group_member_slake = Get-ADuser -Filter { EmailAddress -eq $user_email }
if (!$group_member_slake) {
    $test_group = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties DisplayName
    if (!$test_group) {
        Write-Host "No Record Found"
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
#================================================================================


#================USER WORKSTATION================================================
$workstation_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties UserWorkstations | Select -ExpandPropert UserWorkstations
$test_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties DisplayName
if (!$workstation_slake) {
    $workstation_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties UserWorkstations | Select -ExpandPropert UserWorkstations
    if ($workstation_slakeacc1) {
        $workstation_slakeacc1
    }
    elseif ($test_slake) {
        Write-Host "All Computers"
    }
    else {
        Write-Host "No Record Found"
    }
}
else {
    $workstation_slake
}
#================================================================================


#================ACCOUNT STATUS==================================================
$account_status_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties Enabled | Select -ExpandPropert Enabled 
if ($account_status_slake.length -eq 0) {
    $account_status_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties Enabled | Select -ExpandPropert Enabled 
    if ($account_status_slakeacc1.length -eq 0) {
        Write-Host "No Record Found"
    }
    elseif ($account_status_slakeacc1.length -ne 0) {
        if (!$account_status_slakeacc1) {
            Write-Host "Deactivate"
        }
        elseif ($account_status_slakeacc1) {
            Write-Host "Active"
        }
    }
}
elseif ($account_status_slake.length -ne 0) {
    if (!$account_status_slake) {
        Write-Host "Deactivate"
    }
    elseif ($account_status_slake) {
        Write-Host "Active"
    }
}
#================================================================================


#================LOCKED OUT======================================================
$account_locked_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LockedOut | Select -ExpandPropert LockedOut
if ($account_locked_slake.length -eq 0) {
    $account_locked_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LockedOut | Select -ExpandPropert LockedOut
    if ($account_locked_slakeacc1.length -eq 0) {
        Write-Host "No Record Found"
    }
    elseif ($account_locked_slakeacc1.length -ne 0) {
        $account_locked_slakeacc1
    }
}
elseif ($account_locked_slake.length -ne 0) {
    $account_locked_slake
}
#================================================================================


#================PASSWORD EXPIRED================================================
$password_expired_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties PasswordExpired | Select -ExpandPropert PasswordExpired
if ($password_expired_slake.length -eq 0) {
    $password_expired_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties PasswordExpired | Select -ExpandPropert PasswordExpired
    if ($password_expired_slakeacc1.length -eq 0) {
        Write-Host "No Record Found"
    }
    elseif ($password_expired_slakeacc1.length -ne 0) {
        $password_expired_slakeacc1
    }
}
elseif ($password_expired_slake.length -ne 0) {
    $password_expired_slake
}
#================================================================================


#================PASSWORD LAST SET===============================================
$password_last_set_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties PasswordLastSet | Select -ExpandPropert PasswordLastSet
if (!$password_last_set_slake) {
    $password_last_set_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties PasswordLastSet | Select -ExpandPropert PasswordLastSet
    if (!$password_last_set_slakeacc1) {
        Write-Host "No Record Found"
    }
    elseif ($password_last_set_slakeacc1) {
        ($password_last_set_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }   
}
else {
    ($password_last_set_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
#================================================================================


#================LAST LOGIN DATE=================================================
$last_logon_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LastLogonDate | Select -ExpandPropert LastLogonDate
if (!$last_logon_slake) {
    $last_logon_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LastLogonDate | Select -ExpandPropert LastLogonDate
    if (!$last_logon_slakeacc1) {
        Write-Host "No Record Found"
    }
    elseif ($last_logon_slakeacc1) {
        ($last_logon_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }   
}
else {
    ($last_logon_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
#================================================================================


#================LAST BAD PASSWORD ATTEMPT=======================================
$last_bad_password_slake = Get-ADuser -Filter { EmailAddress -eq $user_email } -Properties LastBadPasswordAttempt | Select -ExpandPropert LastBadPasswordAttempt
if (!$last_bad_password_slake) {
    $last_bad_password_slakeacc1 = Get-ADuser -Server $slakeacc1.HostName[0] -Filter { EmailAddress -eq $user_email } -Properties LastBadPasswordAttempt | Select -ExpandPropert LastBadPasswordAttempt
    if (!$last_bad_password_slakeacc1) {
        Write-Host "No Record Found"
    }
    elseif ($last_bad_password_slakeacc1) {
        ($last_bad_password_slakeacc1).ToString("dd MMMM yyyy, HH:mm:ss")
    }
}
else {
    ($last_bad_password_slake).ToString("dd MMMM yyyy, HH:mm:ss")
}
#================================================================================

#================Log File========================================================
Write-Output "$('[{0:dd MMMM yyyy} {0:HH:mm:ss}]' -f (Get-Date)) $full_name_slake" | Out-file C:\logs\PasswordResetPortal\LoginLogs.txt -append
#================================================================================