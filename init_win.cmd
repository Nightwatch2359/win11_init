@echo off
echo RDP Zugriff zulassen
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
echo chocolatey installieren
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo Bestätigungen für Chocolatey Aktionen abschalten
choco feature enable -n allowGlobalConfirmation

echo Beispielhafte Programme installieren
choco install vmware-tools gsudo firefox powertoys vscode w10privacy

::echo WSL feature installieren
::wsl.exe --install -n

echo Neustart
shutdown /r /t 15 /d p:4:2