




cd HKLM:\
Get-childitem	
set-location -path 'HKLM:\SOFTWARE\FSLogix\Profiles'
Get-childitem

New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "CCDLocations" -Value ”DefaultEndpointsProtocol=https;AccountName=adfwvd;AccountKey=jkbA2bTONSMu2FR6oGxsmuCpbtFM6oxfVi/yT7XJe+kwmJf+fgK98gnSL9ejKP2POnVPthMHSa9wYIQcTZg8Ew==;EndpointSuffix=core.windows.net”  -PropertyType "MultiString"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "Enabled" -Value ”1”  -PropertyType "DWord"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "DeleteLocalProfileWhenVHDShouldApply" -Value ”1”  -PropertyType "DWord"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "FlipFlopProfileDirectoryName" -Value ”1”  -PropertyType "DWord"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithFailure" -Value ”1”  -PropertyType "DWord"
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithTempProfile" -Value ”1”  -PropertyType "DWord"


CCDLocations

Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'Enabled' -Value '0'

\\adfwvd.file.core.windows.net\adfsharewvd


Get-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles'
Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'Enabled' -Value '0'
Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'DeleteLocalProfileWhenVHDShouldApply' -Value '0'
Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'FlipFlopProfileDirectoryName' -Value '0'
Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithFailure' -Value '0'
Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithTempProfile' -Value '0'

