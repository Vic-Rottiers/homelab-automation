#---------------- Software ----------------#
# software opzoeken in chocolatey packages: https://community.chocolatey.org/packages
#   Voeg nieuwe software hier in lijst toe en de package naam bij #installation
#
# Lijst van te installeren software:
#   - Steam
#   - Epic games launcher
#   - Ubisoft connect
#   - EA (app)
#   - Teamspeak
#   - Discord
#   - Chrome
#   - eartrumpet
#   - filezilla
#   - java jdk 8
#   - virtualbox
#   - microsoft todo - geen winget
#   - windows terminal
#   - spotify
#   - balenaetcher
#   - parsec
#   - vscode
#   - powertoys
#   - putty
#   - python
#   - sharex
#   - ultimaker cura
#   - wireshark
#   - libreoffice fresh

#---------------- Installation ----------------#

# hieronder de package name bijvoegen
$software = 
"steam-client",
"EpicGamesLauncher",
"ubisoft-connect",
"Teamspeak",
"Discord",
"Chrome",
"eartrumpet",
"filezilla",
"virtualbox",
"microsoft-windows-terminal",
"spotify",
"etcher",
"parsec",
"vscode",
"powertoys",
"putty",
"python",
"sharex",
"wireshark",
"libreoffice-fresh",
"cura-new"

choco install --yes --use-system-powershell $software


