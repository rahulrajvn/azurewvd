
##Login to Azure
$brokerurl = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $brokerurl


## Get rds wvd tenent
Get-RdsTenant

## To cretae new wvd tenant 
New-RdsTenant -Name "vdi-test-us" -AadTenantId a86bc255-9bb7-4ee8-b30a-51fba84872aa -AzureSubscriptionId e33f0471-ef78-4f7e-97cf-fe9efebf11e0


## To list the hostpools inside a tenant 
Get-RdsHostPool -TenantName "vdi-test-us"


#Remove RDS Tenant
Remove-RdsTenant -Name "vdi-test-us"

New-RdsHostPool -TenantName "vdi-test-us" -Name vdihp



## List the servers inside a host pool
Get-RdsSessionHost -TenantName "vdi-test-us" -HostPoolName "vdi-hp"

Get-RdsDiagnosticActivities -TenantName "vdi-test-us" -username rahul@adfolks.com



## To get the appgroups attached to a host pool
Get-RdsAppGroup -TenantName "vdi-test-us" -HostPoolName "vdihp"

## To remove host  pool from a tenant
Remove-RdsHostPool -TenantName "vdi-test-us" -Name "vdihp"

## To remove appgrp from hostpool
Remove-RdsAppGroup -TenantName "vdi-test-us" -HostPoolName "vdihp" -AppGroupName "Desktop Application Group"



## List all users who have been assigned to an app group
Get-RdsAppGroupUser -TenantName "vdi-test-us" -HostPoolName "vdihp" -AppGroupName "Desktop Application Group" | Format-Table -AutoSize


Remove-RdsSessionHost -TenantName "vdi-test-us" -HostPoolName "vdihp" -Name vdivm-1.adfolkslocal.com -Force



#### Token creation
New-RdsRegistrationInfo -TenantName "vdi-test-us" -HostPoolName "vdihp" -ExpirationHours 3 | Select-Object -ExpandProperty Token 



3. Log into the session host and update the following registry keys:

Key: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RDInfraAgent

Name: RegistrationToken

Value: Token Goes Here

 

Key: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RDInfraAgent

Name: IsRegistered

Value: 0
Export-RdsRegistrationInfo -TenantName "vdi-test-us" -HostPoolName "vdihp" | Select -Expand Token

eyJhbGciOiJSUzI1NiIsImtpZCI6IjUxM0FERUIwNTJBNjZGODY3OUUxOTY5OTlDQTc2NzhCQUE5NjBBNjMiLCJ0eXA
iOiJKV1QifQ.eyJSZWdpc3RyYXRpb25JZCI6IjQ0YjRmNjdjLTEyMGUtNGNjOS1iY2NkLWY5NGJjYzFiYzEwNCIsIkJ
yb2tlclVyaSI6Imh0dHBzOi8vcmRicm9rZXItZy11cy1yMC53dmQubWljcm9zb2Z0LmNvbS8iLCJEaWFnbm9zdGljc1
VyaSI6Imh0dHBzOi8vcmRkaWFnbm9zdGljcy1nLXVzLXIwLnd2ZC5taWNyb3NvZnQuY29tLyIsIkVuZHBvaW50UG9vb
ElkIjoiYWE2YjI0NDYtNjMyNi00YmI0LWFmZTItMDhkN2M5ZTJkNGViIiwiR2xvYmFsQnJva2VyVXJpIjoiaHR0cHM6
Ly9yZGJyb2tlci53dmQubWljcm9zb2Z0LmNvbS8iLCJHZW9ncmFwaHkiOiJVUyIsIm5iZiI6MTU4NDg4MDA3MSwiZXh
wIjoxNTg0ODkwODcwLCJpc3MiOiJSREluZnJhVG9rZW5NYW5hZ2VyIiwiYXVkIjoiUkRtaSJ9.KusNSbIf5Y7kG8XRQ
htqAjxCEuOns9ow7Dz9yFhnUqIVGQIYpo-aRvE2ArFF2k5orZyPbiDd1-6fvYwHj-k2xBXW-9dNyWh8L8_KESXDbrVM
tb_p66etyDzeDWf_GrVKHdsFno_elmwqDuUBGNs2bNTSvQ97KiACTeHXIrvtO0HvwTtlLMkCvByQ_saGQENxn9Lrhew
joD540QPNSLFba7ATHVzUDo7ao8ClwKPc-rdKI1y-f4qpxDfdmanij261AOXTzoXCc9sE48yvVaWsNMO3_z3bZMVtyW
P9I1RRuh_5ymNUxSu_CqzauvHAV4LzMcRH18zOz5-YAFWfXV8Dow

And when running (Get-RdsDiagnosticActivities -TenantName aluspec -ActivityId f7024329-3717-4713-9f5a-31f97e980000 -Detailed).Errors

