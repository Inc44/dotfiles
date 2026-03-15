## Proxmox
### Installing Partclone
```bash
apt install partclone
```
### Backuping Partitions
```bash
partclone.fat32 -c -s /dev/zvol/fastest/vm-101-disk-0-part1 | zstd -4 > /mnt/hdd/proxmox/vm-101-disk-0.img.zst
partclone.ext4 -c -s /dev/zvol/fastest/vm-101-disk-1-part1 | zstd -4 > /mnt/hdd/proxmox/vm-101-disk-1.img.zst
partclone.ext4 -c -s /dev/zvol/fastest/vm-101-disk-2-part1 | zstd -4 > /mnt/hdd/proxmox/vm-101-disk-2.img.zst
```
### Configuring ZFS
```bash
# 1G + 32M + 33S (Grub/Windows Boot + ZVOL + GPT)
zfs create -s -V 1107313152 fastest/vm-102-disk-0
# 400G + 32M + 33S (Arch Linux OS + ZVOL + GPT)
zfs create -s -V 429530300928 fastest/vm-102-disk-1
# 400G + 32M + 33S (Arch Linux Home + ZVOL + GPT)
zfs create -s -V 429530300928 fastest/vm-102-disk-2
```
### Partitioning Disk
```bash
cfdisk /dev/zvol/fastest/vm-102-disk-0
```
`gpt`

`New` > Partition size: `2097152S`

`Type` > `EFI System`

`Write` > Are you sure you want to write the partition table to disk? `yes`

`Quit`
```bash
cfdisk /dev/zvol/fastest/vm-102-disk-1
cfdisk /dev/zvol/fastest/vm-102-disk-2
```
`gpt`

`New` > Partition size: `838860800S`

`Type` > `Linux filesystem`

`Write` > Are you sure you want to write the partition table to disk? `yes`

`Quit`
### Restoring Partitions
```bash
zstd -d -c /mnt/hdd/proxmox/vm-101-disk-0.img.zst | partclone.fat32 -r -o /dev/zvol/fastest/vm-102-disk-0-part1
zstd -d -c /mnt/hdd/proxmox/vm-101-disk-1.img.zst | partclone.ext4 -r -o /dev/zvol/fastest/vm-102-disk-1-part1
zstd -d -c /mnt/hdd/proxmox/vm-101-disk-2.img.zst | partclone.ext4 -r -o /dev/zvol/fastest/vm-102-disk-2-part1
```
### Configuring Virtual Machine
```bash
qm set 101 -virtio0 fastest:vm-102-disk-0
qm set 101 -virtio1 fastest:vm-102-disk-1
qm set 101 -virtio2 fastest:vm-102-disk-2
```
Move `usb0` above all
### Changing Root
```bash
mount /dev/vdb1 /mnt
mount /dev/vda1 /mnt/boot
arch-chroot /mnt
```
### Installing GRUB
```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
exit
shutdown now
```
Move `virtio0` above all
## Laptop
### AOMEI Backupper
### Macrium Reflect