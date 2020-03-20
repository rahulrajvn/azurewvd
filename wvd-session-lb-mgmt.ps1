

##Login to Azure
$brokerurl = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $brokerurl


## Session Management 

## Disable and Enable new session to a session host
Set-RdsSessionHost -TenantName "wvd-adf-demo" -HostPoolName "wvdhp" -Name "wvdhp-1.adfolks.com" -AllowNewSession $false


## List the RDS Session
Get-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1"

## Disconnect the user session
Disconnect-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1" -SessionHostName "hostpool1-1.adfolks.com" -SessionId 3

## Initiate user sign off
Invoke-RdsUserSessionLogoff -TenantName "wvdadtenant" -HostPoolName "hostpool1" -SessionHostName "hostpool1-1.adfolks.com" -SessionId 3

## Remove the use session based on username
Get-RdsUserSession -TenantName "wvdadtenant" -HostPoolName "hostpool1" | where { $_.UserPrincipalName -eq "rahul@adfolks.com" } | Invoke-RdsUserSessionLogoff -NoUserPrompt




## WVD Loadbalancer Configuration for Hostpool


## Change the loadbalancer to breadth type
Set-RdsHostPool -TenantName "wvdadtenant" -HostPoolName "hostpool1" -BreadthFirstLoadBalancer -MaxSessionLimit ###

## Change the loadbalancer to deapth type
Set-RdsHostPool -TenantName "wvdadtenant" -HostPoolName "hostpool1" -DepthFirstLoadBalancer -MaxSessionLimit ###




Add-RdsAppGroupUser <tenantname> <hostpoolname> "Desktop Application Group" -UserPrincipalName <userupn>

## Configure direct assignment for personal uses

## Update the hostpool for direct access for personal use. 
Set-RdsHostPool -TenantName "wvdadtenant" -HostPoolName "hostpool1" -AssignmentType Direct

## Add the users to Personal Application Group
Add-RdsAppGroupUser -TenantName "wvdadtenant" -HostPoolName "hostpool1" "Desktop Application Group" -UserPrincipalName <userupn>

## Assign the user to the session host.
Set-RdsSessionHost -TenantName "wvdadtenant" -HostPoolName "hostpool1" -Name <sessionhostname> -AssignedUser <userupn>





