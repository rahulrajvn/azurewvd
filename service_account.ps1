Install-Module AzureAD


Import-Module AzureAD



$aadContext = Connect-AzureAD
$svcPrincipal = New-AzureADApplication -AvailableToOtherTenants $true -DisplayName "Windows Virtual Desktop Svc Principal"
$svcPrincipalCreds = New-AzureADApplicationPasswordCredential -ObjectId $svcPrincipal.ObjectId


$svcPrincipalCreds.Value


$aadContext.TenantId.Guid


$svcPrincipal.AppId


Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"
Get-RdsTenant

$creds = New-Object System.Management.Automation.PSCredential($svcPrincipal.AppId, (ConvertTo-SecureString $svcPrincipalCreds.Value -AsPlainText -Force))
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com" -Credential $creds -ServicePrincipal -AadTenantId $aadContext.TenantId.Guid


$myTenantName = "wvd-adf-demo"
New-RdsRoleAssignment -RoleDefinitionName "RDS Owner" -ApplicationId $svcPrincipal.AppId -TenantName $myTenantName






##to get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvdadtenant" -HostPoolName "hostpool1"



##to remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name "Desktop Application Group"


Add-RdsAppGroupUser wvd-adf-demo wvdhp "Desktop Application Group" -UserPrincipalName saikrishnan.s@adfolks.com

