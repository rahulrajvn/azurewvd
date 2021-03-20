




cd HKLM:\
Get-childitem	
set-location -path 'HKLM:\SOFTWARE\FSLogix\Profiles'
Get-childitem
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "VolumeType" -Value "vhdx" -PropertyType "MultiString" -Froce
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "Enabled" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "DeleteLocalProfileWhenVHDShouldApply" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "FlipFlopProfileDirectoryName" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithFailure" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithTempProfile" -Value "1"  -PropertyType "DWord" -Force


CCDLocations

Set-ItemProperty -Path 'HKLM\SOFTWARE\FSLogix\Profiles' -Name 'Enabled' -Value '0'

\\adfwvd.file.core.windows.net\adfsharewvd


set-location -path 'HKLM:\SOFTWARE\FSLogix\Profiles'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'Enabled' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'DeleteLocalProfileWhenVHDShouldApply' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'FlipFlopProfileDirectoryName' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithFailure' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithTempProfile' -Value '0'

