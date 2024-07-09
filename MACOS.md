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
### Optimizing macOS
```
sudo su
mdutil -i off -a
nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""
defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 0
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 0
defaults write com.apple.commerce AutoUpdate -bool false
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false
defaults write com.apple.universalaccess reduceMotion -int 1
defaults write com.apple.universalaccess reduceTransparency -int 1
```
### Comparing Configurations
```
defaults read > defaults.pre.txt
defaults read > defaults.post.txt
diff defaults.pre.txt defaults.post.txt
```
