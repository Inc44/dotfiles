sudo pacman -S qemu-full libvirt dnsmasq virt-manager
git clone https://github.com/Coopydood/ultimate-macOS-KVM
cd ultimate-macOS-KVM
sudo systemctl enable libvirtd
systemctl status libvirtd
sudo usermod -aG libvirt pc
sudo usermod -aG kvm pc
ls /dev/disk/by-id/
./scripts/repo-update.py --force --targetBranch dev
./main.py
systemctl start virtqemud.socket
sudo virsh define boot.xml

pacman -Syu
pacman -Sy grub efibootmgr dosfstools mtools
mount /dev/nvme0n1p1 /boot
uname -a
# comment /boot
vim /etc/fstab
systemctl isolate rescue.target
lsblk -f
pacman -S linux-lts
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg


sudo nano /etc/hosts
sudo systemctl restart NetworkManager
cd ~/.local/share/applications/
ifuse --help
mkdir ~/iPad
ifuse ~/iPad

mkdir .config/mpd
vim .config/mpd/mpd.conf
sudo mkdir /etc/timidity/
sudo touch /etc/timidity/timidity.cfg
mkdir /home/pc/.config/mpd/playlists
sudo vim /etc/default/grub
sudo vim /etc/default/grub
cp /etc/default/grub ~
cp /etc/xdg/picom.conf ~

sudo pacman -S python3
conda install -c conda-forge jax
conda install -c conda-forge jaxlib
pip install -U keras-nlp
pip install -U keras>=3
jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0
pip install flash-attn
yay -S nvidia-container-toolkit
git lfs install
git clone https://github.com/karpathy/llama2.c.git
cd llama2.c
conda create --name llama2.c python=3.10
cea llama2.c
pip install -r requirements.txt
python tinystories.py download
python tinystories.py pretokenize
cargo build --release --features "cuda"
target/release/bitnet-rs train --dataset /home/pc/Desktop/bitnet-rs/llama2.c/data/TinyStories_all_data
target/release/bitnet-rs inference --prompt "Once upon a time "
strings /lib/libstdc++.so.6  | grep GLIBCXX_3.4.30

[Unit]
Description=Simple X Hotkey Daemon
Documnetation=man:sxhkd(1)
PartOf=graphical-session.target
After=graphical-session.target

[Service]
Restart=always
RestartSec=2
ExecStart=/usr/bin/sxhkd
ExecReload=/usr/bin/kill -SIGUSR1 $MAINPID
	
[Install]
WantedBy=default.target

# File marks:
/etc/default/grub
/etc/mpv/mpv.conf
/etc/pihole/pihole-FTL.conf
/etc/resolv.conf
/home/pc/.config/systemd/user/sxhkd.service

%!xxd

aomenc -w 1920 -h 1080 --lossless=1 --passes=2 --lag-in-frames=48 --cpu-used=0 --kf-max-dist=600 --kf-min-dist=30 --tile-columns=0 --tile-rows=0 --end-usage=q --cq-level=16 --bit-depth=10 -o input.mkv

--lossless=1 --passes=2 --kf-max-dist=600 --kf-min-dist=30 --end-usage=q --cq-level=16 --bit-depth=10 -o testall.mkv input.mkv

(echo file 0 & echo file 1 )>list.txt
ffmpeg -safe 0 -f concat -i list.txt -c copy out.mp4

for %%a in ("*.mkv*") do ffmpeg -i "%%a" -c copy "%%~na.mp4"
pause

for %%a in ("*.mp4*") do ffmpeg -i "%%a" -i "%%a" -map 1 -map_metadata 0 -c copy -movflags use_metadata_tags "%%~na_repack.mp4"
pause


CC="zig cc" CXX="zig c++" cmake ../src
make -j12
pw-cli list-objects | grep node.name
yay -Q
makepkg --packagelist
xwinwrap -fs -fdt -ni -b -nf -un -o 1.0 -debug -- mpv -wid WID --loop --no-audio --panscan=1 --player-operation-mode=cplayer ~/Videos/video.mp4


conda activate env
conda clean -a
conda create --name env package=version
conda env list
conda env remove env
dd if=/dev/zero of=yourfile.bin bs=1G count=1
free -h
git lfs install
grep pattern
jupyter notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0
pip cache purge
pip install -e .
python -OO script.py
strings path
sudo su


