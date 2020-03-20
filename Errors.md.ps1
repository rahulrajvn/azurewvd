





Error: Add-RdsAppGroupUser command -- The specified UserPrincipalName is already assigned to a 
       RemoteApp app group in the specified Host Pool

Add-RdsAppGroupUser -TenantName <TenantName> -HostPoolName <HostPoolName> -AppGroupName 'Desktop Application Group' -UserPrincipalName <UserName>

Cause:  The username used has been already assigned to an app group of a different type. Users cant be 
        assigned to both a remote desktop and remote app group under the same session host pool.

Fix:    If user needs both remote apps and remote desktop, create different host pools or 
        grant user access to the remote desktop, which will permit the use of any application on the session host VM.











