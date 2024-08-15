```bash
e2fsck -f /dev/nvme0n1p4
e2fsck -f /dev/nvme0n1p5
resize2fs /dev/nvme0n1p4 102368M
resize2fs /dev/nvme0n1p5 102368M
cryptsetup reencrypt --encrypt /dev/nvme0n1p4 --reduce-device-size 32M
cryptsetup reencrypt --encrypt /dev/nvme0n1p5 --reduce-device-size 32M
cryptsetup open /dev/nvme0n1p4 crypt
cryptsetup open /dev/nvme0n1p5 crypth
mount /dev/mapper/crypt /mnt
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/mapper/crypth /mnt/home
cat /mnt/etc/fstab
```

#### Old fstab
```bash
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/nvme0n1p4
UUID=00a275a2-dbb5-4086-aada-68e2949969a3 / ext4 rw,relatime 0 1

# /dev/nvme0n1p1
UUID=1B67-6671 /boot vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro 0 2

# /dev/nvme0n1p5
UUID=76712dd8-7287-4e0e-b85c-c458b25c39cc /home ext4 rw,relatime 0 2

# /dev/sdb2
UUID="A0CE05DFCE05AF1A" /hdd ntfs rw,noexec,nofail 0 0
```

```bash
vim /mnt/etc/fstab (keep header and /hdd only, remove everything else)
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

#### New fstab
```bash
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/sdb2
UUID="A0CE05DFCE05AF1A" /hdd ntfs rw,noexec,nofail 0 0

# /dev/mapper/crypt
UUID=00a275a2-dbb5-4086-aada-68e2949969a3 / ext4 rw,relatime 0 1

# /dev/nvme0n1p1
UUID=1B67-6671 /boot vfat rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro 0 2

# /dev/nvme0n1p5
UUID=76712dd8-7287-4e0e-b85c-c458b25c39cc /home ext4 rw,relatime 0 2
```

```bash
arch-chroot /mnt
hwclock --systohc
cat /etc/mkinitcpio.conf
```

#### Old mkinitcpio.conf
```bash
MODULES=()
BINARIES=()
FILES=()
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block filesystems fsck)
```

```bash
vim /etc/mkinitcpio.conf (add encrypt to HOOKS)
cat /etc/mkinitcpio.conf
```

#### New mkinitcpio.conf
```bash
MODULES=()
BINARIES=()
FILES=()
HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt filesystems fsck)
```

```bash
mkinitcpio -p linux-lts
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
blkid | tee -a uuid
vim uuid (yank `UUID="3e46412b-0eae-4c3c-b5ac-4f50e451fe32"` of /dev/nvme0n1p4)
vim /etc/default/grub (`GRUB_CMDLINE_LINUX="cryptdevice=UUID=3e46412b-0eae-4c3c-b5ac-4f50e451fe32:crypt root=/dev/mapper/crypt"`)
vim uuid (yank `UUID="56a23077-5742-448a-acef-11c210318fc9"` of /dev/nvme0n1p5)
vim /etc/crypttab (`home  UUID=56a23077-5742-448a-acef-11c210318fc9  none  luks,timeout=30`)
rm uuid
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -a
reboot
```
