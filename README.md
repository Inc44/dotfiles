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
sudo apt update
sudo apt-get install cuda-toolkit
sudo apt-get install nvidia-gds
sudo reboot
```
## Installing Nvidia Driver
```
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt update
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
sudo apt update
sudo apt install obs-studio
```
## Installing qBittorrent
```
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt update
sudo apt install qbittorrent
```
## Installing Inkscape
```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape
```
## Installing Tesseract OCR
```
sudo add-apt-repository ppa:alex-p/tesseract-ocr5
sudo apt update
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
```
