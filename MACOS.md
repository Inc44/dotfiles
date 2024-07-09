### Installing ultimate macOS KVM
```
sudo pacman -S qemu-full libvirt dnsmasq
git clone https://github.com/Coopydood/ultimate-macOS-KVM
cd ultimate-macOS-KVM
sudo systemctl enable libvirtd
systemctl status libvirtd
sudo usermod -aG libvirt pc
sudo usermod -aG kvm pc
sudo usermod -aG libvirt pc
sudo usermod -aG kvm pc
ls /dev/disk/by-id/
./scripts/repo-update.py --force --targetBranch dev
sudo ./main.py
```
### Reusing Configuration of ultimate macOS KVM
```
cp ~/github/dotfiles/ultimate-macOS-KVM/boot.sh ~/ultimate-macOS-KVM
```
### Configuring ultimate macOS KVM
```
1. Start
1. Use default value
1. Use default value
2. Custom value
4
1. Use default value
1. Use default value
2. Custom value
8G
4. Switch to physical...
ata-WD_PC_SN810_SDCPNRY-512G-1006_23073G804319
2. Solid state drive (SSD)
1. Use default value
2. Generate automatically
1. Download from Apple...
2. More resolutions...
6. 1920x1080 (1080p)
2. Skip
1. Start...
```
### Installing macOS
`macOS Base System`

`Disk Utility`

`macOS`

`Erase`

Name: `macOS`

`Erase`

Close

`Reinstall macOS Monterey`

`Continue`

`Agree`

`Agree`

`macOS`

`Continue`
### After Installing macOS
Second Boot Option `macOS`