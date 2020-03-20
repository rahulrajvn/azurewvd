
##Login to Azure
$brokerurl = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $brokerurl


## Get rds wvd tenent
Get-RdsTenant

## To list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "wvd-adf-demo"

## List the servers inside a host pool
Get-RdsSessionHost -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"

## To get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"



## To remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvdadtenant" -HostPoolName "hostpool2app" -Name "remoteapps"

## To remove server from a host pool
Remove-RdsSessionhost -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name "hostpool1-1.adfolks.com"

## To remove host  pool from a tenant
Remove-RdsHostPool -TenantName "wvdadtenant" -Name "hostpool1"

## To remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhp" -Name "adfapp"

#Remove RDS Tenant
Remove-RdsTenant -Name "wvdadtenant"




## Admin access to the second person
New-RdsRoleAssignment -TenantName wvdadtenantt -SignInName rahul@adfolks.com -RoleDefinitionName "RDS Owner"

## Add user to App Group
Add-RdsAppGroupUser wvd-adf-demo wvdhp "Desktop Application Group" -UserPrincipalName arathy.r@adfolks.com















