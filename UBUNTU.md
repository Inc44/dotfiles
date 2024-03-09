## Maintenance
<details>

### System Update and Cache Cleaning
```
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt autoclean
sudo apt clean
pip cache purge
conda clean -a
sudo journalctl --vacuum-time=1h
```
### Clean History
```
history -c && history -w
```
</details>

## Developpement
<details>

### Installing CUDA
<details>

#### Disable/Blacklist the Nouveau Driver
```
echo "blacklist nouveau" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo "options nouveau modeset=0" | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo reboot
```
#### Installing CUDA Toolkit and Nvidia Driver
```
sudo apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb -O cuda-keyring_1.1-1_all.deb
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

### Apt Add Repositories
```
sudo add-apt-repository ppa:alex-p/tesseract-ocr5
sudo add-apt-repository ppa:inkscape.dev/stable
sudo add-apt-repository ppa:obsproject/obs-studio
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo add-apt-repository ppa:solaar-unifying/stable
sudo add-apt-repository ppa:ubuntuhandbook1/ffmpeg6
sudo add-apt-repository ppa:xtradeb/apps
sudo add-apt-repository universe
```
### Apt Installing Everything
```
sudo apt install aircrack-ng bspwm build-essential conky coreutils curl czkawka ffmpeg g++ gcc git git-lfs gnome-screenshot gnome-shell-extension-manager gnome-tweaks golang-go gparted grep httrack inkscape kitty libbz2-dev libgmp-dev libpam0g-dev libpcap-dev libssl-dev libxcb-cursor0 libxcb-xkb-dev linux-headers-$(uname -r) make mpc mpd mpv ncmpcpp neofetch net-tools nitrogen obs-studio pavucontrol picom pinta pip pipx polybar progress python2 python3-pip python3-tk qbittorrent qtdeclarative5-dev rofi solaar stow telegram-desktop tesseract-ocr tree unpaper util-linux vim xclip zathura zsh
```
### Installing CMake
```
wget https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-x86_64.sh -O cmake-3.28.3-linux-x86_64.sh
sudo mkdir /opt/cmake
sudo sh cmake-3.28.3-linux-x86_64.sh --skip-license --exclude-subdir --prefix=/opt/cmake
sudo ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
rm cmake-3.28.3-linux-x86_64.sh
```
### Installing Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
### Installing Visual Studio Code
```
wget https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.86.2-1707854558_amd64.deb -O code_1.86.2-1707854558_amd64.deb
sudo apt install ~/code_1.86.2-1707854558_amd64.deb
rm code_1.86.2-1707854558_amd64.deb
```
</details>

## Browser
<details>

### Installing Microsoft Edge
```
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_121.0.2277.128-1_amd64.deb -O microsoft-edge-stable_121.0.2277.128-1_amd64.deb
sudo apt install ~/microsoft-edge-stable_121.0.2277.128-1_amd64.deb
rm microsoft-edge-stable_121.0.2277.128-1_amd64.deb
```
### Installing Yandex Browser
```
wget https://ext-cachev2-cogent03.cdn.yandex.net/download.cdn.yandex.net/browser/yandex/24_1_1_940_54214/Yandex.deb -O Yandex.deb
sudo apt install ~/Yandex.deb
rm Yandex.deb
```
</details>

## Bootloader
<details>

### Configuring GRUB
```
sudo vim /etc/default/grub
sudo update-grub
#sudo grub-mkconfig -o /boot/grub/grub.cfg
```
</details>

## Cleanup
<details>

### Disabling Shutdown Confirmation
```
gsettings set org.gnome.SessionManager logout-prompt false
```
### Purge Apport
```
sudo apt purge apport
```
### Purge Snap
```
snap list
sudo snap purge snap-store
sudo snap purge gnome-3-38-2004
sudo snap purge gnome-42-2204
sudo snap purge gtk-common-themes
sudo snap purge snapd-desktop-integration
sudo snap purge bare
sudo snap purge core22
sudo snap purge firefox
sudo snap purge core20
sudo snap purge snapd
sudo apt purge snapd
sudo vim /etc/apt/preferences.d/nosnap.pref
rm -r snap
```
### Purge Old Kernels
Identify your current kernel
```
uname -r
```
List all installed kernels
```
dpkg --list | egrep -i --color 'linux-image|linux-headers|linux-modules' | awk '{ print $2 }'
```
Remove old kernels
```
sudo apt purge linux-image-old
sudo apt purge linux-headers-old
sudo apt purge linux-modules-old
sudo apt purge linux-modules-extra-old
```
### Update GRUB configuration
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
### Remove Ubuntu Logo
```
sudo rm /usr/share/plymouth/ubuntu-logo.png
```
</details>

## Tools
<details>

## Configuring Gedit
```
gsettings set org.gnome.gedit.preferences.editor editor-font 'Noto Sans Mono 16'
gsettings set org.gnome.gedit.preferences.editor scheme 'classic'
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor use-default-font false
```
### Configuring Kitty
```
sudo update-alternatives --config x-terminal-emulator
```
### Installing Ly
```
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
systemctl disable getty@tty2.service
sudo systemctl disable gdm3.service
sudo systemctl enable ly.service
sudo reboot
```
### Installing Obsidian
```
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb -O obsidian_1.5.3_amd64.deb
sudo apt install ~/obsidian_1.5.3_amd64.deb
rm obsidian_1.5.3_amd64.deb
```
### Installing PeaZip
```
wget https://github.com/peazip/PeaZip/releases/download/9.7.1/peazip_9.7.1.LINUX.GTK2-1_amd64.deb -O peazip_9.7.1.LINUX.GTK2-1_amd64.deb
sudo apt install ~/peazip_9.7.1.LINUX.GTK2-1_amd64.deb
rm peazip_9.7.1.LINUX.GTK2-1_amd64.deb
```
### Installing Pi-hole
```
curl -sSL https://install.pi-hole.net | bash
sudo pihole -a -p
```
### Installing and Configuring Rclone
```
sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config
```
### Installing Rclone Browser
```
git clone https://github.com/kapitainsky/RcloneBrowser.git
cd RcloneBrowser
mkdir build
cd build
cmake ..
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/main_window.cpp -O ~/RcloneBrowser/src/main_window.cpp
make
sudo make install
```
### Installing Thunderbird
```
wget https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/115.7.0/linux-x86_64/fr/thunderbird-115.7.0.tar.bz2 -O thunderbird-115.7.0.tar.bz2
tar xjf thunderbird-115.7.0.tar.bz2
rm thunderbird-115.7.0.tar.bz2
sudo mv thunderbird /opt
sudo ln -s /opt/thunderbird/thunderbird /usr/local/bin/thunderbird
sudo wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/installing-thunderbird-linux/thunderbird.desktop -O /usr/local/share/applications/thunderbird.desktop
```
### Installing VirtualBox
```
wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb -O virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
sudo apt install ~/virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
rm virtualbox-7.0_7.0.14-161095~Ubuntu~jammy_amd64.deb
```
### Installing Wal
```
conda deactivate
sudo pip3 install pywal
wal --theme base16-rebecca
```
### Installing Xtreme Download Manager
```
wget https://github.com/subhra74/xdm/releases/download/8.0.29/xdman_gtk_8.0.29_amd64.deb -O xdman_gtk_8.0.29_amd64.deb
sudo apt install ~/xdman_gtk_8.0.29_amd64.deb
rm xdman_gtk_8.0.29_amd64.deb
```
### Installing Zig
```
wget https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
tar xf zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
rm zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
mv zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06 zig
echo 'export PATH="/home/pc/zig:$PATH"' | tee -a /home/pc/.bashrc
```
</details>

## Pentesting
<details>

### Using Aircrack-ng
```
ifconfig #netstat -ie
sudo airmon-ng start wlp7s0
iwconfig
sudo airodump-ng wlp7s0mon
sudo airodump-ng -c CH --bssid BSSID -w . wlp7s0mon
sudo airmon-ng stop wlp7s0mon
```
### Installing John the Ripper
```
git clone https://github.com/openwall/john
cd john/src
./configure
make
```
### Using John the Ripper
```
zip2john /home/pc/path.zip > /home/pc/hash.txt
```
### Installing Hashcat
```
git clone https://github.com/hashcat/hashcat.git
cd hashcat
make
```
### Using Hashcat
```
sed -i 's/^[^$]*//' /home/pc/hash.txt
sed -i 's/[^$]*$//' /home/pc/hash.txt
```
```
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
### Installing Hashcat Utils
```
git clone https://github.com/hashcat/hashcat-utils.git
cd /home/pc/hashcat-utils/src
make
```
### Using Hashcat Utils
```
cap2hccapx.bin /home/pc/.-01.cap /home/pc/wifi.hccapx
```
</details>
