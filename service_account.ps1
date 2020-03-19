
## Install Azure AD Module
Install-Module AzureAD

## Import Azure AD Module
Import-Module AzureAD

## Login with Admin Account 
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"
Get-RdsTenant

## Setting up the Account 
$aadContext = Connect-AzureAD
$svcPrincipal = New-AzureADApplication -AvailableToOtherTenants $true -DisplayName "Windows Virtual Desktop Svc Principal"
$svcPrincipalCreds = New-AzureADApplicationPasswordCredential -ObjectId $svcPrincipal.ObjectId

## Giving Service Principle Access to tenant
$myTenantName = "wvd-adf-demo"
New-RdsRoleAssignment -RoleDefinitionName "RDS Owner" -ApplicationId $svcPrincipal.AppId -TenantName $myTenantName



$svcPrincipalCreds.Value

$aadContext.TenantId.Guid

$svcPrincipal.AppId

## Loing With Service Account
$creds = New-Object System.Management.Automation.PSCredential($svcPrincipal.AppId, (ConvertTo-SecureString $svcPrincipalCreds.Value -AsPlainText -Force))
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com" -Credential $creds -ServicePrincipal -AadTenantId $aadContext.TenantId.Guid

## WVD Admin Tool
https://blog.itprocloud.de/Windows-Virtual-Desktop-Admin/
If the above secret not working, Generate a new password from the portal
Azure AD >> Applications >> "Application name" >> Generate Secret


