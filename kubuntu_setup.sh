sudo apt update && sudo apt -y upgrade

## azure vms
# sudo apt-get install -y --no-install-recommends kubuntu-desktop
# sudo apt-get install -y xrdp
# sudo systemctl status xrdp # should be running
# sudo adduser xrdp ssl-cert
# sudo systemctl restart xrdp

# zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# vs code
sudo apt-get install wget gpg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code # or code-insiders

# conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# startup.sh
mkdir -p ~/.config/autostart/
echo "qdbus org.kde.KWin /Compositor suspend" > ~/startup.sh # overrated feature
qdbus org.kde.KWin /Compositor suspend
chmod +x ~/startup.sh
printf "[Desktop Entry]\nExec=~/startup.sh\nIcon=dialog-scripts\nName=startup.sh\nPath=\nType=Application\nX-KDE-AutostartScript=true" > ~/.config/autostart/startup.sh.desktop
