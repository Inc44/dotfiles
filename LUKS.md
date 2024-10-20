```bash
e2fsck -f /dev/nvme0n1p4
e2fsck -f /dev/nvme0n1p5
resize2fs /dev/nvme0n1p4 409568M
resize2fs /dev/nvme0n1p5 409568M
cryptsetup reencrypt --encrypt /dev/nvme0n1p4 --reduce-device-size 32M
cryptsetup reencrypt --encrypt /dev/nvme0n1p5 --reduce-device-size 32M
cryptsetup open /dev/nvme0n1p4 crypt
cryptsetup open /dev/nvme0n1p5 crypth
mount /dev/mapper/crypt /mnt
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/mapper/crypth /mnt/home
mount /dev/sdb2 /mnt/hdd
rm /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
mkinitcpio -p linux
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
blkid | tee -a uuid
vim uuid (yank `UUID="..."` of /dev/nvme0n1p4)
vim /etc/default/grub (`GRUB_CMDLINE_LINUX="cryptdevice=UUID=...:crypt root=/dev/mapper/crypt rootfstype=ext4"`)
vim uuid (yank `UUID="..."` of /dev/nvme0n1p5)
vim /etc/crypttab (`home  UUID=...  none  luks,timeout=30`)
rm uuid
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -a
reboot
```
