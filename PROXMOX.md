### Proxmox Installation
Download [Proxmox VE 9.1 ISO Installer](https://enterprise.proxmox.com/iso/proxmox-ve_9.1-1.iso)

Copy to Ventoy USB and boot in normal mode
#### End User License Agreement (EULA)
`I agree`
#### Proxmox Virtual Environment (PVE)
Target Harddisk `/dev/sda (your_disk)`

`Options`

hdsize `403.0` GB (1 GB boot, 16 GB swap, 64 GB root, 16 GB free, 66 GB LVM, 240 GB LVM-Thin)

swapsize `16` GB

maxroot `64` GB

minfree `16` GB

maxvz `66` GB (64 GB tdata, 1 GB tmeta, 1 GB pmspare)

`OK`

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

IP Address (CIDR) `192.168.31.254`/`24`

Gateway `192.168.31.1`

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
### Connecting Shared Network Bridge
```bash
nano /etc/network/interfaces
```
Modify
```bash
auto nic0
iface nic0 inet static
	address 192.168.137.254/24
	gateway 192.168.137.1
```
```bash
systemctl restart networking
```
### Installing iwlwifi Driver for Intel Wi-Fi 7 Support
```bash
wget http://ftp.debian.org/debian/pool/non-free-firmware/f/firmware-nonfree/firmware-iwlwifi_20260309-1_all.deb
dpkg -x firmware-iwlwifi_20260309-1_all.deb firmware-iwlwifi
cp -r firmware-iwlwifi/usr/lib/firmware/* /lib/firmware
update-initramfs -u -k all
reboot
```
### Using No-Subscription
```bash
mv /etc/apt/sources.list.d/pve-enterprise.sources /etc/apt/sources.list.d/pve-enterprise.sources.bak
mv /etc/apt/sources.list.d/ceph.sources /etc/apt/sources.list.d/ceph.sources.bak
echo "deb http://download.proxmox.com/debian/pve trixie pve-no-subscription" > /etc/apt/sources.list.d/pve-no-subscription.list
echo "deb http://download.proxmox.com/debian/ceph-squid trixie no-subscription" > /etc/apt/sources.list.d/ceph-no-subscription.list
```
### System Update
```bash
apt update
apt upgrade
```
### Connecting Wi-Fi
```bash
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
### Configuring Network Bonding
```bash
nano /etc/network/interfaces
```
Comment out
```bash
# auto nic0
# iface nic0 inet static
# 	address 192.168.137.254/24
# 	gateway 192.168.137.1

# auto wlan0
# iface wlan0 inet dhcp
```
Add
```bash
iface nic0 inet manual

iface wlan0 inet manual

auto bond0
iface bond0 inet static
	address 192.168.31.254/24
	gateway 192.168.31.1
	bond-slaves nic0 wlan0
	bond-mode active-backup
	bond-miimon 100
	bond-primary nic0
	post-up ip addr add 192.168.137.254/24 dev bond0
```
```bash
systemctl restart networking
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
	post-up iptables -t nat -A POSTROUTING -s '10.10.10.0/24' -o bond0 -j MASQUERADE
	post-down iptables -t nat -D POSTROUTING -s '10.10.10.0/24' -o bond0 -j MASQUERADE
	# post-up iptables -t nat -A PREROUTING -i bond0 -p tcp -m multiport --dports 47984,47989,47990,48010 -j DNAT --to-destination 10.10.10.101
	# post-up iptables -t nat -A PREROUTING -i bond0 -p udp -m multiport --dports 47998,47999,48000,48002,48010 -j DNAT --to-destination 10.10.10.101
	post-up iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 12321 -j DNAT --to-destination 10.10.10.200
	post-up iptables -t nat -A PREROUTING -i bond0 -p tcp --dport 445 -j DNAT --to-destination 10.10.10.200
	post-up iptables -t nat -A PREROUTING -i bond0 -p udp --dport 51820 -j DNAT --to-destination 10.10.10.201
	post-down iptables -t nat -D PREROUTING -i bond0 -p udp --dport 51820 -j DNAT --to-destination 10.10.10.201
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
dhcp-host=BC:24:11:02:00:00,10.10.10.200,fileserver
dhcp-host=BC:24:11:02:00:01,10.10.10.201,wireguard
dhcp-option=3,10.10.10.1
dhcp-option=6,1.1.1.1,8.8.8.8
```
```bash
systemctl restart dnsmasq
```
### Installing i915-sriov-dkms
```bash
apt install build-essential dkms
apt install proxmox-default-kernel proxmox-default-headers
wget -O /tmp/i915-sriov-dkms_2026.03.05_amd64.deb "https://github.com/strongtz/i915-sriov-dkms/releases/download/2026.03.05/i915-sriov-dkms_2026.03.05_amd64.deb"
dpkg -i /tmp/i915-sriov-dkms_2026.03.05_amd64.deb
nano /etc/default/grub (`GRUB_CMDLINE_LINUX_DEFAULT="intel_iommu=on i915.enable_guc=3 i915.max_vfs=7 module_blacklist=xe loglevel=0 quiet"`)
update-grub
update-initramfs -u
apt install sysfsutils
echo "devices/pci0000:00/0000:00:02.0/sriov_numvfs = 7" > /etc/sysfs.conf
reboot
```
### Blocking VFs
```bash
echo "vfio-pci" | sudo tee /etc/modules-load.d/vfio-pci.conf
sudo tee /etc/udev/rules.d/99-i915-vf-vfio.rules <<EOF
ACTION=="add", SUBSYSTEM=="pci", KERNEL=="0000:00:02.[1-7]", ATTR{vendor}=="0x8086", ATTR{device}=="0x7d67", DRIVER!="vfio-pci", RUN+="/bin/sh -c 'echo \$kernel > /sys/bus/pci/devices/\$kernel/driver/unbind; echo vfio-pci > /sys/bus/pci/devices/\$kernel/driver_override; modprobe vfio-pci; echo \$kernel > /sys/bus/pci/drivers/vfio-pci/bind'"
EOF
update-initramfs -u
reboot
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

Click `Add`

Select `PCI Device`

Turn on `Raw Device`

Device: `0000:00:02.1` <!--Arrow Lake-S [Intel Graphics]-->

Turn on `PCI-Express`

Click `Add`

Select `Console`

Click `Start Now`

Follow [Configuring Initial Password](WINDOWS.md)

Follow [Installing NVIDIA Drivers](WINDOWS.md)

Follow [Installing Intel Drivers](WINDOWS.md)
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

Click `Templates`

Search `alpine`

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
### Creating Alpine Wireguard LXC Container
Click `Create CT`
#### General
CT ID: `201`

Hostname: `wireguard`

Password: `your_password`

Confirm password: `your_password`

Click `Next`
#### Template
Template: `alpine-3.23-default_.*_amd64.tar.xz`

Click `Next`
#### Disks
Disk size (GiB): `4`

Click `Next`
#### CPU
Cores: `20`

Click `Next`
#### Memory
Memory (MiB): `4096`

Swap (MiB): `0`

Click `Next`
#### Network
MAC address: `BC:24:11:02:00:01`

IPv4/CIDR: `10.10.10.201/24`

Gateway (IPv4): `10.10.10.1`

Click `Next`
#### DNS
Click `Next`
#### Confirm
Click `Finish`

Select `201 (wireguard)`

Select `Console`

Click `Start Now`

wireguard login: `root`

Password: `your_password`
```bash
apk update
apk add wireguard-tools iptables
umask 077
wg genkey | tee /etc/wireguard/server_private.key | wg pubkey > /etc/wireguard/server_public.key
wg genkey | tee /etc/wireguard/client_private.key | wg pubkey > /etc/wireguard/client_public.key
cat /etc/wireguard/server_private.key
cat /etc/wireguard/server_public.key
cat /etc/wireguard/client_private.key
cat /etc/wireguard/client_public.key
vi /etc/wireguard/wg0.conf
```
Append
```bash
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PostUp = iptables -A FORWARD -i wg0 -d 10.10.10.100 -j ACCEPT
PostUp = iptables -A FORWARD -i wg0 -d 10.10.10.101 -j ACCEPT
PostUp = iptables -A FORWARD -i wg0 -m state --state ESTABLISHED,RELATED -j ACCEPT
PostUp = iptables -A FORWARD -i wg0 -j REJECT
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -d 10.10.10.100 -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -d 10.10.10.101 -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -m state --state ESTABLISHED,RELATED -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -j REJECT
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
PrivateKey = <your_server_private_key>

[Peer]
AllowedIPs = 10.0.0.2/32
PublicKey = <your_client_public_key>
```
```bash
ln -s /etc/init.d/wg-quick /etc/init.d/wg-quick.wg0
rc-update add wg-quick.wg0
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
rc-update add sysctl
reboot
```
WireGuard > Add Tunnel > laptop.conf
```bash
[Interface]
Address = 10.0.0.2/32
PrivateKey = <your_client_private_key>

[Peer]
AllowedIPs = 10.0.0.0/24, 10.10.10.0/24
Endpoint = <your_ip>:51820
PersistentKeepalive = 25
PublicKey = <your_server_public_key>
```
##### Orange Livebox

###### Network

Your customized rules

| Application/Service | Internal port | External port | Protocol |
|---------------------|---------------|---------------|----------|
| wireguard           | 51820         | 51820         | UDP      |

##### Xiaomi Router

###### Port forwarding

Port forwarding rules:

| Name      | Protocol | External ports | Internal IP address | Internal port |
|-----------|----------|----------------|---------------------|---------------|
| wireguard | UDP      | 51820          | 192.168.31.254      | 51820         |

Sources:
- [problem in passthroughing USB tethering to VM](https://forum.proxmox.com/threads/problem-in-passthroughing-usb-tethering-to-vm.132902)
- [How to update iwlwifi firmware without uninstalling proxmox](https://forum.proxmox.com/threads/how-to-update-iwlwifi-firmware-without-uninstalling-proxmox.133385)
- [The ultimate gaming virtual machine on proxmox](https://youtu.be/iWwdf66JpxE)
- [Proxmox - Boot from USB Device](https://youtu.be/ow9mShfIo4Y)
- [Does ZFS Kill SSDs? Testing Write amplification in Proxmox](https://youtu.be/V7V3kmJDHTA)
- [Auto Boot Timeout](https://forum.proxmox.com/threads/auto-boot-timeout.80880)
- [Syntax of "args" in <vmid>.conf](https://forum.proxmox.com/threads/syntax-of-args-in-vmid-conf.91439)
- [How to setup Turnkey Linux Fileserver on Proxmox VE](https://youtu.be/UnXxJMjW4LE)
- [Configure a Wireguard interface (wg) - Alpine Linux](https://wiki.alpinelinux.org/wiki/Configure_a_Wireguard_interface_(wg))
- [Full WireGuard VPN Setup on Proxmox VE Using Ubuntu Server 22.04](https://youtu.be/reBGabIiv8s)
- [Use Proxmox as a VPN server with WireGuard.](https://youtu.be/SRa76aFFK3Y)
- [Build your OWN WireGuard VPN! Here's how](https://youtu.be/5NJ6V8i1Xd8)
- [Network Bonding on Proxmox!](https://youtu.be/auMugO3zsKw)