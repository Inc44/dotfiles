# dotfiles
# Introduction
This repository contains a collection of dotfiles and setup commands to configure a Ubuntu and Arch Linux systems.
# Getting Started
Please follow the steps carefully.
# Ubuntu Specific
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
sudo journalctl --vacuum-time=1d
```
### Clean History
```
history -c && history -w
```
</details>

## Shortcuts
<details>

#### Ctrl+E
```
sensible-browser
```
#### Ctrl+M
```
/home/pc/miniconda3/envs/MaTools/bin/python -O /home/pc/MaTools/management_tools/main_management_tools_app.pyw
```
#### Ctrl+U
```
/home/pc/miniconda3/envs/uvr/bin/python -O /home/pc/ultimatevocalremovergui/UVR.py
```
#### Super+E
```
nautilus
```
#### Super+T
```
/home/pc/miniconda3/envs/MaTools/bin/python -O /home/pc/MaTools/management_tools/script_image_trimmer.pyw
```
#### Super+S
```
gnome-screenshot --delay=1
```
#### Super+Shift+S
```
Take a screenshot interactively
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
sudo apt install gcc
sudo apt install linux-headers-$(uname -r)
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

### Installing and Configuring Git
```
sudo apt install git
```
```
git config --global user.email email
git config --global user.name name
```
### Initializing Git
```
git init -b main
```
### Installing CMake
```
wget https://github.com/Kitware/CMake/releases/download/v3.28.3/cmake-3.28.3-linux-x86_64.sh -O cmake-3.28.3-linux-x86_64.sh
sudo mkdir /opt/cmake
sudo sh cmake-3.28.3-linux-x86_64.sh --skip-license --exclude-subdir --prefix=/opt/cmake
sudo ln -s /opt/cmake/bin/cmake /usr/local/bin/cmake
rm cmake-3.28.3-linux-x86_64.sh
```
### Installing Miniconda
```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
cd miniconda3/bin
./conda init
```
### Installing Curl
```
sudo apt install curl
```
### Installing FFMPEG
```
sudo add-apt-repository ppa:ubuntuhandbook1/ffmpeg6
sudo apt-get install ffmpeg
```
### Installing Go
```
sudo apt install golang-go
```
### Installing Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
### Installing Tesseract OCR
```
sudo add-apt-repository ppa:alex-p/tesseract-ocr5
sudo apt install tesseract-ocr
```
### Installing and Configuring Vim and Vim-Plug
```
sudo apt install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.vimrc -O .vimrc
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.vimrc.plug -O .vimrc.plug
vim > :set spell > Y > Y > 1 > Y
vim > :PlugInstall
wget https://raw.githubusercontent.com/gillescastel/latex-snippets/master/tex.snippets -O ~/.vim/UltiSnips/tex.snippets
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
### Remove Ubuntu Logo
```
sudo rm /usr/share/plymouth/ubuntu-logo.png
```
</details>

## Tools
<details>

### Installing and Using 7-Zip
```
wget https://www.7-zip.org/a/7z2301-linux-x64.tar.xz -O 7z2301-linux-x64.tar.xz
mkdir 7-zip
tar xf 7z2301-linux-x64.tar.xz -C 7-zip
echo 'export PATH="/home/pc/7-zip:$PATH"' | tee -a /home/pc/.bashrc
rm 7z2301-linux-x64.tar.xz
```
```
7zz a -tzip -m0=Copy -ppassword -mem=AES256 path.zip path
7zz x path.zip
```
## Configuring Bash
```
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.bashrc -O .bashrc
```
### Installing Bspwm
```
sudo apt install bspwm
```
### Installing Conky
```
sudo apt install conky
sudo wget https://raw.githubusercontent.com/Inc44/dotfiles/main/conky.conf -O /etc/conky/conky.conf
```
### Installing Czkawka
```
sudo add-apt-repository ppa:xtradeb/apps
sudo apt update
sudo apt-get install czkawka
```
### Installing ECT
```
git clone --recursive https://github.com/fhanau/Efficient-Compression-Tool.git
cd Efficient-Compression-Tool
mkdir build
cd build
cmake ../src
make
echo 'export PATH="/home/pc/Efficient-Compression-Tool/build:$PATH"' | tee -a /home/pc/.bashrc
```
### Installing Fonts
```
cp -r ~/dotfiles/.fonts ~
sudo fc-cache -f -v
```
### Installing Gnome Screenshot
```
sudo apt install gnome-screenshot
```
### Installing GParted
```
sudo apt install gparted
```
## Configuring Gedit
```
gsettings set org.gnome.gedit.preferences.editor editor-font 'Noto Sans Mono 16'
gsettings set org.gnome.gedit.preferences.editor scheme 'classic'
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor use-default-font false
```
### Installing Inkscape
```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt install inkscape
```
### Installing Ly
```
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
...
```
### Installing MPV
```
sudo apt install mpv
sudo wget https://raw.githubusercontent.com/Inc44/dotfiles/main/mpv.conf -O /etc/mpv/mpv.conf
```
### Installing Neofetch
```
sudo apt install neofetch
echo 'neofetch' | tee -a /home/pc/.bashrc
```
### Installing Nerd Fonts
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Noto.zip
unzip Noto.zip "*.ttf" -d ~/.fonts
sudo fc-cache -f -v
```
### Installing OBS Studio
```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt install obs-studio
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/obs-studio/global.ini -O ~/.config/obs-studio/global.ini
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/obs-studio/basic/profiles/Untitled/basic.ini -O ~/.config/obs-studio/basic/profiles/Untitled/basic.ini
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/obs-studio/basic/profiles/Untitled/recordEncoder.json -O ~/.config/obs-studio/basic/profiles/Untitled/recordEncoder.json
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/obs-studio/basic/profiles/Untitled/streamEncoder.json -O ~/.config/obs-studio/basic/profiles/Untitled/streamEncoder.json
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
### Installing Pinta
```
sudo apt install pinta
```
### Installing Polybar
```
sudo apt install polybar
```
### Installing and Configuring Pywal
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
### Installing and Configuring Pi-hole
```
curl -sSL https://install.pi-hole.net | bash
```
```
sudo pihole -a -p
```
### Installing qBittorrent
```
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent
```
### Installing and Configuring Rclone
```
sudo -v ; curl https://rclone.org/install.sh | sudo bash
rclone config
```
### Installing Rclone Browser
```
sudo apt update
sudo apt install git g++ make qtdeclarative5-dev
git clone https://github.com/kapitainsky/RcloneBrowser.git
cd RcloneBrowser
mkdir build
cd build
cmake ..
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/main_window.cpp -O ~/RcloneBrowser/src/main_window.cpp
make
sudo make install
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.local/share/rclone-browser/rclone-browser/tasks.bin -O ~/.local/share/rclone-browser/rclone-browser/tasks.bin
```
### Installing Rofi
```
sudo apt install rofi
```
### Installing Solaar
```
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt install solaar
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/solaar/config.yaml -O ~/.config/solaar/config.yaml
```
### Installing Telegram
```
sudo apt install telegram-desktop
```
### Installing TeX Live
```
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*
sudo perl ./install-tl --no-interaction
echo 'export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"' | tee -a /home/pc/.bashrc
rm install-tl-unx.tar.gz
rm -r install-tl-*
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
### Installing Xtreme Download Manager
```
wget https://github.com/subhra74/xdm/releases/download/8.0.29/xdman_gtk_8.0.29_amd64.deb -O xdman_gtk_8.0.29_amd64.deb
sudo apt install ~/xdman_gtk_8.0.29_amd64.deb
rm xdman_gtk_8.0.29_amd64.deb
```
### Installing Zathura
```
sudo apt install zathura
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/.config/zathura/zathurarc -O ~/.config/zathura/zathurarc
```
### Installing Zsh
```
sudo apt install zsh
```
</details>

