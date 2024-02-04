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

# key bindings
mkdir -p ~/Repos
cd ~/Repos
git clone https://github.com/ffelixg/dotfiles.git
ln ~/Repos/dotfiles/.Xmodmap ~/.Xmodmap
xmodmap ~/.Xmodmap

# browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser 

# virtualbox
sudo apt install gcc make perl

# Docker from https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# Set up apt repo
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
# install
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
