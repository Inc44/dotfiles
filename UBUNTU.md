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
### Installing and Using Gnu Stow
```
sudo apt install stow
```
```
cd dotfiles
stow .
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
Update GRUB configuration
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
### Installing Font Awesome
```
git clone https://github.com/eliyantosarage/font-awesome-pro.git
cp -r ~/font-awesome-pro/fontawesome-pro-6.5.1-desktop/otfs/* ~/.fonts
sudo rm -r ~/font-awesome-pro
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
### Installing Httrack
```
sudo apt install httrack
```
### Installing Inkscape
```
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt install inkscape
```
### Installing and Configuring Kitty
```
sudo apt install kitty
sudo update-alternatives --config x-terminal-emulator
```
### Installing Ly
```
sudo apt install build-essential libpam0g-dev libxcb-xkb-dev
git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
make
sudo make install installsystemd
systemctl disable getty@tty2.service
sudo systemctl disable gdm3.service
sudo systemctl enable ly.service
sudo reboot
```
### Installing MPC
```
sudo apt install mpc
```
### Installing MPD
```
sudo apt install mpd
```
### Installing MPV
```
sudo apt install mpv
sudo wget https://raw.githubusercontent.com/Inc44/dotfiles/main/mpv.conf -O /etc/mpv/mpv.conf
```
### Installing NCMPCPP
```
sudo apt install ncmpcpp
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
rm Noto.zip
sudo fc-cache -f -v
```
### Installing Nitrogen
```
sudo apt install nitrogen
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
### Installing Pavucontrol
```
sudo apt install pavucontrol
```
### Installing PeaZip
```
wget https://github.com/peazip/PeaZip/releases/download/9.7.1/peazip_9.7.1.LINUX.GTK2-1_amd64.deb -O peazip_9.7.1.LINUX.GTK2-1_amd64.deb
sudo apt install ~/peazip_9.7.1.LINUX.GTK2-1_amd64.deb
rm peazip_9.7.1.LINUX.GTK2-1_amd64.deb
```
### Installing Picom
```
sudo apt install picom
```
### Installing Pinta
```
sudo apt install pinta
```
### Installing Pipx
```
sudo apt install pipx
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
### Installing Recoverpy
```
sudo apt install grep coreutils util-linux progress
sudo pipx run recoverpy
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
### Installing Tree
```
sudo apt install tree
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
### Installing Zig
```
wget https://ziglang.org/builds/zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
tar xf zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
rm zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06.tar.xz
mv zig-linux-x86_64-0.12.0-dev.3156+0b2e23b06 zig
echo 'export PATH="/home/pc/zig:$PATH"' | tee -a /home/pc/.bashrc
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
