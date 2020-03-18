
## Azure AD ID             : a86bc255-9bb7-4ee8-b30a-51fba84872aa
## Azure Subscription ID   : e33f0471-ef78-4f7e-97cf-fe9efebf11e0


## Log into tenant
Add-RdsAccount -DeploymentUrl "https://rdbroker.wvd.microsoft.com"


## To cretae new wvd tenant 
New-RdsTenant -Name wvd-adf-demo -AadTenantId a86bc255-9bb7-4ee8-b30a-51fba84872aa -AzureSubscriptionId e33f0471-ef78-4f7e-97cf-fe9efebf11e0


## Create the Hostpool
### From Azure Portal
### https://docs.microsoft.com/en-us/azure/virtual-desktop/create-host-pools-azure-marketplace


### From Powershell
#### Create hostpool
New-RdsHostPool -TenantName wvd-adf-demo -Name wvdhp

#### Token creation
New-RdsRegistrationInfo -TenantName wvd-adf-demo -HostPoolName wvdhp -ExpirationHours 3 | Select-Object -ExpandProperty Token | Out-File -FilePath C:\wvdtoken.txt

#### Deploy the VM's
#### Add VM's to domain
#### Install WVD Agent APP and Bootloader APP with the generated token
https://docs.microsoft.com/en-us/azure/virtual-desktop/create-host-pools-powershell#register-the-virtual-machines-to-the-windows-virtual-desktop-host-pool




## List the hostpools inside a tenant 
Get-RdsHostPool -TenantName "wvd-adf-demo"


## List the servers inside a hostpool
Get-RdsSessionHost -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"


## List the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "wvd-adf-demo" -HostPoolName "wvdhp"






## Add Users to Default Remote Desktop Group.
Add-RdsAppGroupUser -TenantName wvd-adf-demo -HostPoolName wvdhp -AppGroupName "Desktop Application Group" -UserPrincipalName roletest@adfolks.com























