
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


## Create an App Group for Remote Apps to be pubished.. Type will be RemoteApp
New-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -Name adfapp -ResourceType "RemoteApp"


##  Get a list of Start menu apps on the host pool's virtual machine image
Get-RdsStartMenuApp -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName adfapp 


## Add the App with its AppAlias mentioned in above command
New-RdsRemoteApp -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName "adfapp" -Name Adfpaint -AppAlias paint



## Add the App with its File pathAlias mentioned in above command
New-RdsRemoteApp -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName adfapp `
                 -Name Adfwordpad `
                 -Filepath "C:\Program Files\Windows NT\Accessories\wordpad.exe"  `
                 -IconPath "C:\Program Files\Windows NT\Accessories\wordpad.exe" `
                 -IconIndex 0


## List the Apps published over the App Group
Get-RdsRemoteApp -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName adfapp


## Add users to Application Group
Add-RdsAppGroupUser -TenantName "wvd-adf-demo" -HostPoolName "wvdhpapp" -AppGroupName adfapp -UserPrincipalName roletest@adfolks.com


