### Connecting Wi-Fi
```bash
iwctl
device list
station adapter scan
station adapter get-networks
station adapter connect "network"
station adapter show
quit
```
### Partitioning Disk
```bash
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
```bash
lsblk
mkfs.fat -F32 partition
mkfs.ext4 partition
mkfs.ntfs -Q partition
mount partition /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount partition /mnt/boot
mount partition /mnt/home
```
### Installing Arch Linux
```bash
archinstall --config /path/to/user_configuration.json --creds /path/to/user_credentials.json
exit
reboot
```
### Changing Root
```bash
mount /dev/nvme0n1p4 /mnt
mount /dev/nvme0n1p1 /mnt/boot
arch-chroot /mnt
```
### Installing GRUB
```bash
pacman -Sy grub efibootmgr dosfstools mtools
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit
reboot
```
### Installing Yay to use AUR repository
```bash
sudo pacman -Sy git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -r yay
```
### Configuring Pacman
```bash
sudo nano /etc/pacman.conf
```
Uncomment
```bash
[multilib]
Include = /etc/pacman.d/mirrorlist
```
Append
```bash
[lizardbyte]
SigLevel = Optional
Server = https://github.com/LizardByte/pacman-repo/releases/latest/download
```
```bash
sudo pacman -Sy
```
### Pacman Installing Everything
```bash
sudo pacman -S aircrack-ng alsa-utils arandr arch-install-scripts asymptote audacity blender bspwm clinfo cmake composer conky cuda cups curl discord dkms docker emacs eog extension-manager ffmpeg firefox ghidra ghostscript git-lfs github-cli gnome-screenshot go gparted gsfonts hashcat hashcat-utils hplip httrack inkscape intel-compute-runtime jdk-openjdk john kitty kiwix-desktop lib32-nvidia-utils libgda6 libjxl libreoffice-still libreoffice-still-fr libreoffice-still-ru libreoffice-still-uk linux linux-lts lua-socket luarocks ly mariadb mokutil mono mpc mpd mpv nautilus ncmpcpp net-tools nodejs noto-fonts noto-fonts-cjk noto-fonts-emoji ntfs-3g nvidia-open-dkms nvidia-settings nvidia-utils nvtop obs-studio obsidian oculante ollama-cuda opam opencl-headers os-prober pacman-contrib patchelf pavucontrol pdf2svg perl-file-mimeinfo php php-apache phpmyadmin picom polybar power-profiles-daemon powerline python-pillow python-pip python-pipx python-pywal qbittorrent rclone reflector rofi rsync rust rxvt-unicode solaar speedtest-cli sqlite3 sqlitebrowser steam stow sunshine sxhkd system-config-printer telegram-desktop tesseract tesseract-data-eng tesseract-data-fra tesseract-data-jpn tesseract-data-jpn_vert tesseract-data-rus tesseract-data-ukr the_silver_searcher thunderbird time tk tmux torbrowser-launcher tree unpaper unzip veracrypt vim virtualbox virtualbox-guest-iso virtualbox-host-dkms wget xclip xorg-xkill yt-dlp zathura zathura-pdf-mupdf zig zsh
```
### Yay Installing Everything
```bash
yay -S activitywatch-bin anydesk-bin bambustudio-appimage betterlockscreen cyberghostvpn czkawka-gui-bin egpu-switcher grub-customizer microsoft-edge-stable-bin mkinitcpio-firmware neofetch nitrogen normcap nvidia-container-toolkit parsec-bin peazip pinta qview rclone-browser visual-studio-code-bin wrk xdman-beta-bin xwinwrap-0.9-bin yandex-browser
```
### Debloating Gnome
```bash
sudo pacman -Rsnc decibels epiphany evince gnome-calculator gnome-calendar gnome-clocks gnome-connections gnome-console gnome-contacts gnome-logs gnome-maps gnome-music gnome-software gnome-tour gnome-weather loupe orca papers rygel showtime simple-scan snapshot yelp
```
### Adding Google Drive
```bash
WEBKIT_DISABLE_COMPOSITING_MODE=1 gnome-control-center online-accounts
```

`Google`

If 2FA enabled: `Right Click` > `Reload`
### Applying Wal
```bash
wal --theme base16-rebecca
```
### Configuring MariaDB
```bash
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl stop mariadb
sudo mariadbd-safe --skip-grant-tables --skip-networking &
```
Open another terminal
```bash
mariadb -u root
```
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'your_password';
FLUSH PRIVILEGES;
EXIT;
```
```bash
sudo kill $(pgrep mariadb)
sudo systemctl start mariadb
```
### Configuring PHP
```bash
sudo nano /etc/php/php.ini
```
Uncomment
```bash
extension=bz2
extension=iconv
extension=mysqli
extension=pdo_mysql
extension=pdo_sqlite
extension=sqlite3
```
### Configuring phpMyAdmin
```bash
sudo nano /etc/httpd/conf/extra/phpmyadmin.conf
```
Append
```bash
Alias /phpmyadmin "/usr/share/webapps/phpMyAdmin"
<Directory "/usr/share/webapps/phpMyAdmin">
	DirectoryIndex index.php
	AllowOverride All
	Options FollowSymlinks
	Require all granted
</Directory>
```
Open `localhost/phpmyadmin`

