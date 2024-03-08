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
### Installing Arch Linux
```
archinstall --config /path/to/user_configuration.json
exit
reboot
```
### Adding Google Drive
WEBKIT_DISABLE_COMPOSITING_MODE=1 gnome-control-center online-accounts
`Google`
If 2FA enabled: `Right Click` > `Reload`
### Installing Git
```
sudo pacman -S git
```
### Installing Yay to use AUR repository
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
yay -S visual-studio-code-bin
```
### Installing Stow
```
sudo pacman -S stow
```
### Installing Wget
```
sudo pacman -S wget
```
### Installing Unzip
```
sudo pacman -S unzip
```
### Installing Neofetch
```
sudo pacman -S neofetch
```
### Installing OS Prober
```
sudo pacman -S os-prober
```
### Installing Pip
```
sudo pacman -S python-pip
```
### Installing Pillow
```
sudo pacman -S python-pillow
```
### Installing Telegram
```
sudo pacman -S telegram-desktop
```
If you encounter an empty screen upon launching, try executing the program from the terminal. This method helps to disable OpenGL if you are experiencing issues with it.
```
telegram-desktop
```
### Installing Obsidian
```
sudo pacman -S obsidian
```
### Installing Wal
```
sudo pacman -S python-pywal
wal --theme base16-rebecca
```
### Installing Cmake
```
sudo pacman -S cmake
```
### Installing Curl
```
sudo pacman -S curl
```
### Installing FFMPEG
```
sudo pacman -S ffmpeg
```
### Installing Go
```
sudo pacman -S go
```
### Installing Rust
```
sudo pacman -S rust
```
### Installing Vim
```
sudo pacman -S vim
```
### Installing Zathura
```
sudo pacman -S zathura
```
### Installing Unpaper
```
sudo pacman -S unpaper
```
### Installing Ghostscript
```
sudo pacman -S ghostscript
```
### Installing Kitty
```
sudo pacman -S kitty
```
### Installing Grub Customizer
```
sudo pacman -S grub-customizer
```
### Installing Czkawka
```
yay -S czkawka-gui
```
### Installing Conky
```
sudo pacman -S conky
```
### Installing Nautilus
```
sudo pacman -S nautilus
```
### Installing Tesseract
```
sudo pacman -S tesseract-data-eng
sudo pacman -S tesseract-data-fra
sudo pacman -S tesseract-data-rus
sudo pacman -S tesseract-data-ukr
sudo pacman -S tesseract-data-jpn
sudo pacman -S tesseract-data-jpn_vert
sudo pacman -S tesseract
```
### Debloating Gnome
```
sudo pacman -Rsnc epiphany
sudo pacman -Rsnc evince
sudo pacman -Rsnc gnome-calculator
sudo pacman -Rsnc gnome-calendar
sudo pacman -Rsnc gnome-clocks
sudo pacman -Rsnc gnome-connections
sudo pacman -Rsnc gnome-contacts
sudo pacman -Rsnc gnome-logs
sudo pacman -Rsnc gnome-maps
sudo pacman -Rsnc gnome-music
sudo pacman -Rsnc gnome-tour
sudo pacman -Rsnc gnome-weather
sudo pacman -Rsnc orca
sudo pacman -Rsnc rygel
sudo pacman -Rsnc simple-scan
sudo pacman -Rsnc snapshot
sudo pacman -Rsnc totem
sudo pacman -Rsnc yelp
```
### Installing Extension Manager
```
flatpak install com.mattjakeman.ExtensionManager
```
### Installing Rofi
```
sudo pacman -S rofi
```
### Installing Zsh
```
sudo pacman -S zsh
```

# TODO

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
### Installing Picom
```
sudo pacman -S picom
sudo vim /etc/xdg/picom.conf
```
### TODO: Installing and Configuring Desktop Environment
```
sudo pacman -S xorg xorg-xinit bspwm sxhkd dmenu nitrogen xfce4-terminal
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
Add `bspc monitor MONITOR -d DESKTOPS` where `MONITOR` is monitor name from `xrandr` and `DESKTOPS` is desktop names from `I` to `X` and remove specified desktop names from `bspc monitor -d DESKTOPS` to put some work spaces on another monitor
Add `bspc rule -a NAME desktop='^DESKTOP'` where `NAME` is `VM_CLASS(STRING)` from `xprop` starting with capital letter and `DESKTOP` is desktop name from `0` to `9` (Example: `bspc rule -a Microsoft-edge desktop='^4'`)

```
git config --global user.email email
git config --global user.name name
```
### TODO: Setting Wallpapers
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
sudo pacman -S ly
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
### Installing Pipx
```
sudo pacman -S python-pipx
```
### Installing No Client Side Decoration
```
yay -S gtk3-nocsd-git
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
### Installing Polybar Themes
```
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh
```