### Starting Vim with Inkscape
```
vim .tex
inkf
inksm
```
### Initializing Git
```
git init -b main
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
### Installing Mpd
```
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
### Installing Polybar Themes
```
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
```