Select `Theme` > `Original`
### Configuring Apache
```bash
sudo nano /etc/httpd/conf/httpd.conf
```
Comment out
```bash
#LoadModule mpm_event_module modules/mod_mpm_event.so
```
Uncomment
```bash
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
```
Append
```bash
LoadModule php_module modules/libphp.so
AddHandler php-script .php
Include conf/extra/php_module.conf
Include conf/extra/phpmyadmin.conf
```
```bash
sudo systemctl restart httpd
```
### Configuring Git
```bash
git config --global --unset-all user.name
git config --global --unset-all user.email
git config --global user.name name
git config --global user.email email
```
### Configuring Opam
```bash
opam init
opam env --switch=default
```
### Configuring Rclone
```bash
rclone config
```
```bash
n/s/q> n
name> Google
Storage> 24
client_id>
client_secret>
scope> 1
service_account_file>
y/n>
y/n>
```
Type `your_email`

Click `Next`

Type `your_password`

Click `Next`

Click `Continue`
```bash
y/n>
y/e/d>
e/n/d/r/c/s/q> q
```
### Creating Swap
```bash
sudo dd if=/dev/zero of=/swap bs=1M count=16k status=progress
sudo chmod 0600 /swap
sudo mkswap -U clear /swap
sudo swapon /swap
free -h
```
Or
```bash
sudo mkswap /dev/nvme0n1p6
sudo swapon /dev/nvme0n1p6
```
### Fixing Bluetooth
```bash
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```
### Fixing Docker
```bash
sudo systemctl enable docker
sudo systemctl start docker
```
### Fixing Default Apps
```bash
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
```bash
sudo systemctl enable cups.service
sudo systemctl start cups.service
system-config-printer
```
Unblock > Add > Network Printer > Internet Printing Protocol > ipp://address/ipp > Forward > Brand > Model > Forward > Apply
### Fixing Sunshine
#### Cursor
```bash
sudo setcap cap_sys_admin+p $(readlink -f $(which sunshine))
sudo reboot
```
#### NVENC
```bash
sudo nano /etc/default/grub (`GRUB_CMDLINE_LINUX_DEFAULT="loglevel=0 quiet nvidia-drm.modeset=1"`)
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
#### Permissions
```bash
sudo usermod -aG video,render,input $USER
```
#### Reboot
```bash
systemctl --user edit sunshine
```
Insert
```bash
[Unit]
After=graphical-session.target

[Service]
ExecStartPre=

[Install]
WantedBy=
WantedBy=default.target
```
#### Service
```bash
systemctl --user enable sunshine
systemctl --user start sunshine
```
### Fixing Telegram
If you encounter an empty screen upon launching, try executing the program from the terminal. This method helps to disable OpenGL if you are experiencing issues with it.
```bash
telegram-desktop
```
### Fixing Time
```bash
timedatectl set-local-rtc 1
```
### Moving Home Partition
```bash
https://help.ubuntu.com/community/Partitioning/Home/Moving
```
### Opam Installing Everything
```bash
opam install merlin tuareg user-setup
```
### Remove Arch Linux Logo
```bash
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo ''
```
### System Update and Cache Cleaning
```bash
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

Sources:
- [Default systemd doesn't work after reboot, requires manually launch](https://github.com/LizardByte/Sunshine/issues/1533)
- [MariaDB](https://wiki.archlinux.org/title/MariaDB)
- [Reset MariaDB Password on Linux Guide](https://linuxconfig.org/how-to-change-mariadb-user-password)
- [phpMyAdmin](https://wiki.archlinux.org/title/PhpMyAdmin)
- [Apache HTTP Server](https://wiki.archlinux.org/title/Apache_HTTP_Server#PHP)
- [PHP](https://wiki.archlinux.org/title/PHP#MySQL/MariaDB)
- [NVIDIA](https://wiki.archlinux.org/title/NVIDIA)
- [Arch Linux's Main NVIDIA Driver Packages Now Using The Open Kernel Modules - Phoronix](https://www.phoronix.com/news/Arch-LInux-NVIDIA-Open-Default)
- [Official repositories](https://wiki.archlinux.org/title/Official_repositories)