## Python
<details>

### Installing AutoKhan
```
git clone https://github.com/Inc44/AutoKhan.git
cd AutoKhan
conda create --name AutoKhan python=3.10.13
conda activate AutoKhan
pip install -r requirements.txt
```
### Installing Chatgpt Telegram Bot
```
conda create --name ctb python=3.10.13
conda activate ctb
git clone https://github.com/n3d1117/chatgpt-telegram-bot.git
cd chatgpt-telegram-bot
pip install -r requirements.txt
```
```
/home/pc/miniconda3/envs/ctb/bin/python -O /home/pc/chatgpt-telegram-bot/bot/main.py
```
### Installing MaTools
```
sudo apt install libxcb-cursor0 xclip
conda create --name MaTools python=3.10.13
conda activate MaTools
git clone https://github.com/Inc44/MaTools.git
cd MaTools
pip install -r requirements.txt
```
### Installing and Using NanoGPT
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
### Installing OCRMyPDF
```
sudo apt install unpaper
conda create --name ocrmypdf python=3.10.13
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
```
### Installing and Using TheSync
```
git clone https://github.com/Inc44/TheSync.git
```
```
cd TheSync
python -O thesync.py
```
### Installing and Using TheTTS
```
git clone https://github.com/Inc44/TheTTS.git
cd TheTTS
conda create --name TheTTS python=3.10.13
conda activate TheTTS
pip install openai==1.12.0 TTS==0.22.0
DS_BUILD_TRANSFORMER_INFERENCE=1 pip install deepspeed==0.13.3
sudo apt install git-lfs
git lfs install
git clone https://huggingface.co/coqui/XTTS-v2
sudo rm -r XTTS-v2/.git
cp /home/pc/TheTTS/xtts.py /home/pc/miniconda3/envs/TheTTS/lib/python3.10/site-packages/TTS/tts/models
```
```
conda activate TheTTS
cd TheTTS
python -O thetts.py
```
### Installing UVR
```
sudo apt install python3-pip
sudo apt install python3-tk
git clone https://github.com/Anjok07/ultimatevocalremovergui.git
cd ultimatevocalremovergui
conda create --name uvr python=3.10.13
conda activate uvr
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/Dora-0.0.3.tar.gz -O Dora-0.0.3.tar.gz
pip3 install Dora-0.0.3.tar.gz
pip3 install -r requirements.txt
```
### Installing WhisperX
```
conda create --name whisperx python=3.10.13
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install git+https://github.com/m-bain/whisperx.git
pip install faster-whisper==1.0.0 --upgrade
```
</details>

