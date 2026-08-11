# Enable User Password Expiration
$UserPrincipalName = Read-Host "Enter User Principal Name"
Update-MgUser -UserId $UserPrincipalName -PasswordPolicies "None"
Write-Host "Password expiration enabled for: $UserPrincipalName"
