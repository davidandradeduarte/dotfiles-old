# TODO: windows default settings
# show hidden files
# rename pc
# ...
Rename-Computer -NewName "hawk" # will change after restart

function ShowFileExtensions()
{
    # http://superuser.com/questions/666891/script-to-set-hide-file-extensions
    Push-Location
    Set-Location HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    Set-ItemProperty . HideFileExt "0"
    Pop-Location
    Stop-Process -processName: Explorer -force # This will restart the Explorer service to make this work.
}
 
ShowFileExtensions

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-FromChocolatey {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )

    choco install $PackageName --yes
}

Install-Chocolatey

# TODO: make this an array of string and make Install-FromChocolatey receive it

choco install -y 'git'
choco install -y dotnetcore-sdk
choco install -y dotnet-sdk
choco install -y golang
choco install vagrant
#Install-FromChocolatey 'neovim'
#Install-FromChocolatey 'bat'
choco install wget
Install-FromChocolatey 'grep'
#Install-FromChocolatey 'ntop.portable'
#Install-FromChocolatey 'tldr'
#Install-FromChocolatey 'jq'
#Install-FromChocolatey 'fzf'


# casks/apps
choco install neovim
choco install vim
choco install nano
choco install ntop.portable
choco install sed
choco install lazygit
# choco install gotop # to slow
choco install which
choco install -y 'microsoft-windows-terminal'
choco install -y 'vscode'
choco install -y 'brave'
choco install -y 'bitwarden'
# choco install -y 'virtualbox' # not working alonside hyper v :( and wsl 2
choco install -y 'powertoys'
choco install -y 'winaero-tweaker'
choco install -y 'discord'
choco install -y 'steam-client'
choco install -y 'firefox'
choco install -y 'googlechrome'
choco install -y 'powershell-core'
choco install -y 'linqpad'
choco install -y tor-browser
choco install -y zoom
choco install -y slack
choco install -y microsoft-teams
choco install -y docker-desktop
choco install -y obs-studio
choco install lens
choco install openconnect-gui
cinst -y autohotkey
choco install jetbrainstoolbox
choco install intellijidea-ultimate
choco install jetbrains-rider
choco install hyper
choco install thunderbird
choco install gsudo
choco install warp
choco install protonvpn
choco install whatsapp
choco install notion
choco install gimp
choco install git-fork
choco install vlc
choco install treesizefree
choco install openjdk
choco install angryip
choco install libreoffice-fresh
choco install everything
choco install wireshark
choco install transmission
choco install ngrok.portable
choco install goland
choco install azure-data-studio
choco install 7zip
choco install insomnia-rest-api-client
choco install visualstudio2019community
choco install sql-server-management-studio
choco install vnc-viewer

# caffeine
# https://zhornsoftware.co.uk/caffeine/#download

# taskbar stats
# https://github.com/openhoangnc/taskbar-stats/releases/tag/v21.3.7.1

#Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/aaronpowell/system-init/master/common/.gitconfig' -OutFile (Join-Path $env:USERPROFILE '.gitconfig')

# WSL
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux # needs reboot
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
# install in different directory
mkdir 'D:\WSL'
cd 'D:\WSL'
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
move .\Ubuntu.appx Ubuntu.zip
Expand-Archive .\Ubuntu.zip
cd .\Ubuntu\
.\ubuntu2004.exe
