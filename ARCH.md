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
`New` > Partition size: `2097152S`

`Type` > `EFI System`

`New` > Partition size: `838860800S`

`Type` > `Linux filesystem`

`New` > Partition size: `3907017543S` (The sector, or block size, is 512 bytes)

`Type` > `Microsoft basic data`

`Write` > Are you sure you want to write the partition table to disk? `yes`

`Quit`
```
lsblk
mkfs.fat -F32 partition
mkfs.ext4 partition
mkfs.ntfs -Q partition
mkdir /mnt/boot
mkdir /mnt/home
mount partition /mnt
mount partition /mnt/boot
mount partition /mnt/home
```
### Installing Arch Linux
```
archinstall --config /path/to/user_configuration.json --creds /path/to/user_credentials.json
exit
reboot
```
### Changing Root
```
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/nvme0n1p4 /mnt
arch-chroot /mnt
```
### Installing GRUB
```
pacman -Sy grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
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
sudo pacman -S aircrack-ng alsa-utils arandr arch-install-scripts asymptote audacity blender bspwm cmake conky cuda cuda-tools cups curl discord docker emacs eog ffmpeg firefox ghidra ghostscript git git-lfs github-cli gnome-screenshot go gparted grub-customizer gsfonts hashcat hashcat-utils hplip httrack inkscape jdk-openjdk john kitty kiwix-desktop libgda6 libjxl libreoffice-still libreoffice-still-fr libreoffice-still-ru libreoffice-still-uk linux linux-lts ly mokutil mpc mpd mpv nautilus ncmpcpp neofetch net-tools nitrogen noto-fonts noto-fonts-cjk noto-fonts-emoji ntfs-3g nvidia nvidia-lts nvidia-settings nvidia-utils obs-studio obsidian oculante ollama-cuda opam os-prober pacman-contrib patchelf pavucontrol pdf2svg perl-file-mimeinfo picom pinta polybar power-profiles-daemon powerline python-pillow python-pip python-pipx python-pywal qbittorrent rclone reflector rofi rsync rust rxvt-unicode solaar speedtest-cli sqlite3 sqlitebrowser stow sxhkd system-config-printer telegram-desktop tesseract tesseract-data-eng tesseract-data-fra tesseract-data-jpn tesseract-data-jpn_vert tesseract-data-rus tesseract-data-ukr thunderbird time tk tmux torbrowser-launcher tree unpaper unzip veracrypt vim virtualbox virtualbox-guest-iso virtualbox-host-dkms wget xclip xorg-xkill yt-dlp zathura zathura-pdf-mupdf zig zsh
```
### Yay Installing Everything
```
yay -S activitywatch-bin anydesk-bin bambustudio-bin betterlockscreen cyberghostvpn czkawka-gui-bin egpu-switcher microsoft-edge-stable-bin mkinitcpio-firmware normcap nvidia-container-toolkit parsec-bin peazip qview rclone-browser visual-studio-code-bin wrk xdman-beta-bin xwinwrap-0.9-bin yandex-browser
```
### Flatpak Installing Everything
```
flatpak install com.mattjakeman.ExtensionManager
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
### Configuring Opam
```
opam init
opam env --switch=default
```
### Configuring Rclone
```
rclone config
```
### Creating Swap
```
sudo dd if=/dev/zero of=/swap bs=1M count=16k status=progress
sudo chmod 0600 /swap
sudo mkswap -U clear /swap
sudo swapon /swap
free -h
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
### Fixing Bluetooth
```
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```
### Fixing Docker
```
sudo systemctl enable docker
sudo systemctl start docker
```
### Fixing Default Apps
```
xdg-mime default code.desktop application/toml
xdg-mime default code.desktop application/x-ipynb+json
xdg-mime default code.desktop text/css
xdg-mime default code.desktop text/javascript
xdg-mime default code.desktop text/markdown
xdg-mime default code.desktop text/rust
xdg-mime default code.desktop text/x-c++src
xdg-mime default code.desktop text/x-csrc
xdg-mime default code.desktop text/x-go
xdg-mime default code.desktop text/x-python
xdg-mime default code.desktop text/x-tex
xdg-mime default com.interversehq.qView.desktop image/gif
xdg-mime default com.interversehq.qView.desktop image/heif
xdg-mime default com.interversehq.qView.desktop image/jpeg
xdg-mime default com.interversehq.qView.desktop image/png
xdg-mime default com.interversehq.qView.desktop image/svg+xml
xdg-mime default com.interversehq.qView.desktop image/tiff
xdg-mime default com.interversehq.qView.desktop image/vnd.adobe.photoshop
xdg-mime default com.interversehq.qView.desktop image/webp
xdg-mime default libreoffice-calc.desktop application/vnd.ms-excel.sheet.macroEnabled.12
xdg-mime default libreoffice-calc.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
xdg-mime default libreoffice-impress.desktop application/vnd.ms-powerpoint
xdg-mime default libreoffice-impress.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation
xdg-mime default libreoffice-writer.desktop application/msword
xdg-mime default libreoffice-writer.desktop application/vnd.oasis.opendocument.text
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document
xdg-mime default microsoft-edge.desktop application/pdf
xdg-mime default microsoft-edge.desktop text/html
xdg-mime default mpv.desktop audio/aac
xdg-mime default mpv.desktop audio/flac
xdg-mime default mpv.desktop audio/ogg
xdg-mime default mpv.desktop audio/vnd.wave
xdg-mime default mpv.desktop video/mp2t
xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/vnd.avi
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-ms-wmv
xdg-mime default org.gnome.TextEditor.desktop application/json
xdg-mime default org.gnome.TextEditor.desktop application/yaml
xdg-mime default org.gnome.TextEditor.desktop text/csv
xdg-mime default org.gnome.TextEditor.desktop text/plain
xdg-mime default org.gnome.TextEditor.desktop text/tab-separated-values
xdg-mime default org.mozilla.Thunderbird.desktop text/vcard
xdg-mime default peazip.desktop application/gzip
xdg-mime default peazip.desktop application/vnd.efi.iso
xdg-mime default peazip.desktop application/x-7z-compressed
xdg-mime default peazip.desktop application/x-tar
xdg-mime default peazip.desktop application/x-vdi-disk
xdg-mime default peazip.desktop application/x-xz
xdg-mime default peazip.desktop application/zip
```
### Fixing Printer
```
sudo systemctl enable cups.service
sudo systemctl start cups.service
system-config-printer
```
Unblock > Add > Network Printer > Internet Printing Protocol > ipp://address/ipp > Forward > Brand > Model > Forward > Apply
### Fixing Telegram
If you encounter an empty screen upon launching, try executing the program from the terminal. This method helps to disable OpenGL if you are experiencing issues with it.
```
telegram-desktop
```
### Fixing Time
```
timedatectl set-local-rtc 1
```
### Moving Home Partition
```
https://help.ubuntu.com/community/Partitioning/Home/Moving
```
### Opam Installing Everything
```
opam install merlin tuareg user-setup
```
### Remove Arch Linux Logo
```
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo ''
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
sudo journalctl --vacuum-time=1s
```
