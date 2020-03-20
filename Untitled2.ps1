

Install-Module AzureAD


Get-AzureADGroupMember -ObjectId "62438306-7c37-4638-a72d-0ee8d9217680"





##Login to Azure
$brokerurl = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $brokerurl


## Get rds wvd tenent
Get-RdsTenant
 
## To list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "wvd-adf-demo"


## List the servers inside a host pool
Get-RdsSessionHost -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp"


## To get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp"



## List all users who have been assigned to an app group
Get-RdsAppGroupUser -TenantName "wvd-adf-demo" -HostPoolName "wvdhp" -AppGroupName "Desktop Application Group"


## List all users who have been assigned to an app group
Get-RdsAppGroupUser -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName "adfapp"



