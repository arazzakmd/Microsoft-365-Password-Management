# Get Microsoft Entra Domain Password Policy
$Domain = Read-Host "Enter domain name"
Get-MgDomain -DomainId $Domain | Select-Object Id,PasswordNotificationWindowInDays,PasswordValidityPeriodInDays | Format-List
