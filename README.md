# Microsoft 365 Password Management

PowerShell automation scripts for managing and monitoring Microsoft 365 and Microsoft Entra ID password policies using Microsoft Graph.

## Overview

This repository provides practical PowerShell scripts for common Microsoft 365 password management tasks, including:

- Checking user password expiration settings
- Generating password policy reports
- Disabling password expiration for a user
- Enabling password expiration for a user
- Reviewing domain password policy settings

## Requirements

- PowerShell 5.1 or PowerShell 7+
- Microsoft Graph PowerShell SDK
- Appropriate Microsoft Graph permissions
- Microsoft 365 / Microsoft Entra ID administrative access

## Microsoft Graph Installation

Install the Microsoft Graph PowerShell SDK:

```powershell
Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force
```

Verify the installation:

```powershell
Get-InstalledModule Microsoft.Graph
```

## Authentication

Connect to Microsoft Graph:

```powershell
Connect-MgGraph -Scopes "User.Read.All","Domain.Read.All","User.ReadWrite.All"
```

Verify the connection:

```powershell
Get-MgContext
```

## Scripts

### User Password Policy

**Get-UserPasswordPolicy.ps1**

Checks whether password expiration is disabled for users.

```powershell
.\Get-UserPasswordPolicy.ps1
```

### Password Policy Report

**Export-UserPasswordPolicyReport.ps1**

Exports user password expiration status to a CSV report.

```powershell
.\Export-UserPasswordPolicyReport.ps1
```

> The generated CSV may contain user information. Do not upload customer or production reports to a public repository.

### Disable Password Expiration

**Set-UserPasswordNeverExpire.ps1**

Disables password expiration for a specific user.

```powershell
.\Set-UserPasswordNeverExpire.ps1
```

The script will ask for the user's UPN.

Example:

```text
user@contoso.com
```

### Enable Password Expiration

**Set-UserPasswordExpire.ps1**

Enables password expiration for a specific user.

```powershell
.\Set-UserPasswordExpire.ps1
```

### Domain Password Policy

**Get-DomainPasswordPolicy.ps1**

Displays the password notification window and password validity period configured for a domain.

```powershell
.\Get-DomainPasswordPolicy.ps1
```

## Required Permissions

The required permissions depend on the operation being performed.

| Permission | Purpose |
|---|---|
| User.Read.All | Read user information |
| User.ReadWrite.All | Update user properties |
| Domain.Read.All | Read domain information |

Always verify the permissions required by the specific Microsoft Graph cmdlet before using the scripts in production.

## Recommended Usage

Before applying password policy changes:

1. Test the script with a test account.
2. Review the current configuration.
3. Apply the required change.
4. Verify the result.
5. Document the change.
6. Apply the change to production only after successful testing.

## Security

Never store sensitive information in this repository.

Do not upload:

- Passwords
- Access tokens
- Refresh tokens
- Client secrets
- Private keys
- Customer data
- Production CSV reports

Never hard-code passwords inside PowerShell scripts.

## Disclaimer

These scripts are intended for Microsoft 365 administration, automation, learning, and troubleshooting purposes.

Always test administrative changes in a controlled environment before using them in production.

## Microsoft Documentation

[Microsoft Graph PowerShell](https://learn.microsoft.com/powershell/microsoftgraph/)

[Microsoft Graph API](https://learn.microsoft.com/graph/)
