# dotfiles
## Introduction
This repository contains a collection of dotfiles and setup commands to configure a Ubuntu Linux system.
## Getting Started
Please follow the steps carefully.
## Clean History
```
history -c && history -w
```
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
## Shortcuts
Ctrl+E
```
sensible-browser
```
Ctrl+M
```
/home/pc/miniconda3/envs/MaTools/bin/python -O /home/pc/MaTools/management_tools/main_management_tools_app.pyw
```
Ctrl+U
```
/home/pc/miniconda3/envs/uvr/bin/python -O /home/pc/ultimatevocalremovergui/UVR.py
```
Super+E
```
nautilus
```
Super+T
```
...
```
## Installing Vim
```
sudo apt install vim
```
## Disable/Blacklist the Nouveau Driver
```
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo reboot
```
## Installing CUDA
```
sudo apt install gcc
sudo apt install linux-headers-$(uname -r)
sudo apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get install cuda-toolkit
sudo apt-get install nvidia-gds
sudo reboot
```
## Installing Nvidia Driver
```
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get install nvidia-driver-545
rm cuda-keyring_1.1-1_all.deb
sudo reboot
```
## Installing Microsoft Edge
```
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_121.0.2277.128-1_amd64.deb
sudo apt install ~/microsoft-edge-stable_121.0.2277.128-1_amd64.deb
rm microsoft-edge-stable_121.0.2277.128-1_amd64.deb
```
## Installing Visual Studio Code
```
wget https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.86.2-1707854558_amd64.deb
sudo apt install ~/code_1.86.2-1707854558_amd64.deb
rm code_1.86.2-1707854558_amd64.deb
```
## Installing Yandex Browser
```
wget https://ext-cachev2-cogent03.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/24_1_1_940_54214/Yandex.deb
sudo apt install ~/Yandex.deb
rm Yandex.deb
```
## Installing Obsidian
```
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb
sudo apt install ~/obsidian_1.5.3_amd64.deb
rm obsidian_1.5.3_amd64.deb
```
## Installing OBS Studio
```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio
```
## Installing qBittorrent
```
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent
```
## Installing Inkscape
```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt install inkscape
```
## Installing Tesseract OCR
```
sudo add-apt-repository ppa:alex-p/tesseract-ocr5
sudo apt install tesseract-ocr
```
## Remove Snap
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
sudo apt remove snapd
sudo gedit /etc/apt/preferences.d/nosnap.pref
rm -r snap
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
## Installing FFMPEG
```
sudo add-apt-repository ppa:ubuntuhandbook1/ffmpeg6
sudo apt-get install ffmpeg
```
## Installing  and Configuring Git
```
sudo apt install git
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
## Installing ECT
```
git clone --recursive https://github.com/fhanau/Efficient-Compression-Tool.git
cd Efficient-Compression-Tool
mkdir build
cd build
cmake ../src
make
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
## Installing WhisperX
```
conda create --name whisperx python=3.10.13 -y
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install git+https://github.com/m-bain/whisperx.git
```
## Installing OCRMyPDF
```
conda create --name ocrmypdf python=3.10.13 -y
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
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
## Installing Thunderbird
```
wget https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/115.7.0/linux-x86_64/fr/thunderbird-115.7.0.tar.bz2
tar xjf thunderbird-115.7.0.tar.bz2
rm thunderbird-115.7.0.tar.bz2
sudo mv thunderbird /opt
sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/installing-thunderbird-linux/thunderbird.desktop -P /usr/local/share/applications
```
## Installing Rclone Browser
```
sudo apt update && sudo apt -y install git g++ make qtdeclarative5-dev
git clone https://github.com/kapitainsky/RcloneBrowser.git
cd RcloneBrowser
mkdir build && cd build
cmake ..
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/main_window.cpp -P RcloneBrowser/src
make
sudo make install
```
