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
Cores: `8`

Type: `host`

Click `Next`
#### Memory
Memory (MiB): `32768`

Click `Next`
#### Network
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

Move `usb0` above `ide0`

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

Device: `0000:01:00.0` <!--AD106 [GeForce RTX 4060 Ti 16GB]-->

Turn on `All Functions`

Turn on `PCI-Express`

Click `Add`

Select `Console`

Click `Start Now`

Follow [Configuring Initial Password](WINDOWS.md)

Follow [Installing NVIDIA Drivers](WINDOWS.md)

Sources:
- [problem in passthroughing USB tethering to VM](https://forum.proxmox.com/threads/problem-in-passthroughing-usb-tethering-to-vm.132902)
- [How to update iwlwifi firmware without uninstalling proxmox](https://forum.proxmox.com/threads/how-to-update-iwlwifi-firmware-without-uninstalling-proxmox.133385)
- [The ultimate gaming virtual machine on proxmox](https://youtu.be/iWwdf66JpxE)
- [Proxmox - Boot from USB Device](https://youtu.be/ow9mShfIo4Y)