
##Login to Azure
$brokerurl = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $brokerurl


##get rds wvd tenent
Get-RdsTenant
 
##to remove rds wvd tenant
Remove-RdsTenant -Name "adfolks-wvdtest-tenant"

## to list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "wvd-adf-demo"

##list the servers inside a host pool
Get-RdsSessionHost -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"

##to get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"


##to remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvdadtenant" -HostPoolName "hostpool2app" -Name "remoteapps"

##to remove server from a host pool
Remove-RdsSessionhost -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name "hostpool1-1.adfolks.com"


##to remove host  pool from a tenant
Remove-RdsHostPool -TenantName "wvdadtenant" -Name "hostpool1"

##admin access to the second person
New-RdsRoleAssignment -TenantName wvdadtenantt -SignInName rahul@adfolks.com -RoleDefinitionName "RDS Owner"

#List the RDS Session
Get-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1"

#disconnect the user session
Disconnect-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1" -SessionHostName "hostpool1-1.adfolks.com" -SessionId 3

#initiate user sign off
Invoke-RdsUserSessionLogoff -TenantName "wvdadtenant" -HostPoolName "hostpool1" -SessionHostName "hostpool1-1.adfolks.com" -SessionId 3

#Remove the use session based on username
Get-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1" | where { $_.UserPrincipalName -eq "rahul@adfolks.com" } | Invoke-RdsUserSessionLogoff -NoUserPrompt


##to get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"

##to remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name "Desktop Application Group"





#Remove RDS Tenant
Remove-RdsTenant -Name "wvdadtenant"


Add-RdsAppGroupUser wvd-adf-demo wvdhp "Desktop Application Group" -UserPrincipalName arathy.r@adfolks.com



https://docs.microsoft.com/en-us/azure/storage/files/storage-files-identity-auth-active-directory-domain-service-enable
















