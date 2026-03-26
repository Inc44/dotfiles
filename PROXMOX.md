### Proxmox Installation
Download [Proxmox VE 9.1 ISO Installer](https://enterprise.proxmox.com/iso/proxmox-ve_9.1-1.iso)

Copy to Ventoy USB and boot
#### End User License Agreement (EULA)
`I agree`
#### Proxmox Virtual Environment (PVE)
Target Harddisk `/dev/sda (your_disk)`

`Next`
#### Location and Time Zone selection
Country `France`

Time Zone `Europe/Paris`

Keyboard Layout `U.S. English`

`Next`
#### Administration Password and Email Address
Password `your_password`

Confirm `your_password`

Email `your_email`

`Next`
#### Management Network Configuration
Management Interface `nic0 - XX:XX:XX:XX:XX:XX (your_interface)`

Hostname (FQDN) `pve.yourdomain`

IP Address (CIDR) `192.168.100.2`/`24`

Gateway `192.168.100.1`

DNS Server `127.0.0.1`

[x] Pin network interface names

`Next`
#### Summary
[ ] Automatically reboot after successful installation

`Install`

pve login: `root`

Password: `your_password`
### Connecting USB Tethering
Connect Android phone via USB and `Use USB for` > `USB Tethering`
```bash
ip a
```
Find `enxXXXXXXXXXXXX` interface name
```bash
nano /etc/network/interfaces
```
Comment out
```bash
# auto vmbr0
# iface vmbr0 inet static
# 	address 192.168.100.2/24
# 	gateway 192.168.100.1
# 	bridge-ports nic0
# 	bridge-stp off
# 	bridge-fd 0
```
Add
```bash
auto enxXXXXXXXXXXXX
iface enxXXXXXXXXXXXX inet dhcp
```
```bash
systemctl restart networking
```
### Installing iwlwifi Driver for Intel Wi-Fi 7 Support
```bash
wget http://ftp.debian.org/debian/pool/non-free-firmware/f/firmware-nonfree/firmware-iwlwifi_20251111-1_all.deb
dpkg -x firmware-iwlwifi_20251111-1_all.deb firmware-iwlwifi
cp -r firmware-iwlwifi/usr/lib/firmware/* /lib/firmware
update-initramfs -k all -u
reboot
```
### Connecting Wi-Fi
```bash
apt update
apt install iwd
systemctl enable iwd
systemctl start iwd
```
[Connecting Wi-Fi](ARCH.md)
```bash
ip a
```
Find `wlan0` interface name
```bash
nano /etc/network/interfaces
```
Comment out
```bash
# auto enxXXXXXXXXXXXX
# iface enxXXXXXXXXXXXX inet dhcp
```
Add
```bash
auto wlan0
iface wlan0 inet dhcp
```
```bash
systemctl restart networking
ip a
```
Find `wlan0`'s IP
```bash
reboot
```
Open [https://your_ip:8006](https://your_ip:8006)
### Login
User name: `root`

Password: `your_password`

Realm: `Linux PAM standard authentication`

Language: `English - English`

Click `Login`

Click `pve`

Click `Shell`
### Bypassing No Valid Subscription Warning
```bash
sed -i 's/!== \x27active\x27/== \x27Random Bullshit Go!!!!\x27/g' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
systemctl restart pveproxy
```
### Configuring ZFS
```bash
# The sector is 2^12 = 4K bytes
zpool create \
-o ashift=12 \
-O atime=off \
-O compression=off \
-O dedup=off \
-O encryption=aes-256-gcm \
-O keyformat=passphrase \
-O sync=standard \
-O xattr=sa \
fastest nvme0n1
pvesm add zfspool fastest --content images,rootdir --pool fastest --sparse 1
zfs create -s -V 2G fastest/vm-101-disk-0
zfs create -s -V 2T fastest/vm-101-disk-1
zfs create -s -V 2T fastest/vm-101-disk-2
```
### Configuring Bridge
```bash
nano /etc/network/interfaces
```
Add
```bash
auto vmbr0
iface vmbr0 inet static
	address 10.10.10.1/24
	bridge-ports none
	bridge-stp off
	bridge-fd 0
	post-up echo 1 > /proc/sys/net/ipv4/ip_forward
	post-up iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o wlan0 -j MASQUERADE
	post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o wlan0 -j MASQUERADE
	post-up iptables -t nat -A PREROUTING -i wlan0 -p tcp -m multiport --dports 47984,47989,47990,48010 -j DNAT --to-destination 10.10.10.101
	post-up iptables -t nat -A PREROUTING -i wlan0 -p udp -m multiport --dports 47998,47999,48000,48002,48010 -j DNAT --to-destination 10.10.10.101
	post-up iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 12321 -j DNAT --to-destination 10.10.10.200
	post-up iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 445 -j DNAT --to-destination 10.10.10.200
```
```bash
systemctl restart networking
```
### Installing dnsmasq
```bash
apt install dnsmasq
```
### Configuring dnsmasq
```bash
nano /etc/dnsmasq.conf
```
Add
```bash
interface=vmbr0
bind-interfaces
dhcp-range=10.10.10.64,10.10.10.192,12h
dhcp-host=BC:24:11:01:00:00,10.10.10.100,Windows
dhcp-host=BC:24:11:01:00:01,10.10.10.101,ArchLinuxLaptop
dhcp-host=BC:24:11:01:00:02,10.10.10.102,WindowsLaptop
dhcp-option=3,10.10.10.1
dhcp-option=6,1.1.1.1,8.8.8.8
```
```bash
systemctl restart dnsmasq
```
### Creating Windows VM
Click `Create VM`

Turn on `Advanced`
#### General
Name: `Windows`

Click `Next`
#### OS
Turn on `Do not use any media`

Type: `Microsoft Windows`

Turn on `Add additional drive for VirtIO drivers`

ISO image: `virtio-win-0.1.271.iso`

Click `Next`
#### System
Graphic card: `VirtIO-GPU`

EFI Storage: `local-lvm`

Turn off `Pre-Enroll keys`

Turn off `Add TPM`

Click `Next`
#### Disks
Bus/Device: `VirtIO Block`

Disk size (GiB): `100`

Turn on `Discard`

Click `Add`

Disk size (GiB): `100`

Turn on `Discard`

Click `Next`
#### CPU
Cores: `20`

Type: `host`

Click `Next`
#### Memory
Memory (MiB): `81920`

Click `Next`
#### Network
MAC Address: `BC:24:11:01:00:00`

Turn on `Disconnect`

Click `Next`
#### Confirm
Click `Finish`

Select `100 (Windows)`

Select `Hardware`

Click `Add`

Select `USB Device`

Turn on `Use USB Port`

Choose Port: `Flash Drive`

Click `Add`

Select `Options`

Double click on `Boot Order`

Turn off `Enabled` for `ide2`

Turn on `Enabled` for `usb0`

Move `usb0` above all

Click `Ok`

Select `Console`

Click `Start Now`

Follow [Installing from Rufus USB](WINDOWS_RUFUS.md)

Follow [Configuring Initial Privacy](WINDOWS.md)

Follow [Installing VirtIO Drivers](WINDOWS.md)

Click `Shutdown`

Select `Hardware`

Click `Add`

Select `PCI Device`

Turn on `Raw Device`

Device: `0000:02:00.0` <!--AD106 [GeForce RTX 4060 Ti 16GB]-->

Turn on `All Functions`

Turn on `PCI-Express`

Click `Add`

Select `Console`

Click `Start Now`

Follow [Configuring Initial Password](WINDOWS.md)

Follow [Installing NVIDIA Drivers](WINDOWS.md)
### Creating Arch Linux VM from Laptop
Click `Create VM`
#### General
Name: `ArchLinuxLaptop`

Click `Next`
#### OS
Turn on `Do not use any media`

Type: `Linux`

Click `Next`
#### System
Graphic card: `VirtIO-GPU`

BIOS: `OVMF (UEFI)`

EFI Storage: `fastest`

Turn off `Pre-Enroll keys`

Click `Next`
#### Disks
Bus/Device: `VirtIO Block`

Storage: `fastest`

Disk size (GiB): `2`

Turn on `Discard`

Click `Add`

Disk size (GiB): `2000`

Turn on `Discard`

Click `Add`

Disk size (GiB): `2000`

Turn on `Discard`

Click `Next`
#### CPU
Cores: `20`

Type: `host`

Click `Next`
#### Memory
Memory (MiB): `81920`

Click `Next`
#### Network
MAC Address: `BC:24:11:01:00:01`

Click `Next`
#### Confirm
Click `Finish`

Select `101 (ArchLinuxLaptop)`

Select `Hardware`

Click `Add`

Select `USB Device`

Turn on `Use USB Port`

Choose Port: `Flash Drive`

Click `Add`

Select `Options`

Double click on `Boot Order`

Turn off `Enabled` for `ide2`

Turn on `Enabled` for `usb0`

Move `usb0` above all

Click `Ok`

Select `Hardware`

Click `Add`

Select `PCI Device`

Turn on `Raw Device`

Device: `0000:02:00.0` <!--AD106 [GeForce RTX 4060 Ti 16GB]-->

Turn on `All Functions`

Click `Add`

Select `Console`

Click `Start Now`
### Creating Windows VM from Laptop
Click `Create VM`

Turn on `Advanced`
#### General
Name: `WindowsLaptop`

Click `Next`
#### OS
Turn on `Do not use any media`

Type: `Microsoft Windows`

Turn on `Add additional drive for VirtIO drivers`

ISO image: `virtio-win-0.1.271.iso`

Click `Next`
#### System
Graphic card: `VirtIO-GPU`

EFI Storage: `fastest`

Turn off `Pre-Enroll keys`

Turn off `Add TPM`

Click `Next`
#### Disks
Bus/Device: `VirtIO Block`

Storage: `fastest`

Disk size (GiB): `2`

Turn on `Discard`

Click `Add`

Disk size (GiB): `2000`

Turn on `Discard`

Click `Add`

Disk size (GiB): `2000`

Turn on `Discard`

Click `Next`
#### CPU
Cores: `20`

Type: `host`

Click `Next`
#### Memory
Memory (MiB): `81920`

Click `Next`
#### Network
MAC Address: `BC:24:11:01:00:02`

Click `Next`
#### Confirm
Click `Finish`

Select `102 (WindowsLaptop)`

Select `Hardware`

Click `Add`

Select `USB Device`

Turn on `Use USB Port`

Choose Port: `Flash Drive`

Click `Add`

Select `Options`

Double click on `Boot Order`

Turn off `Enabled` for `ide2`

Turn on `Enabled` for `usb0`

Move `usb0` above all

Click `Ok`

Select `Hardware`

Click `Add`

Select `PCI Device`

Turn on `Raw Device`

Device: `0000:02:00.0` <!--AD106 [GeForce RTX 4060 Ti 16GB]-->

Turn on `All Functions`

Turn on `PCI-Express`

Click `Add`

Select `Console`

Click `Start Now`
### Configuring Boot Menu
```bash
nano /etc/pve/qemu-server/100.conf
nano /etc/pve/qemu-server/101.conf
nano /etc/pve/qemu-server/102.conf
```
Insert
```bash
args: -boot menu=off
```
### Download TurnKey File Server Template
```bash
pveam update
```
Select `local (pve)`

Select `CT Templates`

Click `Templates`

Search `fileserver`

Select `lxc`

Click `Download`
### Creating TurnKey File Server LXC Container
Click `Create CT`
#### General
CT ID: `200`

Hostname: `fileserver`

Password: `your_password`

Confirm password: `your_password`

Click `Next`
#### Template
Template: `debian-12-turnkey-fileserver_.*_amd64.tar.gz`

Click `Next`
#### Disks
Disk size (GiB): `4`

Click `Add`

Select `mp0`

Disk size (GiB): `400`

Path: `/mnt/shared`

Click `Next`
#### CPU
Cores: `20`

Click `Next`
#### Memory
Memory (MiB): `4096`

Swap (MiB): `0`

Click `Next`
#### Network
MAC address: `BC:24:11:02:00:00`

IPv4/CIDR: `10.10.10.200/24`

Gateway (IPv4): `10.10.10.1`

Click `Next`
#### DNS
Click `Next`
#### Confirm
Click `Finish`

Select `200 (fileserver)`

Select `Console`

Click `Start Now`

fileserver login: `root`

Password: `your_password`

Type `your_password`

Press Enter

Type `your_password`

Press Enter

Double tab to select `Skip`

Press Enter

Double tab to select `Skip`

Triple press Enter

Open [https://your_ip:12321](https://your_ip:12321)

Select `Servers`

Select `Samba Windows File Sharing`

Click `Select all`

Click `Delete Selected Shares`

Click `Create a new file share`

Share name `shared`

Directory to share `/mnt/shared`

Click `Create`

Click `shared`

Click `Security and Access Control`

Writable? `Yes`

Click `Save`

Click `Return to share list`

Click `Restart Samba Servers`

Sources:
- [problem in passthroughing USB tethering to VM](https://forum.proxmox.com/threads/problem-in-passthroughing-usb-tethering-to-vm.132902)
- [How to update iwlwifi firmware without uninstalling proxmox](https://forum.proxmox.com/threads/how-to-update-iwlwifi-firmware-without-uninstalling-proxmox.133385)
- [The ultimate gaming virtual machine on proxmox](https://youtu.be/iWwdf66JpxE)
- [Proxmox - Boot from USB Device](https://youtu.be/ow9mShfIo4Y)
- [Does ZFS Kill SSDs? Testing Write amplification in Proxmox](https://youtu.be/V7V3kmJDHTA)
- [Auto Boot Timeout](https://forum.proxmox.com/threads/auto-boot-timeout.80880)
- [Syntax of "args" in <vmid>.conf](https://forum.proxmox.com/threads/syntax-of-args-in-vmid-conf.91439)
- [How to setup Turnkey Linux Fileserver on Proxmox VE](https://youtu.be/UnXxJMjW4LE)