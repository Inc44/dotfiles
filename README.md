# dotfiles
## Introduction
This repository contains a collection of dotfiles and setup commands to configure a Ubuntu Linux system.
## Getting Started
Please follow the steps carefully.
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
## Disable/Blacklist the Nouveau driver
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
## Installing Nvidia Drivers
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
