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
vim /mnt/etc/fstab
```

#### fstab
```bash
# Static information about the filesystems.
# See fstab(5) for details.

# <file system> <dir> <type> <options> <dump> <pass>
# /dev/sdb2
UUID="A0CE05DFCE05AF1A" /hdd ntfs rw,noexec,nofail 0 0
```

```bash
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
hwclock --systohc
vim /etc/mkinitcpio.conf (add encrypt to HOOKS)
```

#### mkinitcpio.conf
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
