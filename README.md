MICROSOFT 365 PASSWORD MANAGEMENT
===================================

This section contains Microsoft Graph PowerShell scripts for checking,
reporting, and managing Microsoft 365 / Microsoft Entra ID password
expiration settings.

===========================================================
REPOSITORY STRUCTURE
===========================================================

06-Password-Management/
|
|-- README.md
|
|-- 01-Users/
|   |-- Get-UserPasswordPolicy.ps1
|   |-- Export-UserPasswordPolicyReport.ps1
|   |-- Set-UserPasswordNeverExpire.ps1
|   |-- Set-UserPasswordExpire.ps1
|
|-- 02-Domain/
    |-- Get-DomainPasswordPolicy.ps1


===========================================================
STEP 1 - PREREQUISITES
===========================================================

Before running the scripts, make sure:

- PowerShell 5.1 or PowerShell 7+ is installed.
- Microsoft Graph PowerShell SDK is installed.
- You have the required Microsoft Graph permissions.
- You have appropriate Microsoft 365 / Microsoft Entra ID access.

===========================================================
STEP 2 - INSTALL MICROSOFT GRAPH
===========================================================

Run PowerShell as your normal user and execute:

Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

Verify the installation:

Get-InstalledModule Microsoft.Graph


===========================================================
STEP 3 - CONNECT TO MICROSOFT GRAPH
===========================================================

Connect to Microsoft Graph:

Connect-MgGraph -Scopes "User.Read.All","Domain.Read.All","User.ReadWrite.All"

A Microsoft sign-in window may appear.

After authentication, verify the connection:

Get-MgContext

NOTE:
Use only the permissions required for the specific script.
Do not request unnecessary permissions.


===========================================================
STEP 4 - GET USER PASSWORD POLICY
===========================================================

Script:

01-Users/Get-UserPasswordPolicy.ps1

Purpose:
Checks whether password expiration is disabled for users.

Run:

.\Get-UserPasswordPolicy.ps1

The output includes:

- UserPrincipalName
- PasswordNeverExpires

A value of True means the user's password expiration is disabled.


===========================================================
STEP 5 - EXPORT USER PASSWORD POLICY REPORT
===========================================================

Script:

01-Users/Export-UserPasswordPolicyReport.ps1

Purpose:
Exports the password expiration status of all users to a CSV file.

Run:

.\Export-UserPasswordPolicyReport.ps1

The report will be created in the same folder as the script:

PasswordPolicyReport.csv

IMPORTANT:
The CSV report may contain user information. Do not upload
the generated CSV file to a public GitHub repository.


===========================================================
STEP 6 - SET USER PASSWORD TO NEVER EXPIRE
===========================================================

Script:

01-Users/Set-UserPasswordNeverExpire.ps1

Purpose:
Disables password expiration for one specific user.

Run:

.\Set-UserPasswordNeverExpire.ps1

The script will ask:

Enter User Principal Name

Example:

user@contoso.com

IMPORTANT:
This is a configuration change. Review your organization's
security policy before disabling password expiration.

Do not use this setting unless there is a valid business or
technical requirement.


===========================================================
STEP 7 - ENABLE USER PASSWORD EXPIRATION
===========================================================

Script:

01-Users/Set-UserPasswordExpire.ps1

Purpose:
Removes the DisablePasswordExpiration setting from one user.

Run:

.\Set-UserPasswordExpire.ps1

Enter the user's UPN when prompted.

Example:

user@contoso.com


===========================================================
STEP 8 - CHECK DOMAIN PASSWORD POLICY
===========================================================

Script:

02-Domain/Get-DomainPasswordPolicy.ps1

Purpose:
Displays the password notification window and password validity
period configured for a domain.

Run:

.\Get-DomainPasswordPolicy.ps1

Enter your domain name when prompted.

Example:

contoso.com


===========================================================
REQUIRED PERMISSIONS
===========================================================

The permissions required can vary depending on the cmdlet and
operation.

Common permissions used by these scripts include:

User.Read.All
    Read user information.

User.ReadWrite.All
    Required for user configuration changes in scenarios where
    the cmdlet requires write access.

Domain.Read.All
    Read domain information.

IMPORTANT:
Always verify the exact required permission for the Microsoft Graph
cmdlet before granting permissions in production.


===========================================================
SECURITY BEST PRACTICES
===========================================================

DO NOT upload any of the following to GitHub:

- Passwords
- Access Tokens
- Refresh Tokens
- Client Secrets
- Private Keys
- Certificates containing private keys
- Customer user lists
- Customer CSV reports
- Customer confidential information

Never hard-code a password in a PowerShell script.

BAD EXAMPLE:

$password = "Password123!"

Do not use this approach.


===========================================================
RECOMMENDED TESTING PROCESS
===========================================================

Before using any configuration-change script in production:

1. Test with a test user.
2. Confirm the current password policy.
3. Apply the change.
4. Verify the result.
5. Confirm there is no unexpected impact.
6. Document the change.
7. Only then consider production use.


===========================================================
TROUBLESHOOTING
===========================================================

If Connect-MgGraph is not recognized:

Install or import Microsoft Graph:

Install-Module Microsoft.Graph -Scope CurrentUser -Force

Then try:

Import-Module Microsoft.Graph

Connect again:

Connect-MgGraph


If you need to identify the required permissions for a cmdlet:

Find-MgGraphCommand -Command "Get-MgUser"

You can replace the command name with the Graph cmdlet
you are investigating.


===========================================================
DISCLAIMER
===========================================================

These scripts are provided for Microsoft 365 administration,
automation, learning, and troubleshooting purposes.

Always review permissions and test administrative changes in a
controlled environment before using them in production.

Microsoft Graph documentation:

https://learn.microsoft.com/powershell/microsoftgraph/

END OF README
