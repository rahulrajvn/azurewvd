##Azure AD ID   a86bc255-9bb7-4ee8-b30a-51fba84872aa
##Azure Subscription ID   e33f0471-ef78-4f7e-97cf-fe9efebf11e0
##

##import module 
Import-Module -Name Microsoft.RDInfra.RDPowerShell

##log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"


Connect-AzureAD -Confirm


Add-RdsAccount -Verbose -s


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
Remove-RdsAppGroup -TenantName "adfolks-wvdtest-tenant" -HostPoolName "wvd-HostPool" -Name "Desktop Application Group"

##to remove server from a host pool
Remove-RdsSessionhost -TenantName "adfolks-wvdtest-tenant" -HostPoolName "contosoHostPool" -Name "sh1.contoso.com"


##to remove host  pool from a tenant
Remove-RdsHostPool -TenantName "adfolks-wvdtest-tenant" -Name "wvd-HostPool"


 
