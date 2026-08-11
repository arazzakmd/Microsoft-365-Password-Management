# Set User Password to Never Expire
# Review your organization's security policy before using this change.
$UserPrincipalName = Read-Host "Enter User Principal Name"
Update-MgUser -UserId $UserPrincipalName -PasswordPolicies "DisablePasswordExpiration"
Write-Host "Password expiration disabled for: $UserPrincipalName"