## Pentesting
<details>

### Installing and Using Aircrack-ng
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
### Installing and Using John the Ripper
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
### Installing and Using Hashcat
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
wget https://download.weakpass.com/wordlists/90/rockyou.txt.gz -O rockyou.txt.gz
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
### Installing Hashcat Utils
```
git clone https://github.com/hashcat/hashcat-utils.git
cd /home/pc/hashcat-utils/src
make
echo 'export PATH="/home/pc/hashcat-utils/src:$PATH"' | tee -a /home/pc/.bashrc
```
```
cap2hccapx.bin /home/pc/.-01.cap /home/pc/wifi.hccapx
```
</details>

## Extensions
<details>

### Installing Gnome Tweaks and Extension
```
sudo add-apt-repository universe
sudo apt install gnome-tweaks
sudo apt install gnome-shell-extension-manager
```
### Installing and Configuring WhiteSur Theme
```
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -t purple -c Light
cd ..
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd WhiteSur-icon-theme
./install.sh -a -t purple
```
Search for `User Themes` by `gnome-shell-extensions.gcampax.github.com`

Themes: `WhiteSur-Light-solid-purple`
### Installing and Configuring Color Picker
Search for `Color Picker` by `tuberry`

Enable preview: `On`

Persistent mode: `On`

Automatically copy: `On`

