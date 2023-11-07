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
mkdir /tmp/codeinst
cd /tmp/codeinst
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
mv * a.deb
sudo apt install -y ./*

# conda
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

# startup.sh
echo "qdbus org.kde.KWin /Compositor suspend" > ~/startup.sh # overrated feature
chmod +x ~/startup.sh
echo "[Desktop Entry]\nExec=~/startup.sh\nIcon=dialog-scripts\nName=startup.sh\nPath=\nType=Application\nX-KDE-AutostartScript=true" > ~/.config/autostart/startup.sh.desktop
