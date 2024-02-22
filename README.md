# dotfiles
## Introduction
This repository contains a collection of dotfiles and setup commands to configure a Ubuntu Linux system.
## Getting Started
Please follow the steps carefully.
# Maintenance
<details>

## System Update and Cache Cleaning
```
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt autoclean
sudo apt clean
pip cache purge
conda clean -a
sudo journalctl --vacuum-time=1d
```
## Clean History
```
history -c && history -w
```
</details>

# Shortcuts
<details>

### Ctrl+E
```
sensible-browser
```
### Ctrl+M
```
/home/pc/miniconda3/envs/MaTools/bin/python -O /home/pc/MaTools/management_tools/main_management_tools_app.pyw
```
### Ctrl+U
```
/home/pc/miniconda3/envs/uvr/bin/python -O /home/pc/ultimatevocalremovergui/UVR.py
```
### Super+E
```
nautilus
```
### Super+T
```
...
```
### Super+S
```
gnome-screenshot --delay=1
```
### Super+Shift+S
```
Take a screenshot interactively
```
</details>

# Developpement
<details>

## Installing CUDA
<details>

### Disable/Blacklist the Nouveau Driver
```
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo reboot
```
### Installing CUDA Toolkit and Nvidia Driver
```
sudo apt install gcc
sudo apt install linux-headers-$(uname -r)
sudo apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
sudo apt install cuda-toolkit
sudo apt install nvidia-gds
echo 'export PATH="/usr/local/cuda-12.3/bin:$PATH"' | tee -a /home/pc/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda-12.3/lib64:$LD_LIBRARY_PATH"' | tee -a /home/pc/.bashrc
sudo apt install libcublas11
sudo apt install nvidia-driver-545
rm cuda-keyring_1.1-1_all.deb
sudo reboot
```
</details>

## Installing  and Configuring Git
```
sudo apt install git
```
```
git config --global user.email email
git config --global user.name name
```
## Initializing Git
```
git init -b main
```
## Installing CMake
```
wget https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-x86_64.sh
sudo mkdir /opt/cmake
sudo sh cmake-3.28.3-linux-x86_64.sh --skip-license --exclude-subdir --prefix=/opt/cmake
sudo ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
rm cmake-3.28.3-linux-x86_64.sh
```
## Installing Miniconda
```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
cd miniconda3/bin
./conda init
```
## Installing Curl
```
sudo apt install curl
```
## Installing FFMPEG
```
sudo add-apt-repository ppa:ubuntuhandbook1/ffmpeg6
sudo apt-get install ffmpeg
```
## Installing Go
```
sudo apt install golang-go
```
## Installing Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
## Installing Tesseract OCR
```
sudo add-apt-repository ppa:alex-p/tesseract-ocr5
sudo apt install tesseract-ocr
```
## Installing Vim
```
sudo apt install vim
```
## Installing Visual Studio Code
```
wget https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.86.2-1707854558_amd64.deb
sudo apt install ~/code_1.86.2-1707854558_amd64.deb
rm code_1.86.2-1707854558_amd64.deb
```
</details>

# Browser
<details>

## Installing Microsoft Edge
```
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_121.0.2277.128-1_amd64.deb
sudo apt install ~/microsoft-edge-stable_121.0.2277.128-1_amd64.deb
rm microsoft-edge-stable_121.0.2277.128-1_amd64.deb
```
## Installing Yandex Browser
```
wget https://ext-cachev2-cogent03.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/24_1_1_940_54214/Yandex.deb
sudo apt install ~/Yandex.deb
rm Yandex.deb
```
</details>

# Bootloader
<details>

## Configuring GRUB
```
sudo vim /etc/default/grub
sudo update-grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
```
</details>

# Cleanup
<details>

## Disabling Shutdown Confirmation
```
gsettings set org.gnome.SessionManager logout-prompt false
```
## Purge Apport
```
sudo apt purge apport
```
## Purge Snap
```
snap list
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gnome-42-2204
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core22
sudo snap remove --purge firefox
sudo snap remove --purge core20
sudo snap remove --purge snapd
sudo apt purge snapd
sudo vim /etc/apt/preferences.d/nosnap.pref
rm -r snap
```
## Remove Ubuntu Logo
```
sudo rm /usr/share/plymouth/ubuntu-logo.png
```
</details>

# Tools
<details>