Shortcut to pick: `Super + C`

Notification style: `Off`

Enable systray: `Off`
</details>

## Just Because
<details>

### Installing Blazingly Fast Rust Donut
```
cargo install blazingly_fast_rust_donut
```
</details>

## Cheat Sheet
`apt install package`: Install package along with its dependencies

`apt remove package`: Remove package, preserve configuration and data

`apt purge package`: Remove package

`cd directory`: Change the current directory

`chattr attribute path`: Change the attributes of a file or directory

`+r`, `-r`: Add/remove read attribute

`+w`, `-w`: Add/remove write attribute

`+x`, `-x`: Add/remove executable attribute

`+i`, `-i`: Add/remove immutable attribute

`chmod mode path`: Change the mode of a file or directory

`0`: No permissions, `1`: Read, `2`: Write, `3`: `1+2`, `4`: Execute, `5`: `1+4`, `6`: `2+4`, `7`: `1+2+4`

`u`: User, `g`: Group, `o`: Others, `a`: All

mode: `755` == `rwxrw-rw-` for `ugo`

`chown user/uid path`: Change the owner of a file or directory

`id -u user`: Get UID of user

`cp path1 path2`: Copy by overwriting the file or directory at `path1` to `path2`

`killall process`: Terminate all processes of `process`

`ls`: List the files and directories in the current directory

`ls -l`: List the files and directories in the current directory in long format, showing permissions, ownership, size, and modification date

`lsattr path`: List the attributes of the files or directories

`lsblk`: List information about all available storage devices

`lshw`: List detailed information about the hardware configuration of the machine

`mkdir directory`: Create a new directory

`touch -amt 197001010100.00 file`: Create/update the access and modification times

`mkfs.ext4 partition`: Create an ext4 filesystem

`mkfs.fat -F32 partition`: Create a FAT32 filesystem

`mount`: Mount a unmounted filesystem

`umount`: Unmount a mounted filesystem

`mv path1 path2`: Move or rename by overwriting the file or directory at path1 to path2

`code file`: Open the file in the Visual Studio Code text editor

`gedit file`: Open the file in the Vim text editor

`nano file`: Open the file in the Nano text editor

`vim file`: Open the file in the Vim text editor

`nvidia-smi`: Display information about GPU utilization, temperature, memory usage, and more

`ps -aux`: Lists all running processes on the system.

`-a`: All users, `-u`: User-oriented format, `-x`: Include hidden processes

`reboot`: Reboot the system immediately

`shutdown +minutes`: Schedule/delay shutting down

`shutdown -c`: Cancel shutting down

`shutdown now`: Shut down the system immediately

`xz -zkf9ev path`: Compress a file using the XZ compression algorithm

`-z`: Compress, `-k`: Keep the original file, `-f`: Force if already exists, `-9`: Highest compression level, `-e`: Extreme compression, `-v`: Provide detailed information

`zip -0 -r path.zip path`: Creates a zip archive

`-0`: Stores without compression, `-r`: Recursive/include subdirectories and their content

`unzip archive -d destination`: Extracts files from a ZIP archive

`rsync -avz --no-o --no-g --no-perms`: Synchronizes files and directories between two locations

`-a`: Archive mode/preserves symbolic links, devices, attributes, permissions, ownerships

`-v`: Provide detailed information

`-z`: Compress during data transfer

