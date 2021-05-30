############################### Installing Spice Agent ####################################################

D:\spice-guest-tool-latest.exe

Start-Sleep -s 120

############################### Optimizing ################################################################

Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects' -Name VisualFXSetting -Value 3

############################### Sleep #####################################################################

Powercfg /Change monitor-timeout-ac 0
Powercfg /Change monitor-timeout-dc 0
Powercfg /Change standby-timeout-ac 0
Powercfg /Change standby-timeout-dc 0

############################## Disable Windows Update ######################################################

sc.exe config wuauserv start=disabled

############################## Firewall Disable ############################################################

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

############################### Enable Remote Desktop connections ##########################################

Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\‘ -Name “fDenyTSConnections” -Value 0

############################### Enable Network Level Authentication #########################################

Set-ItemProperty ‘HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\‘ -Name “UserAuthentication” -Value 1

############################### Enable Windows firewall rules to allow incoming RDP ##########################

Enable-NetFirewallRule -DisplayGroup “Remote Desktop”

############################### Create PollsstatusIteration ##################################################

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters' -Name  'PollstatusIterations' -Value '1' -PropertyType 'DWORD' -Force

################################## Enable Admin User #########################################################

Get-LocalUser -Name "Administrator" | Enable-LocalUser

net user Administrator Server1011q2w #######Give username and password

NET USER vadmin "Server1011q2w" /ADD

WMIC USERACCOUNT WHERE "Name='vadmin'" SET PasswordExpires=FALSE

Add-LocalGroupMember -Group "Administrators" -Member "vadmin"

New-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Terminal Services' -Name 'fSingleSessionPerUser' -Value '1' -PropertyType 'DWORD' -Force

Install-Package D:\CloudbaseInitSetupx64.msi

shutdown /s