sudo docker run --gpus all -u $(id -u) -v /home/pc/:/workspace/ -v /home/pc/.cache/:/home/pc/.cache/ -p 7007:7007 --rm -it --shm-size=12gb dromni/nerfstudio:1.0.2
ns-download-data blender
ns-train instant-ngp blender-data --data data/blender/lego
ns-train nerfacto blender-data --data data/blender/lego
ns-train pynerf blender-data --data data/blender/lego
ns-train seathru-nerf-lite blender-data --data data/blender/lego
ns-train splatfacto blender-data --data data/blender/lego
ns-train tensorf blender-data --data data/blender/lego
ns-train vanilla-nerf blender-data --data data/blender/legosudo su


ollama pull cas/mistral-ft-optimized-1227
ollama pull cas/mixtral_11bx2_moe
ollama pull eas/nous-capybara
ollama pull llava:13b
ollama pull mgmacleod/laserxtral
ollama pull mixtral


conda create --name exl2 python=3.10
conda activate exl2
pip install exllamav2
git clone https://github.com/turboderp/exui
cd exui
pip install -r requirements.txt
python server.py


```bash
yay -S normcap --mflags "--nocheck"
```
### Starting Vim with Inkscape
```
vim .tex
inkf
inksm
```
### Using 7-Zip
```
7zz a -tzip -m0=Copy -ppassword -mem=AES256 path.zip path
7zz x path.zip
```
### Installing VBox Linux Additions
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
### Configuring Picom
```
sudo vim /etc/xdg/picom.conf
```
### Installing and Configuring Desktop Environment
```
sudo pacman -S xorg xorg-xinit bspwm sxhkd dmenu nitrogen xfce4-terminal
startx
```
.config/bspwm/bspwmrc
```
Add `bspc monitor MONITOR -d DESKTOPS` where `MONITOR` is monitor name from `xrandr` and `DESKTOPS` is desktop names from `I` to `X` and remove specified desktop names from `bspc monitor -d DESKTOPS` to put some work spaces on another monitor
Add `bspc rule -a NAME desktop='^DESKTOP'` where `NAME` is `VM_CLASS(STRING)` from `xprop` starting with capital letter and `DESKTOP` is desktop name from `0` to `9` (Example: `bspc rule -a Microsoft-edge desktop='^4'`)
```
### Setting Wallpapers
`Super + Space` > `nitrogen`
`Preferences` > `Add` > Locate `~/dotfiles` > `Select` > `OK`
Replace `Automatic` with `Scaled`
`Apply`
### Configuring Xfce4 Terminal
`Edit` > `Preferences` 
`General` > Scrollbar is: `Disabled`
`Appearance` > Replace `Monospace Regular 12` with `NotoMono Nerd Font Mono Regular 20` > `Select`
`Appearance` > `Background` > `Transparent Background`
`Appearance` > `Background` > `Opacity` > `0.60`
`Appearance` > `Display menubar in new windows` > `Off`
`Close`
### Installing Ly
```
sudo systemctl disable getty@tty2.service
sudo systemctl disable gdm3.service
sudo systemctl enable ly.service
sudo reboot
```
```
sudo systemctl disable ly.service
sudo systemctl start gdm3.service
sudo reboot
```
### Fixing Screen Tearing
```
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
```
```
sudo nvidia-xconfig
sudo mv /etc/X11/xorg.conf /etc/X11/xorg.conf.d/20-nvidia.conf
sudo vim /etc/X11/xorg.conf.d/20-nvidia.conf
```
### Installing Better Lock Screen
```
betterlockscreen -u ~/dotfiles/wallpaper.png --blur 1.0
vim .config/sxhkd/sxhkdrc
```
Add
```
# lockscreen
super + x
	betterlockscreen -l dimblur
```
### Configuring Arandr
```
arandr
```
`Outputs` > `Display` > `Resolution` > `1920x1080`
`✅`
`💾` > Name: `display` > `Save`
```
chmod +x .screenlayout/display.sh
```
### Installing Powerline
Add to .bashrc
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
./usr/share/powerline/bindings/bash/powerline.sh
```
### Installing Polybar
```
sudo pacman -S ttf-font-awesome
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
### Installing No Client Side Decoration
```
yay -S gtk3-nocsd-git
```
### Installing Gnome Polkit
```
sudo pacman -S polkit-gnome
vim .xinitrc
```
### Installing Polybar Themes
```
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
```