`--no-o`, `--no-g`, `--no-perms`: Prevent setting ownership, group and changing permissions
## TODO
```
alias
grep
httrack
ls -a
tar
wget
```
# Arch Specific
### Connecting Wi-Fi
```
iwctl
device list
station adapter scan
station adapter get-networks
station adapter connect "network"
station adapter show
quit
```
### Partitioning Disk
```
lsblk
cfdisk disk
```
`New` > Partition size: `102400MiB` > `Write` > Are you sure you want to write the partition table to disk? `yes` > `Quit`
```
lsblk
mkfs.ext4 partition
```
### Installing Arch
```
archinstall
exit
reboot
```
### TODO: Installing VBox Linux Additions
Client:
```
sudo pacman -Sy
sudo pacman -S linux-headers
mkdir sr0
cd sr0
sudo mount /dev/sr0 ~/sr0
sudo ./VBoxLinuxAdditions.run
```
Host:
```
https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack
```
### Installing Nvidia Drivers
```
sudo pacman -S nvidia-lts nvidia-utils
```
### Installing VBox Drivers
```
sudo pacman -S xf86-video-qxl
```
### Installing Vim
```
sudo pacman -S vim
```
### TODO: Installing and Configuring Desktop Environment
```
sudo pacman -S xorg xorg-xinit bspwm sxhkd dmenu nitrogen picom xfce4-terminal
mkdir .config/bspwm
mkdir .config/sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc .config/bspwm
cp /usr/share/doc/bspwm/examples/sxhkdrc .config/sxhkd
vim .config/sxhkd/sxhkdrc
```
Replace `uvxvt`	with `xfce4-terminal`
```
cp /etc/X11/xinit/xinitrc .xinitrc
chmod +x .xinitrc
vim .xinitrc
```
Replace
```
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
```
with
```
setxkbmap en &
$HOME/.screenlayout/display.sh
nitrogen --restore &
xsetroot -cursor_name left_ptr
# picom -f &
exec bspwm
```
```
sudo vim /etc/xdg/picom.conf
```
```
startx
```
```
vim .config/bspwm/bspwmrc
```
`xrandr`: List available monitors
Add `bspc monitor MONITOR -d DESKTOPS` where `MONITOR` is monitor name from `xrandr` and `DESKTOPS` is desktop names from `I` to `X` and remove specified desktop names from `bspc monitor -d DESKTOPS` to put some work spaces on another monitor
`xprob`: Get information about clicked window
Add `bspc rule -a NAME desktop='^DESKTOP'` where `NAME` is `VM_CLASS(STRING)` from `xprop` starting with capital letter and `DESKTOP` is desktop name from `0` to `9` (Example: `bspc rule -a Microsoft-edge desktop='^4'`)
### Installing and Configuring Git
```
sudo pacman -S git
```
```
git config --global user.email email
git config --global user.name name
```
### Installing AUR Repository using Yay
```
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
sudo rm -r yay-bin
```
### Installing Microsoft Edge
```
yay -S microsoft-edge-stable-bin
```
### Installing Yandex Browser
```
yay -S yandex-browser
```
### Installing Visual Studio Code
```
sudo pacman -S code
```
### Installing Nautilus
```
sudo pacman -S nautilus
```
### TODO: Setting Wallpapers
`Super + Space` > `nitrogen`
`Preferences` > `Add` > Locate `~/dotfiles` > `Select` > `OK`
Replace `Automatic` with `Scaled`
`Apply`
### Installing Wget
```
sudo pacman -S wget
```
### Installing Unzip
```
sudo pacman -S unzip
```
### Installing Nerd Fonts
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Noto.zip
unzip Noto.zip "*.ttf" -d ~/.fonts
unzip Noto.zip "*.ttf" -d ~/.fonts
sudo fc-cache -f -v
rm Noto.zip
```
### Installing Fonts
```
cp -r ~/dotfiles/.fonts ~
sudo fc-cache -f -v
```
### Configuring Xfce4 Terminal
`Edit` > `Preferences` 
`General` > Scrollbar is: `Disabled`
`Appearance` > Replace `Monospace Regular 12` with `NotoMono Nerd Font Mono Regular 20` > `Select`
`Appearance` > `Background` > `Transparent Background`
`Appearance` > `Background` > `Opacity` > `0.60`
`Display menubar in new windows`
`Close`
### Installing Neofetch
```
sudo pacman -S neofetch
```
### Installing PIP
```
sudo pacman -S python-pip
```
### Installing PIL
```
sudo pacman -S python-pillow
```
### Installing Os Prober
```
sudo pacman -S os-prober
```
### Installing Minegrub
```
git clone https://github.com/Lxtharia/minegrub-theme.git
cd ./minegrub-theme
sudo mkdir /boot/grub2
sudo mkdir /boot/grub2/themes
sudo cp -ruv ./minegrub /boot/grub2/themes
sudo rm -r ~/minegrub-theme
sudo python3 -O /boot/grub2/themes/minegrub/update_theme.py '' 'I use Arch BTW!'
sudo vim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
### Installing Ly
```
sudo pacman -S ly
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly.service
sudo reboot
```
### TODO: Fixing Screen Tearing
```
sudo pacman -S nvidia-settings
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
```
```
sudo nvidia-xconfig
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
sudo vim /etc/X11/xorg.conf.d/20-nvidia.conf
```
### Installing Better Lock Screen
```
yay -S betterlockscreen
betterlockscreen -u ~/dotfiles/wallpaper.png --blur 1.0
vim .config/sxhkd/sxhkdrc
```
Add
```
# lockscreen
super + x
	betterlockscreen -l dimblur
```
### Installing Telegram
```
sudo pacman -S telegram-desktop
```
### Installing Obsidian
```
sudo pacman -S obsidian
```
### Installing Rofi
```
sudo pacman -S rofi
mkdir .config/rofi
vim .config/rofi/config.rasi
```
### Installing Zsh
```
sudo pacman -S zsh
```
### Installing and Configuring Arandr
```
sudo pacman -S arandr
arandr
```
`Outputs` > `Display` > `Resolution` > `1920x1080`
`✅`
`💾` > Name: `display` > `Save`
```
chmod +x .screenlayout/display.sh
```
### Installing Powerline
```
sudo pacman -S powerline
vim .bashrc
```
Add
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
./usr/share/powerline/bindings/bash/powerline.sh
```
### Installing Polybar
```
sudo pacman -S polybar
sudo pacman -S ttf-font-awesome
sudo pacman -S alsa-utils
sudo pacman -S pavucontrol
yay -S siji-git
sudo curl -o /bin/pulseaudio-control https://raw.githubusercontent.com/marioortizmanero/polybar-pulseaudio-control/master/pulseaudio-control.bash
sudo chmod +x /bin/pulseaudio-control
mkdir .config/polybar
vim .config/polybar/config.ini
vim .config/polybar/launch.sh
chmod +x .config/polybar/launch.sh
vim .config/bspwm/bspwmrc
Add `$HOME/.config/polybar/launch.sh`
sudo reboot
```
### Installing Wal
```
sudo pacman -S python-pywal
wal --theme base16-rebecca
vim .bashrc
```
### Installing Mpd
```
sudo pacman -S mpd
sudo pacman -S ncmpcpp
sudo pacman -S mpc
mkdir .config/mpd
vim .config/mpd/mpd.conf
sudo mkdir /etc/timidity
sudo touch /etc/timidity/timidity.cfg
mkdir /home/pc/.config/mpd/playlists
```
### Installing Gnome Polkit
```
sudo pacman -S polkit-gnome
vim .xinitrc
```
## Cheat Sheet
Use default `yay` parameters by pressing `Enter`

`Super + 0` to `Super + 9`: Go to desktop `0` to `9`

`Super + Alt + H`:  Stretch window right

`Super + Alt + Q`: Close `bspwm`

`Super + Alt + R`: Restart`bspwm`

`Super + C`: Change current window

`Super + Enter`: `xfce4-terminal`

`Super + M`: Enter full screen mode

`Super + Shift + 0` to `Super + Shift + 9`: Move window to desktop `0` to `9`

`Super + Shift + Alt + L`: Stretch window left

`Super + Shift + H`: Move current window right

`Super + Shift + L`: Move current window right

`Super + Space`: `rofi`

`Super + W`: Close window

`Super + X`: Lock screen