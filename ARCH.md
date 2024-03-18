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
### Installing Yay to use AUR repository
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
```
### Pacman Installing Everything
```
sudo pacman -S aircrack-ng alsa-utils arandr asymptote bspwm cmake conky cuda cuda-tools curl ffmpeg ghidra ghostscript git git-lfs gnome-screenshot go gparted grub-customizer hashcat hashcat-utils httrack inkscape jdk-openjdk john kitty kiwix-desktop libjxl libreoffice-still libreoffice-still-fr libreoffice-still-ru libreoffice-still-uk ly mpc mpd mpv nautilus ncmpcpp neofetch net-tools nitrogen noto-fonts noto-fonts-cjk noto-fonts-emoji ntfs-3g nvidia-settings obs-studio obsidian ollama os-prober pacman-contrib pavucontrol pdf2svg picom pinta polybar powerline python-pillow python-pip python-pipx python-pywal qbittorrent rclone rofi rust rxvt-unicode solaar stow sxhkd telegram-desktop tesseract tesseract-data-eng tesseract-data-fra tesseract-data-jpn tesseract-data-jpn_vert tesseract-data-rus tesseract-data-ukr thunderbird tree unpaper unzip vim virtualbox virtualbox-guest-iso virtualbox-host-dkms wget xclip yt-dlp zathura zathura-pdf-mupdf zig zsh
```
### Yay Installing Everything
```
yay -S betterlockscreen czkawka-gui-bin microsoft-edge-stable-bin oculante peazip-qt-bin rclone-browser visual-studio-code-bin xdman-beta-bin xwinwrap-0.9-bin yandex-browser
```
### Flatpak Installing Everything
```
flatpak install com.github.dynobo.normcap com.mattjakeman.ExtensionManager
```
### Adding Google Drive
```
WEBKIT_DISABLE_COMPOSITING_MODE=1 gnome-control-center online-accounts
```

`Google`

If 2FA enabled: `Right Click` > `Reload`
### Applying Wal
```
wal --theme base16-rebecca
```
### Configuring Git
```
git config --global user.email email
git config --global user.name name
```
### Configuring Rclone
```
rclone config
```
### Debloating Gnome
```
sudo pacman -Rsnc epiphany
sudo pacman -Rsnc evince
sudo pacman -Rsnc gnome-calculator
sudo pacman -Rsnc gnome-calendar
sudo pacman -Rsnc gnome-clocks
sudo pacman -Rsnc gnome-connections
sudo pacman -Rsnc gnome-console
sudo pacman -Rsnc gnome-contacts
sudo pacman -Rsnc gnome-logs
sudo pacman -Rsnc gnome-maps
sudo pacman -Rsnc gnome-music
sudo pacman -Rsnc gnome-software
sudo pacman -Rsnc gnome-tour
sudo pacman -Rsnc gnome-weather
sudo pacman -Rsnc loupe
sudo pacman -Rsnc orca
sudo pacman -Rsnc rygel
sudo pacman -Rsnc simple-scan
sudo pacman -Rsnc snapshot
sudo pacman -Rsnc totem
sudo pacman -Rsnc yelp
```
### Fixing Telegram
If you encounter an empty screen upon launching, try executing the program from the terminal. This method helps to disable OpenGL if you are experiencing issues with it.
```
telegram-desktop
```
### System Update and Cache Cleaning
```
sudo pacman -Syu
sudo pacman -Rsnc $(pacman -Qtdq)
sudo pacman -Sc
sudo pacman -Scc
sudo paccache -ruk0
yay -Sc
flatpak uninstall --unused
pip cache purge
conda clean -a
sudo journalctl --vacuum-time=1h
```
