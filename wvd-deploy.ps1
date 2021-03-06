﻿
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
Add-RdsAppGroupUser -TenantName wvd-adf-demo -HostPoolName wvdhp -AppGroupName "Desktop Application Group" -UserPrincipalName arathy.r@adfolks.com


## Now we will be able to login to WVD web URL with web URL or Clients.




#Setting up the Profile Share. 
## Create Azure Storage Account 
## Create Azure Fileshare
## Provide SMB Contributor Access to WVDuser groups
## Enable Azure Active Directory Domain Services Authentication for the Storage account. 
## Mount the Fileshare to a Domain Joined Machines With Storage Keys(Need to mount using storage keys not AD Credentails for managig the NTFS permissions)
       To configure NTFS with superuser permissions, you must mount the share 
       by using your storage account key from your domain-joined VM. 
       Follow the instructions in the next section to mount an 
       Azure file share from the command prompt and to configure NTFS permissions accordingly.

## Provide the Following Permissions at the root directory of the file share
       CREATOR OWNER               Subfolders and Files Only	              Modify
       Administrator	              This Folder, Subfolders and Files	       Full Control
       Users	                     This Folder Only                          Modify
       Users\Group	              This Folder Only	                     Modify

## Enabling Fslogic for Shared Profiles in Azure Files
       https://aka.ms/fslogix_download


       Connect to the virtual machine with the credentials you provided when creating the virtual machine.
       Launch an internet browser and navigate to this link to download the FSLogix agent.
       Navigate to either \\Win32\Release or \\X64\Release in the .zip file and run FSLogixAppsSetup to install the FSLogix agent. To learn more about how to install FSLogix, see Download and install FSLogix.
       Navigate to Program Files > FSLogix > Apps to confirm the agent installed.
       From the start menu, run RegEdit as an administrator. Navigate to Computer\HKEY_LOCAL_MACHINE\software\FSLogix.
       Create a key named Profiles.
       Create the following values for the Profiles key:
              Enabled                                   DWORD                       1 : Enables the Fslogic Profiles
              VHDLocations                              Multi-String Value          \\wvdadfshare.file.core.windows.net\wvdprfshare : Enter the File share path with out quotes
              DeleteLocalProfileWhenVHDShouldApply      DWORD                       1 : delete local profile if exists and matches the profile being loaded from VHD
              VolumeType                                REG_SZ                      vhd
              RebootOnUserLogoff                        DWORD                       0 : means, Take no action
              PreventLoginWithTempProfile               DWORD                       1 : Data values and use If set to 1 Profile Container will load FRXShell if its determined a temp profile has been created. The user will receive the FRXShell prompt - default prompt to call support, and the users only option will be to sign out
              ConcurrentUserSessions                    DWORD                       0 : dont handle concurrent sessions
              FlipFlopProfileDirectoryName              DWORD                       1 : When set to ‘1’ the SID folder is created as “%username%%sid%” instead of the default “%sid%%username%”. This setting has the same effect as setting SIDDirNamePattern = “%username%%sid%” and SIDDirNameMatch = “%username%%sid%”.













