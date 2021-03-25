


https://rdweb.wvd.microsoft.com/arm/webclient/index.html

cd HKLM:\
Get-childitem	
set-location -path 'HKLM:\SOFTWARE\FSLogix\Profiles'
Get-childitem

# Enable FSlogix -Forcefully
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "VHDLocations" -Value "\\wvdadf.file.core.windows.net\wvdadfshare" -PropertyType "MultiString" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "Enabled" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "DeleteLocalProfileWhenVHDShouldApply" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "FlipFlopProfileDirectoryName" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithFailure" -Value "1"  -PropertyType "DWord" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\FSLogix\Profiles" -Name "PreventLoginWithTempProfile" -Value "1"  -PropertyType "DWord" -Force




#Disable Fslogic 
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'Enabled' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'DeleteLocalProfileWhenVHDShouldApply' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'FlipFlopProfileDirectoryName' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithFailure' -Value '0'
Set-ItemProperty -Path 'HKLM:\SOFTWARE\FSLogix\Profiles' -Name 'PreventLoginWithTempProfile' -Value '0'


#Fslogix Log Path
%ProgramData%\FSLogix\Logs
 

#On Command line not Powershell
icacls y: /grant rahul@adfolks.com:(M) 
icacls y: /grant "Creator Owner":(OI)(CI)(IO)(M) 
icacls y: /remove "Authenticated Users" 
icacls y: /remove "Builtin\Users"

