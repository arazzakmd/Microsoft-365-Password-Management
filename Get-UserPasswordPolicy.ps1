# Get Microsoft 365 User Password Policy
$Users = Get-MgUser -All -Property UserPrincipalName,PasswordPolicies
$Users | Select-Object UserPrincipalName,@{Name="PasswordNeverExpires";Expression={$_.PasswordPolicies -contains "DisablePasswordExpiration"}} | Format-Table -AutoSize