## Installing and Using 7-Zip
```
wget https://www.7-zip.org/a/7z2301-linux-x64.tar.xz
mkdir 7-zip
tar xf 7z2301-linux-x64.tar.xz -C 7-zip
echo 'export PATH="/home/pc/7-zip:$PATH"' | tee -a /home/pc/.bashrc
rm 7z2301-linux-x64.tar.xz
```
```
7zz a -tzip -m0=Copy -ppassword -mem=AES256 path.zip path
7zz x path.zip
```
## Installing Conky
```
sudo apt install conky
```
## Installing Czkawka
```
sudo add-apt-repository ppa:xtradeb/apps
sudo apt update
sudo apt-get install czkawka
```
## Installing ECT
```
git clone --recursive https://github.com/fhanau/Efficient-Compression-Tool.git
cd Efficient-Compression-Tool
mkdir build
cd build
cmake ../src
make
echo 'export PATH="/home/pc/Efficient-Compression-Tool/build:$PATH"' | tee -a /home/pc/.bashrc
```
## Installing Gnome Screenshot
```
sudo apt install gnome-screenshot
```
## Installing GParted
```
sudo apt install gparted
```
## Installing Inkscape
```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt install inkscape
```
## Installing Neofetch
```
sudo apt install neofetch
echo 'neofetch' | tee -a /home/pc/.bashrc
```
## Installing OBS Studio
```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio
```
## Installing Obsidian
```
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb
sudo apt install ~/obsidian_1.5.3_amd64.deb
rm obsidian_1.5.3_amd64.deb
```
## Installing PeaZip
```
wget https://github.com/peazip/PeaZip/releases/download/9.7.1/peazip_9.7.1.LINUX.GTK2-1_amd64.deb
sudo apt install ~/peazip_9.7.1.LINUX.GTK2-1_amd64.deb
rm peazip_9.7.1.LINUX.GTK2-1_amd64.deb
```
## Installing Pinta
```
sudo apt install pinta
```
## Installing and Configuring Pywal
```
conda deactivate
sudo apt install pip
sudo pip3 install pywal
#sudo apt install python2
echo 'wal -R -q' | tee -a /home/pc/.bashrc
```
```
wal --theme base16-rebecca
```
## Installing and Configuring Pi-hole
```
curl -sSL https://install.pi-hole.net | bash
```
```
sudo pihole -a -p
```
## Installing qBittorrent
```
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent
```
## Installing  and Configuring Rclone
```
sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config
```
## Installing Rclone Browser
```
sudo apt update && sudo apt -y install git g++ make qtdeclarative5-dev
git clone https://github.com/kapitainsky/RcloneBrowser.git
cd RcloneBrowser
mkdir build && cd build
cmake ..
rm ~/RcloneBrowser/src/main_window.cpp
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/main_window.cpp -P ~/RcloneBrowser/src
make
sudo make install
```
## Installing Solaar
```
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt install solaar
```
## Installing Telegram
```
sudo apt install telegram-desktop
```
## Installing TeX Live
```
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*
sudo perl ./install-tl --no-interaction
echo 'export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"' | tee -a /home/pc/.bashrc
rm install-tl-unx.tar.gz
rm -r install-tl-*
```
## Installing Thunderbird
```
wget https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/115.7.0/linux-x86_64/fr/thunderbird-115.7.0.tar.bz2
tar xjf thunderbird-115.7.0.tar.bz2
rm thunderbird-115.7.0.tar.bz2
sudo mv thunderbird /opt
sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/installing-thunderbird-linux/thunderbird.desktop -P /usr/local/share/applications
```
## Installing VirtualBox
```
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
sudo apt install ~/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
rm virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
```
## Installing Xtreme Download Manager
```
wget https://github.com/subhra74/xdm/releases/download/8.0.29/xdman_gtk_8.0.29_amd64.deb
sudo apt install ~/xdman_gtk_8.0.29_amd64.deb
rm xdman_gtk_8.0.29_amd64.deb
```
## Installing Zathura
```
sudo apt install zathura
```
</details>

# Conda
<details>

