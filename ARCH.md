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
### Changing Root (rescue)
```bash
mount /dev/nvme0n1p4 /mnt
mount /dev/nvme0n1p1 /mnt/boot
arch-chroot /mnt
```
### Installing GRUB (rescue)
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
sudo pacman -S aircrack-ng alsa-utils arandr arch-install-scripts asymptote audacity blender bspwm clinfo cmake composer conky cuda cups curl discord dkms docker emacs eog extension-manager ffmpeg firefox ghidra ghostscript git-lfs github-cli gnome-screenshot gnome-shell-extensions go gparted gsfonts hashcat hashcat-utils hplip httrack inkscape intel-compute-runtime jdk-openjdk john kitty kiwix-desktop lib32-nvidia-utils libgda6 libjxl libreoffice-still libreoffice-still-fr libreoffice-still-ru libreoffice-still-uk linux linux-lts lua-socket luarocks ly mariadb mokutil mono mpc mpd mpv nautilus ncmpcpp net-tools nodejs noto-fonts noto-fonts-cjk noto-fonts-emoji ntfs-3g nvidia-open-dkms nvidia-settings nvidia-utils nvtop obs-studio obsidian oculante ollama-cuda opam opencl-headers os-prober pacman-contrib patchelf pavucontrol pdf2svg perl-file-mimeinfo php php-apache phpmyadmin picom polybar power-profiles-daemon powerline python-pillow python-pip python-pipx python-pywal qbittorrent rclone reflector rofi rsync rust rxvt-unicode solaar speedtest-cli sqlite3 sqlitebrowser steam stow sunshine sxhkd system-config-printer telegram-desktop tesseract tesseract-data-eng tesseract-data-fra tesseract-data-jpn tesseract-data-jpn_vert tesseract-data-rus tesseract-data-ukr the_silver_searcher thunderbird time tk tmux torbrowser-launcher tree unpaper unzip veracrypt vim virtualbox virtualbox-guest-iso virtualbox-host-dkms wget xclip xorg-xkill yt-dlp zathura zathura-pdf-mupdf zig zsh
```
### Yay Installing Everything
```bash
yay -S activitywatch-bin anydesk-bin bambustudio-appimage betterlockscreen cyberghostvpn czkawka-gui-bin ect egpu-switcher grub-customizer microsoft-edge-stable-bin miniconda3 mkinitcpio-firmware neofetch nitrogen normcap nvidia-container-toolkit parsec-bin peazip pinta qview rclone-browser visual-studio-code-bin wrk xdman-beta-bin xwinwrap-0.9-bin yandex-browser
```
### Debloating Gnome
```bash
sudo pacman -Rsnc decibels epiphany evince gnome-calculator gnome-calendar gnome-clocks gnome-connections gnome-console gnome-contacts gnome-logs gnome-maps gnome-music gnome-software gnome-tour gnome-weather loupe orca papers rygel showtime simple-scan snapshot yelp
```
### Installing MariaDB
```bash
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```
### Fixing MariaDB
```bash
sudo systemctl enable mariadb
sudo systemctl start mariadb
```
#### Setting MariaDB Root Password
```bash
sudo mariadb -u root
```
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'your_password';
FLUSH PRIVILEGES;
EXIT;
```
#### Resetting MariaDB Root Password (rescue)
```bash
sudo systemctl stop mariadb
sudo mariadbd-safe --skip-grant-tables --skip-networking &
```
Open another terminal

Follow [Setting MariaDB Root Password](ARCH.md)
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
Follow [Configuring Apache](ARCH.md)

Follow [Configuring Microsoft Edge](EDGE.md)

Open `localhost/phpmyadmin`

Type `root`

Type `your_password`

Click `Log in`

Select `Original` for Theme`
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
### System Update and Cache Cleaning
```bash
sudo pacman -Syu
sudo pacman -Rsnc $(pacman -Qtdq)
sudo rm -rf /var/cache/pacman/pkg/download-*
sudo pacman -Sc
sudo pacman -Scc
sudo paccache -ruk0
yay -Sc
flatpak uninstall --unused
pip cache purge
conda clean -a
cargo cache -ak0 -r all
sudo journalctl --vacuum-time=1s
```
### Configuring Grub Customizer
Open `Grub Customizer`

Type `your_password`

Click `Authenticate`

Double click `Arch Linux, with Linux linux-lts`

Type `Arch Linux (LTS)`

Click Move up the selected entry or script icon

Click `Arch Linux, with Linux linux`

Click `Remove`

Double click `UEFI Firmware Settings`

Type `UEFI`

Press Enter

Click `Save`

Sources:
- [Official repositories](https://wiki.archlinux.org/title/Official_repositories)
- [Apps for GNOME](https://apps.gnome.org)
- [NVIDIA](https://wiki.archlinux.org/title/NVIDIA)
- [Arch Linux's Main NVIDIA Driver Packages Now Using The Open Kernel Modules - Phoronix](https://www.phoronix.com/news/Arch-LInux-NVIDIA-Open-Default)
- [MariaDB](https://wiki.archlinux.org/title/MariaDB)
- [Reset MariaDB Password on Linux Guide](https://linuxconfig.org/how-to-change-mariadb-user-password)
- [PHP](https://wiki.archlinux.org/title/PHP#MySQL/MariaDB)
- [phpMyAdmin](https://wiki.archlinux.org/title/PhpMyAdmin)
- [Cannot enter phpmyadmin as root (MySQL 5.7)](https://askubuntu.com/questions/763336/cannot-enter-phpmyadmin-as-root-mysql-5-7/763359)
- [Apache HTTP Server](https://wiki.archlinux.org/title/Apache_HTTP_Server#PHP)