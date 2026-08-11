# Export Microsoft 365 User Password Policy Report
$ReportPath = Join-Path $PSScriptRoot "PasswordPolicyReport.csv"
$Users = Get-MgUser -All -Property UserPrincipalName,PasswordPolicies
$Users | Select-Object UserPrincipalName,@{Name="PasswordNeverExpires";Expression={$_.PasswordPolicies -contains "DisablePasswordExpiration"}} | Export-Csv -Path $ReportPath -NoTypeInformation -Encoding UTF8
Write-Host "Report exported to: $ReportPath"