## Installing AutoKhan
```
git clone https://github.com/Inc44/AutoKhan.git
cd AutoKhan
conda create --name AutoKhan python=3.10.13
conda activate AutoKhan
pip install -r requirements.txt
```
## Installing MaTools
```
sudo apt install libxcb-cursor0
conda create --name MaTools python=3.10.13
conda activate MaTools
git clone https://github.com/Inc44/MaTools.git
cd MaTools
pip install -r requirements.txt
```
## Installing OCRMyPDF
```
sudo apt install unpaper
conda create --name ocrmypdf python=3.10.13 -y
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
```
## Installing WhisperX
```
conda create --name whisperx python=3.10.13 -y
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install git+https://github.com/m-bain/whisperx.git
```
## Installing and Using NanoGPT
```
conda create --name nanogpt python=3.10.13
conda activate nanogpt
pip install torch numpy transformers datasets tiktoken wandb tqdm
git clone https://github.com/karpathy/nanoGPT.git
```
```
conda activate nanogpt
cd nanoGPT
python -O data/shakespeare_char/prepare.py
python -O train.py config/train_shakespeare_char.py
```
## Installing UVR
```
sudo apt install python3-pip
sudo apt install python3-tk
git clone https://github.com/Anjok07/ultimatevocalremovergui.git
cd ultimatevocalremovergui
conda create --name uvr python=3.10.13
conda activate uvr
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/Dora-0.0.3.tar.gz
pip3 install Dora-0.0.3.tar.gz
pip3 install -r requirements.txt
```
</details>

# Pentesting
<details>

## Installing and Using Aircrack-ng
```
sudo apt install aircrack-ng
sudo apt install net-tools
```
```
ifconfig #netstat -ie
sudo airmon-ng start wlp7s0
iwconfig
sudo airodump-ng wlp7s0mon
sudo airodump-ng -c CH --bssid BSSID -w . wlp7s0mon
sudo airmon-ng stop wlp7s0mon
```
## Installing and Using John the Ripper
```
git clone https://github.com/openwall/john
cd john/src
sudo apt install libssl-dev libgmp-dev libbz2-dev libpcap-dev
./configure
make
echo 'export PATH="/home/pc/john/run:$PATH"' | tee -a /e
```
```
zip2john /home/pc/path.zip > /home/pc/hash.txt
```
## Installing and Using Hashcat
```
git clone https://github.com/hashcat/hashcat.git
cd hashcat
make
echo 'export PATH="/home/pc/hashcat:$PATH"' | tee -a /home/pc/.bashrc
```
```
sed -i 's/^[^$]*//' /home/pc/hash.txt
sed -i 's/[^$]*$//' /home/pc/hash.txt
```
```
wget https://download.weakpass.com/wordlists/90/rockyou.txt.gz
gzip -d rockyou.txt.gz
hashcat -m 13600 -a3 -w3 -d2 /home/pc/hash.txt /home/pc/rockyou.txt --increment --increment-min 8 --increment-max 8
cat /home/pc/hashcat/hashcat.potfile
rm /home/pc/hashcat/hashcat.potfile
```
```
hashcat -m 13600 -a3 -w3 -d2 /home/pc/hash.txt --increment --increment-min 8 --increment-max 8 ?d?d?d?d?d?d?d?d
hashcat -m 13600 -a3 -w3 -d2 /home/pc/hash.txt --increment --increment-min 8 --increment-max 8 ?l?l?l?l?l?l?l?l
```
```
hashcat -b -d 2 -m 13600
```
## Installing Hashcat Utils
```
git clone https://github.com/hashcat/hashcat-utils.git
cd /home/pc/hashcat-utils/src
make
echo 'export PATH="/home/pc/hashcat-utils/src:$PATH"' | tee -a /home/pc/.bashrc
```
```
./cap2hccapx.bin /home/pc/.-01.cap /home/pc/wifi.hccapx
```
</details>

# Theme
<details>
  
## Installing and Configuring WhiteSur Theme
```
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -t purple -c Light
cd ..
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd WhiteSur-icon-theme
./install.sh -a -t purple
```
</details>

# Just Because
<details>

## Installing Blazingly Fast Rust Donut
```
cargo install blazingly_fast_rust_donut
```
</details>

# TODO
```
ls
lshw
lsblk
mkdir path
cd path
cp path path
mv path path
killall process
nvidia-smi
nano path
vim path
lsattr path
chattr -i path
chmod +x path
chown path
ps -aux
xz -zkf9ev path
zip -0 -r path.zip path
touch -amt 197001010100.00 path
reboot
shutdown
apt install/remove/purge package
```
