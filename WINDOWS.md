### Creating Shared Network
Press Win and R

Type `ncpa.cpl`

Right click `Wi-Fi`

Click `Properties`

Click `Sharing`

Turn on `Allow other network users to connect through this computer's Internet connection`

Select `Ethernet*` for `Home networking connection:`

Click `OK`
### Creating Bridged Network
Press Win and R

Type `ncpa.cpl`

Right click `Wi-Fi`

Click `Properties`

Click `Sharing`

Turn off `Allow other network users to connect through this computer's Internet connection`

Click `OK`

Hold Ctrl

Click `Wi-Fi`

Click `Ethernet*`

Right click `Bridge Connections`
### Repairing BCD
Click `Next`

Click `Next`

Click `Repair my PC`

Click `Next`

Click `US`

Click `Troubleshoot`

Click `Command Prompt`
```cmd
drvload E:\viostor\w11\amd64\viostor.inf (`proxmox only`)
diskpart
list disk
sel disk N (`problematic disk`)
list vol
sel vol N (`FAT32 EFI volume`)
assign letter K:
exit
cd /d K:\EFI\Microsoft\Boot
ren BCD BCD.bak
bcdboot N:\Windows /l en-us /s K: /f all (`NTFS Windows volume`)
bcdedit /store K:\EFI\Microsoft\Boot\BCD /set {default} safeboot minimal (`proxmox only`)
dism /Image:N:\ /Add-Driver /Driver:E:\viostor\w11\amd64\viostor.inf (`proxmox only`)
exit
```
Click `Turn off your PC`
### Configuring Initial Privacy
Click `Yes`

Click `Yes`

Click `Add layout`

Click `French (France)`

Click `Next`

Click `Add layout`

Click `I don't have internet`
### Installing VirtIO Drivers
Right click Start Menu icon

Select `Device Manager`

Right click `PCI Simple Communications Controller`

Select `Update driver`

Click `Browse my computer for drivers`

Click `Browse`

Select `CD Drive (*:) virtio-win-0.1.271`

Click `OK`

Click `Next`

Click `Close`

Right click `PCI Device`

Select `Update driver`

Click `Browse my computer for drivers`

Click `Next`

Click `Close`

Right click `Ethernet Controller`

Select `Update driver`

Click `Browse my computer for drivers`

Click `Next`

Click `Close`

Restart
### Configuring Initial Password
Click `OK`

Type `` <!--Password-->

Type `your_password` <!--New password-->

Type `your_password` <!--Confirm password-->

Press Enter

Click `OK`
### Installing Intel Drivers
Download [gfx_win_*.exe](https://www.intel.com/content/www/us/en/download/857252) <!--32.0.101.8425_101.8362 WHQL Certified-->

Open `gfx_win_*.exe`

Click `Yes`

Click `Begin installation`

Click `I agree`

Click `Decline`

Turn on `Execute a clean installation`

Click `Start >`

Turn off `Launch Intel® Graphics Software`

Click `Reboot Required`

Or

Download [gfx_win_*.exe](https://www.intel.com/content/www/us/en/download/785597) <!--WHQL Certified (Latest)-->

Open `gfx_win_*.exe`

Click `Yes`

Turn off `Intel® Computing Improvement Program`

Turn on `Clean Install`

Click `Install`

Turn off `Launch Intel® Graphics Software`

Click `Restart Now`
### Installing NVIDIA Drivers
Download [*-notebook-win10-64bit-international-whql.exe](https://www.nvidia.com/en-us/drivers) <!--GeForce Game Ready Driver 391.* for GeForce GT 540M-->

Open `*-notebook-win10-64bit-international-whql.exe`

Or

Download [*-notebook-win10-win11-64bit-international-dch-whql.exe](https://www.nvidia.com/en-us/drivers) <!--GeForce Security Update Driver 582.* for GeForce 940MX-->

Open `*-notebook-win10-win11-64bit-international-dch-whql.exe`

Or

Download [*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe](https://www.nvidia.com/en-us/drivers) <!--NVIDIA Studio Driver 596.*-->

Open `*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe`

Click `Yes`

Click `OK`

Click `AGREE AND CONTINUE`

Click `Custom (Advanced)`

Click `Next`

Turn on `Perform a clean installation`

Click `Next`

Turn off `Create desktop shortcut for NVIDIA App`

Turn off `Launch NVIDIA App`

Click `Close`
### Configuring Device Name
Click Start Menu icon

Type `Settings`

Press Enter

Click `Rename`

Type `pc` <!--Name your device-->

Click `Next`

Click `Restart now`
### Configuring Performance
Click Start Menu icon

Type `View advanced system settings`

Press Enter

Click first `Settings...`

Click `Adjust for best performance`

Turn on `Show thumbnails instead of icons`

Turn on `Smooth edges of screen fonts`

Click `OK`

Click `OK`
### Installing Win 10 Tweaker
Download [Win 10 Tweaker](https://win10tweaker.ru)
### Configuring Win 10 Tweaker
Open `Win 10 Tweaker.exe`

Click `Yes`

Click `Accept`
#### Confidentiality
Click `Check all`

Turn off `Disabling detection of user location`

Click `Apply`

Click `OK`

Click `Uncheck all`

Click `Check all`

Turn off `Disabling detection of user location`

Click `Apply`

Click `OK`
#### Context Menu
Click `Check all`

Turn off all `Shift + Right Click`

Turn off `Add item "Upload on ImgBB" to images context menu`

Turn off `Add item "Upload on Upload.ee" to images context menu`

Turn off `Expand the "Personalization" item of Desktop menu`

Click second `(choose)`

Turn on all

Click first `(choose)`

Turn on all

Click `Apply`
#### Interface
Turn on `Remove "3D Objects" link from "This PC"`

Turn on `and folder`

Turn on `Remove folders from "This PC"`

Turn on `Remove arrows from shortcuts`

Turn on `Remove "shortcut" prefix / postfix from shortcuts`

Turn on `Accelerate frequency of cursor flickering`

Turn on `Accelerate previews appearance of taskbar items`

Turn on `Preconfigure Explorer`

Click second `(choose)`

Turn off `Disable Navigation pane`

Click `Apply`
#### System
Click `Check all`

Turn off `Stop and disable Windows Defender and SmartScreen`

Turn off `Create Restart and Refresh shortcuts on Desktop`

Click `Apply`
#### Services
#### Cleaner
#### Applications
Click `Remove all applications`

Click `Yes`

Click Microsoft Store icon
#### Startup
#### Optimization
#### Virus Scanner
#### System Information
Restart
### Configuring Folders
Press Win + E

Double click `Local Disk (D:)`

Click `> This PC > Local Disk (D:)`

Type `cmd`

Press Enter

```powershell
mkdir portable
```
### Configuring Indexing
Press Win + E

Click `Local Disk (C:)`

Press Alt + Enter

Turn off `Allow files on this drive to have contents indexed in addition to file properties`

Click `OK`

Click `OK`

Click `Ignore All`

Click `Local Disk (D:)`

Press Alt + Enter

Turn off `Allow files on this drive to have contents indexed in addition to file properties`

Click `OK`

Click `OK`
### Configuring Mouse Properties
Click Start Menu icon

Type `Change the mouse pointer display or speed`

Press Enter

Turn off `Enhance pointer precision`

Click `OK`
### Configuring PATH
```cmd
setx /M PATH "%PATH%;%PORTABLE_PATH%"
```
### Configuring Region
Click Start Menu icon

Type `Region`

Press Enter

Select `English (world)` for `Format:`

Select `HH:mm` for `Short time:`

Select `HH:mm:ss` for `Long time:`

Click `OK`
### Configuring Sound
Click Start Menu icon

Type `Change system sounds`

Press Enter

Select `No Sounds` for `Sound Scheme:`

Turn off `Play Windows Startup sound`

Click `Communications`

Click `Do nothing`

Click `OK`
### Configuring Taskbar
Right click `File Explorer`

Click `Unpin from taskbar`

Right click `Microsoft Edge`

Click `Unpin from taskbar`
### Configuring Windows Features
Click Start Menu icon

Type `Turn Windows features on or off`

Press Enter

Turn on `Telnet Client`

Turn on `Virtual Machine Platform`

Turn on `Windows Subsystem for Linux`

Click `OK`

Click `Restart now`
### Configuring Settings
Click Start Menu icon

Type `Settings`

Press Enter

Click `System`

Click `Display`

Click `Extend these displays`

Click `Show only on 2`

Click `Keep changes`

Click `2`

Turn on `HDR`

Click `HDR`

Turn on `Auto HDR`

Click $\leftarrow$ icon

Click `Advanced display`

Select `100 Hz` for `Choose a refresh rate`

Click `Keep changes`

Click `System`

Click `Notifications`

Turn off `Notifications`

Click `System`

Click `Power`

Click `Power Mode`

Select `Best Power Efficiency` for `Plugged in`

Click `Screen timeout`

Select `Never` for `Turn my screen off after` for `Plugged in`

Click `System`

Click `Multitasking`

Select `Don't show tabs` for `Show tabs from apps when snapping or pressing Alt+Tab`

Click `System`

Click `For developers`

Click `File Explorer`

Turn on `Show hidden and system files`

Click `System`

Click `Clipboard`

Turn on `Clipboard history`

Click `Bluetooth & devices`

Click `USB`

Turn off `Connection notifications`

---

Click `Personalization`

Click `Background`

Select `Solid color` for `Personalize your background`

Click `Personalization`

Click `Colors`

Select `Dark` for `Choose your mode`

Turn off `Transparency effects`

Select `Iris pastel` for `Windows colors`

Click `Personalization`

Click `Themes`

Click `Desktop icon settings`

Turn off `Recycle Bin`

Turn off `Allow themes to change desktop icons`

Click `OK`

Click `Personalization`

Click `Lock screen`

Click fourth for `Recent images`

Turn off `Show the lock screen background picture on the sign-in screen`

Click `Personalization`

Click `Text input`

Select `Search` for `Customize Copilot key on keyboard`

Click `Personalization`

Click `Start`

Turn off `Show recently added apps`

Turn off `Show recommendations for tips, shortcuts, new apps, and more`

Click `Folders`

Turn off all

Click `Personalization`

Click `Taskbar`

Select `Hide` for `Search`

Turn off `Task View`

Turn on `Pen Menu`

Click `Other system tray icons`

Turn on all

Click `Taskbar behaviors`

Turn on `Automatically hide the taskbar`

---

Click `Apps`

Click `Installed apps`

Click $\cdots$ icon for `Microsoft Clipchamp`

Click `Uninstall`

Click `Uninstall`

Click $\cdots$ icon for `Terminal`

Click `Uninstall`

Click `Uninstall`

Click `Apps`

Click `Advanced app settings`

Click `Share across devices`

Click `Off`

Click `App execution aliases`

Turn off all `App Installer`

Click `Apps`

Click `Resume`

Turn off `OneDrive`

Turn off `Resume`

---

Click `Time & language`

Click `Language & region`

Click $\cdots$ icon for `English (United States)`

Click `Language options`

Click `Add a keyboard`

Click `United States-Dvorak`

Click $\leftarrow$ icon

Click `Add a language`

Type `Russian`

Click `Русский`

Click `Next`

Click `Install`

Click `Add a language`

Type `Ukrainian`

Click `Українська`

Click `Next`

Click `Install`

Click `Add a language`

Type `Japanese`

Click `日本語`

Click `Next`

Click `Install`

Select `France` for `Country or region`

Click all `Copy`

Click `Time & language`

Click `Typing`

Click `Touch keyboard`

Turn off `Play key sounds as I type`

Turn off `Show the voice typing mic button 🎙️`

Turn on `Multilingual text suggestions`

Click `Typing insights`

Turn off `Typing insights`

---

Click `Gaming`

Click `Captures`

Select `4 hours` for `Max recording length`

Click `Capture audio when recording a game`

Select `192kbps` for `Audio recording quality`

Select `60 fps` for `Video frame rate`

Select `High` for `Video quality`

---

Click `Accessibility`

Click `Mouse pointer and touch`

Select `Custom` for `Mouse pointer style`

Select `Green` for `Recommended colors`

Turn on `Make the circle darker and larger`

Click `Accessibility`

Click `Narrator`

Turn off `Keyboard shortcut for Narrator`

Turn off `Enable Narrator extensions`

Click `Enable Narrator extensions`

Turn off `Find and download new extensions on Narrator startup`

Turn off `Get image descriptions, page titles, and popular links`

Click `Accessibility`

Click `Keyboard`

Turn off `Use the Print screen key to open screen capture`

---

Click `Privacy & security`

Click `General`

Turn off `Let websites show me locally relevant content by accessing my language list`

Click `Privacy & security`

Click `Search`

Turn off `Search history`

Click `Clear`

Click `Privacy & security`

Click `Location`

Turn on `Location services`

Turn on `Let apps access your location`

Click `Privacy & security`

Click `Voice activation`

Turn off `Let apps access your voice activation services`

Click `Privacy & security`

Click `Notifications`

Turn off `Notification access`

Click `Privacy & security`

Click `Account info`

Turn off `Account info access`

Click `Privacy & security`

Click `Contacts`

Turn off `Contacts access`

Click `Privacy & security`

Click `Calendar`

Turn off `Calendar access`

Click `Privacy & security`

Click `Phone calls`

Turn off `Phone calls access`

Click `Privacy & security`

Click `Call history`

Turn off `Call history access`

Click `Privacy & security`

Click `Email`

Turn off `Email access`

Click `Privacy & security`

Click `Tasks`

Turn off `Tasks access`

Click `Privacy & security`

Click `Messaging`

Turn off `Messaging access`

Click `Privacy & security`

Click `Radios`

Turn off `Radio control access`

Click `Privacy & security`

Click `Other devices`

Turn off `Communicate with unpaired devices`

Click `Privacy & security`

Click `App diagnostics`

Turn off `App diagnostic access`

---

Click `Windows Update`

Click `Pause for 1 week`

Click `Extend for 1 week` 4 times

Click `Advanced options`

Click `Delivery Optimization`

Turn off `Allow downloads from other devices`
### Installing 7-Zip
```powershell
winget install -e --id 7zip.7zip
```
Or

Download [7z*-x64.exe](https://www.7-zip.org/download.html)

Open `7z*-x64.exe`

Click `Install`

Click `Close`
```cmd
setx /M PATH "%PATH%;C:\Program Files\7-Zip"
```
### Installing 7-Zip ZS
```powershell
winget install -e --id mcmilk.7zip-zstd
```
Or

Download [7z*-zstd-x64.exe](https://github.com/mcmilk/7-Zip-zstd/releases)

Open `7z*-zstd-x64.exe`

Click `Install`

Click `Close`
### Installing StartAllBack
Download `StartAllBack (StartIsBack++)`

Open `StartAllBack` installer

Click `Install`
#### Welcome
Click `Proper 11`
#### Start Menu
Visual Style: `Plain8`

Icon count: `0`

Turn off `Display Modern apps in a folder`

Turn on `Override sort order`

Turn off `Highlight newly installed programs`

Turn off `Open submenus when I pause on them with the mouse pointer`

Turn off `Display user account picture`

Turn off `Display glyph icons`

Select `Don't display` for `Music`

Select `Link` for `Videos`

Select `Don't display` for `Recent Items`

Select `Don't display` for `This PC`

Select `Don't display` for `Run`
#### Taskbar
Taskbar location on screen: `Top`

Turn on `Centered task icons`

Turn on `Automatic hiding`
#### Tray icons
Corner icons open: `Windows 10 flyouts if possible`

Turn on `Quick settings`

Turn on `Always show all app icons`
#### Explorer
Click `Win10 Ribbon UI`

Turn off `Mica effect on top`

Turn off `New icons`

Turn off `Restore Control Panel applets`

Turn on `Colorize everything with accent color`
#### Advanced
Turn on `Use custom start menu coloring`

Click `Pick Start menu color`

Red: `0`

Green: `0`

Blue: `0`

Click `OK`

Turn on `Use custom taskbar coloring`

Click `Pick taskbar color`

Red: `0`

Green: `0`

Blue: `0`

Click `OK`

Click all `Clear list`

Number of jumplist items to display: `30`
#### About
### Installing .NET Desktop Runtime 6
```powershell
winget install -e --id Microsoft.DotNet.DesktopRuntime.6
```
Or

Download [windowsdesktop-runtime-6*-win-x64.exe](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)

Open `windowsdesktop-runtime-6*-win-x64.exe`

Click `Install`

Click `Close`
### Installing .NET Desktop Runtime 8
```powershell
winget install -e --id Microsoft.DotNet.DesktopRuntime.8
```
Or

Download [windowsdesktop-runtime-8*-win-x64.exe](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)

Open `windowsdesktop-runtime-8*-win-x64.exe`

Click `Install`

Click `Close`
### Installing .NET Desktop Runtime 10
```powershell
winget install -e --id Microsoft.DotNet.DesktopRuntime.10
```
Or

Download [windowsdesktop-runtime-10*-win-x64.exe](https://dotnet.microsoft.com/en-us/download/dotnet/10.0)

Open `windowsdesktop-runtime-10*-win-x64.exe`

Click `Install`

Click `Close`
### Installing PowerToys
```powershell
winget install -e --id Microsoft.PowerToys
```
Or

Download [PowerToysSetup-*-x64.exe](https://github.com/microsoft/PowerToys/releases)

Open `PowerToysSetup-*-x64.exe`

Turn on `I agree to the license terms and conditions`

Click `Install`

Click `Close`
### Configuring PowerToys
Click `Configure PowerToys`

Turn off `Awake`

Turn off `Command Palette`

Turn on `Environment Variables`

Turn off `File Locksmith`

Turn on `Hosts File Editor`

Turn off `PowerRename`

Turn on `PowerToys Run`

Turn on `Workspaces`

Click `Always On Top`

Select `4` for `Thickness (px)`

Turn off `Play a sound when pinning a window`

---

Click `Home`

Click `Color Picker`

Turn on `Show color name`

Turn on `CMYK`

Turn on `CIELAB`

---

Click `Home`

Click `FancyZones`

Turn on `Make the dragged window transparent`

Turn on `Override Windows Snap`

---

Click `Home`

Click `Hosts File Editor`

Turn off `Show a warning at startup`

Turn off `Backup hosts file`

---

Click `Home`

Click `Image Resizer`

Click Remove icon

Click `Yes`

Click Remove icon

Click `Yes`

Click Remove icon

Click `Yes`

Click Remove icon

Click `Yes`

Click `Add new size`

Click Edit icon

Name `icon`

Width `100`

Height `100`

Click `Add new size`

Click Edit icon for `New size 1`

Name `512`

Width `512`

Height `512`

Select `PNG encoder` for `Fallback encoder`

Select `100` for `JPEG quality level (%)`

---

Click `Home`

Click `Mouse Highlighter`

Click `Appearance & behavior`

Select `#A600F00` for `Primary button highlight color`

---

Click `Home`

Click `PowerToys Run`

Turn on `OneNote`

Click `Time and Date`

Turn on `Show time with seconds`

Custom formats `unix=UXT`

Click `Unit Converter`

Turn on `Include in global result`

Click `Value Generator`

Turn on `Include in global result`

Click `Windows settings`

Turn on `Include in global result`

Click `Window Walker`

Turn on `Show process id in the subtitle`

Turn on `Stay open after closing windows and killing processes`

Turn on `Hide Explorer process information`

---

Click `Home`

Click `Screen Ruler`

Select `Spacing` for `Default mode`

Select `35` for `Pixel tolerance for edge detection`

---

Click `Home`

Click `Shortcut Guide`

Select `Right` for `Window position`
## Free Portable
### Installing Advanced Renamer 3.95.4
Download [advanced_renamer_portable_3_95_4.zip](https://www.advancedrenamer.com/down/advanced_renamer_portable_3_95_4.zip)
```powershell
mkdir 'D:/portable/Advanced Renamer 3'
7z x advanced_renamer_portable_3_95_4.zip -o'D:/portable/Advanced Renamer 3'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Advanced Renamer 3.lnk')
$lnk.TargetPath='D:/portable/Advanced Renamer 3/ARen.exe'
$lnk.Save()
```
Open `Advanced Renamer 3`

Click `OK`

Turn on `Don't show this again`

Click `Settings`

Turn off `Show file info panel`

Turn on `Show grid`

Color mode: `Light`

Click `Image files`

EXIF field for image date time operations: `ExifTool DateOriginal`

Turn on `Don't analyze image metadata`

Click `Music & video files`

Turn on `Don't analyze music metadata`

Turn on `Don't analyze video metadata`

Click `OK`

Name collision rule `Append number`

Click `Load Method List`

File name: `Renaming Method List.aren`

Click `Open`
### Installing Advanced Renamer 4
Download [advanced_renamer_portable_4_*.zip](https://www.advancedrenamer.com/download)
```powershell
mkdir 'D:/portable/Advanced Renamer 4'
7z x advanced_renamer_portable_4_*.zip -o'D:/portable/Advanced Renamer 4'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Advanced Renamer 4.lnk')
$lnk.TargetPath='D:/portable/Advanced Renamer 4/aren.exe'
$lnk.Save()
```
Open `Advanced Renamer 4`

Turn on `Accept license terms`

Click `OK`

Click `OK`

Turn on `Don't show this again`

Click `Settings`

Turn on `Show grid`

Turn on `Grid stripes`

Color mode: `Light`

Click `Media files`

Field for image date time operations: `Date original`

Turn on `Don't analyze image metadata`

Turn on `Don't analyze audio metadata`

Turn on `Don't analyze video metadata`

Turn on `Don't analyze document metadata`

Click `OK`

Name collision rule `Append number`

Click `Load Method List`

Click `Load Method List...`

File name: `Renaming Method List.aren`

Click `Open`
### Installing Anvil's Storage Utilities
Download [AnvilBenchmark_V110_[Guru3D.com].zip](https://www.guru3d.com/download/anvils-storage-utilities-download)
```powershell
mkdir "D:/portable/Anvil's Storage Utilities"
7z x AnvilBenchmark_V110_[Guru3D.com].zip -o"D:/portable/Anvil's Storage Utilities"
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut("D:/portable/Anvil's Storage Utilities.lnk")
$lnk.TargetPath="D:/portable/Anvil's Storage Utilities/AnvilPro.exe"
$lnk.Save()
```
### Installing Apache Maven
Download [apache-maven-*-bin.zip](https://maven.apache.org/download.cgi)
```powershell
7z x apache-maven-*-bin.zip -oD:/portable
Rename-Item D:/portable/apache-maven-* apache-maven
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\apache-maven\bin"
```
### Installing ATTO Disk Benchmark 4.01.0f1
Download [atto-disk-benchmark-4010f1.zip](https://www.techpowerup.com/download/atto-disk-benchmark)
```powershell
mkdir 'D:/portable/ATTO Disk Benchmark'
7z x atto-disk-benchmark-4010f1.zip -o'D:/portable/ATTO Disk Benchmark'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ATTO Disk Benchmark.lnk')
$lnk.TargetPath='D:/portable/ATTO Disk Benchmark/ATTODiskBenchmark.exe'
$lnk.Save()
```
### Installing Check Flash
Download [ChkFlsh.zip](https://www.mikelab.kiev.ua/PROGRAMS/ChkFlsh.zip)
```powershell
mkdir 'D:/portable/Check Flash'
7z x ChkFlsh.zip -o'D:/portable/Check Flash'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Check Flash.lnk')
$lnk.TargetPath='D:/portable/Check Flash/ChkFlsh.exe'
$lnk.Save()
```
### Installing Checksum Compare
Download [Checksum-compare-v*.7z](https://checksumcompare.sanktuaire.com/downloads)
```powershell
mkdir 'D:/portable/Checksum Compare'
7z x Checksum-compare-v*.7z -o'D:/portable/Checksum Compare'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Checksum Compare.lnk')
$lnk.TargetPath='D:/portable/Checksum Compare/Checksum compare.exe'
$lnk.Save()
```
Open `Checksum Compare`

Click `Edition`

Click `Options...`

Turn on `Sauvegarder les répertoires courants en quittant.`

Turn on `Sauvegarder l'agencement des vues en quittant.`

Langue `English`

Click `Sauver`

Click `Yes`
### Installing CUDA-Z
Download [CUDA-Z-*-64bit.exe](https://sourceforge.net/projects/cuda-z/files/cuda-z)
```powershell
mkdir D:/portable/CUDA-Z
copy CUDA-Z-*-64bit.exe D:/portable/CUDA-Z/CUDA-Z.exe
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CUDA-Z.lnk')
$lnk.TargetPath='D:/portable/CUDA-Z/CUDA-Z.exe'
$lnk.Save()
```
### Installing DeepFaceLab
Download [DeepFaceLab_DirectX12_build_05_04_2022.exe](https://github.com/iperov/DeepFaceLab)

Open `DeepFaceLab_DirectX12_build_05_04_2022.exe`

Extract to `D:/portable`

Click `Extract`
```powershell
Rename-Item D:/portable/DeepFaceLab_DirectX12 DeepFaceLab
```
### Installing Disk2vhd
Download [Disk2vhd.zip](https://download.sysinternals.com/files/Disk2vhd.zip)
```powershell
mkdir D:/portable/Disk2vhd
7z x Disk2vhd.zip -oD:/portable/Disk2vhd
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Disk2vhd.lnk')
$lnk.TargetPath='D:/portable/Disk2vhd/disk2vhd64.exe'
$lnk.Save()
```
Open `Disk2vhd`

Click `Agree`
### Installing Document Translation
Download [DocumentTranslation.zip](https://github.com/MicrosoftTranslator/DocumentTranslation/releases)
```powershell
mkdir 'D:/portable/Document Translation'
7z x DocumentTranslation.zip -o'D:/portable/Document Translation'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Document Translation.lnk')
$lnk.TargetPath='D:/portable/Document Translation/DocumentTranslation.GUI.exe'
$lnk.Save()
```
### Installing DNS Benchmark 1.3.6668.0
Download [DNSBench.exe](https://www.majorgeeks.com/mg/getmirror/dns_benchmark,1.html)
```powershell
mkdir 'D:/portable/DNS Benchmark'
copy DNSBench.exe 'D:/portable/DNS Benchmark'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/DNS Benchmark.lnk')
$lnk.TargetPath='D:/portable/DNS Benchmark/DNSBench.exe'
$lnk.Save()
```
### Installing EncryptPad
Download [encryptpad*_win32.zip](https://github.com/evpo/EncryptPad/releases)
```powershell
mkdir D:/portable/encryptpad
7z x encryptpad*_win32.zip -oD:/portable/encryptpad
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/EncryptPad.lnk')
$lnk.TargetPath='D:/portable/encryptpad/encryptpad.exe'
$lnk.Save()
```
### Installing FFMetrics
Download [FFMetrics.*.zip](https://github.com/fifonik/FFMetrics/releases)
```powershell
7z x FFMetrics.*.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/FFMetrics.lnk')
$lnk.TargetPath='D:/portable/FFMetrics/FFMetrics.exe'
$lnk.Save()
```
### Installing Flowframes (Internet access required)
```powershell
mkdir D:/cache/flowframes
mkdir D:/portable/Flowframes
```
Download [FlowframesInstaller*.exe](https://nmkd.itch.io/flowframes)

Open `FlowframesInstaller*.exe`

Click `Custom Folder`

Click `Browse...`

Folder: `D:\portable\Flowframes`

Click `Select Folder`

Click `Next`

Click `AMD, Intel, Nvidia (Vulkan+CUDA)`

Click `Next`

Click `Install embedded Python runtime with all dependencies`

Click `Next`

Click `Support for RTX 30 Series and older (~3.0 GB of Disk Space)`

Click `Next`

Click `Pre-install AI Models (Enables Flowframes to be used completely offline)`

Click `Next`

Click `Next`

Click `Next`

Click `Download Model Files`

Click `Close`
### Installing Ghidra
Download [ghidra_*_PUBLIC_*.zip](https://github.com/NationalSecurityAgency/ghidra/releases)
```powershell
7z x ghidra_*_PUBLIC_*.zip -oD:/portable
Rename-Item D:/portable/ghidra_*_PUBLIC ghidra
```
### Installing GPEN (Internet access required)
```powershell
git clone https://github.com/yangxy/GPEN.git
cd GPEN
conda create --name gpen python=3.13 -y
conda activate gpen
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu132
pip install -r requirements.txt
$ProgressPreference = 'SilentlyContinue'
cd weights
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-2048.pth -o GPEN-BFR-2048.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-256-D.pth -o GPEN-BFR-256-D.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-256.pth -o GPEN-BFR-256.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-512-D.pth -o GPEN-BFR-512-D.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-512.pth -o GPEN-BFR-512.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Colorization-1024.pth -o GPEN-Colorization-1024.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Inpainting-1024.pth -o GPEN-Inpainting-1024.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Seg2face-512.pth -o GPEN-Seg2face-512.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/ParseNet-latest.pth -o ParseNet-latest.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/RetinaFace-R50.pth -o RetinaFace-R50.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/model_ir_se50.pth -o model_ir_se50.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x1.pth -o realesrnet_x1.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x2.pth -o realesrnet_x2.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x4.pth -o realesrnet_x4.pth
cd ..
python demo.py --task FaceEnhancement --model GPEN-BFR-512 --in_size 512 --channel_multiplier 2 --narrow 1 --use_sr --sr_scale 4 --use_cuda --save_face --indir examples/imgs --outdir examples/outs-bfr
python demo.py --task FaceColorization --model GPEN-Colorization-1024 --in_size 1024 --use_cuda --indir examples/grays --outdir examples/outs-colorization
python demo.py --task FaceInpainting --model GPEN-Inpainting-1024 --in_size 1024 --use_cuda --indir examples/ffhq-10 --outdir examples/outs-inpainting
python demo.py --task Segmentation2Face --model GPEN-Seg2face-512 --in_size 512 --use_cuda --indir examples/segs --outdir examples/outs-seg2face
```
### Installing H2testw
Download [h2testw_*.zip](https://h2testw.org)
```powershell
mkdir D:/portable/H2testw
7z x h2testw_*.zip -oD:/portable/H2testw
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/H2testw.lnk')
$lnk.TargetPath='D:/portable/H2testw/h2testw.exe'
$lnk.Save()
```
### Installing hashcat
Download [hashcat-*.7z](https://github.com/hashcat/hashcat/releases)
```powershell
7z x hashcat-*.7z -oD:/portable
Rename-Item D:/portable/hashcat-* hashcat
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\hashcat"
```
### Installing JDM Drift
Download [JDM Drift Build DEMO.zip](https://howdyho.net/windows-software/demka-drift-igry-na-unity-eksperiment-v2)
```powershell
mkdir 'D:/portable/JDM Drift'
7z x 'JDM Drift Build DEMO.zip' -o'D:/portable/JDM Drift'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/JDM Drift.lnk')
$lnk.TargetPath='D:/portable/JDM Drift/JDM Drift.exe'
$lnk.Save()
```
### Installing Kiwix
Download [kiwix-desktop_windows_x64_*.zip](https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_windows_x64.zip)
```powershell
mkdir D:/portable/Kiwix
7z x kiwix-desktop_windows_x64_*.zip -oD:/portable/Kiwix
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Kiwix.lnk')
$lnk.TargetPath='D:/portable/Kiwix/kiwix-desktop.exe'
$lnk.Save()
```
### Installing KruTube
Download [krutube_*.zip](https://www.krutube.pro/en/download)
```powershell
7z x krutube_*.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/KruTube.lnk')
$lnk.TargetPath='D:/portable/KruTube/KruTube.exe'
$lnk.Save()
```
### Installing LinpackXtreme (Internet access required)
Download [LinpackXtreme-*.zip](https://www.majorgeeks.com/mg/getmirror/linpack_xtreme,1.html)
```powershell
mkdir D:/portable/LinpackXtreme
7z x LinpackXtreme-*.zip -oD:/portable/LinpackXtreme
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/LinpackXtreme.lnk')
$lnk.TargetPath='D:/portable/LinpackXtreme/LinpackXtreme_x64.exe'
$lnk.WorkingDirectory='D:/portable/LinpackXtreme'
$lnk.Save()
```
Open `LinpackXtreme`

Press Enter
### Installing Looping
Download [Looping.zip](https://looping.net/Looping.zip)
```powershell
mkdir D:/portable/Looping
7z x Looping.zip -oD:/portable/Looping
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Looping.lnk')
$lnk.TargetPath='D:/portable/Looping/Looping.exe'
$lnk.Save()
```
### Installing MagicaVoxel
Download [MagicaVoxel-*-win64.zip](https://github.com/ephtracy/ephtracy.github.io/releases)
```powershell
7z x MagicaVoxel-*-win64.zip -oD:/portable
Rename-Item D:/portable/MagicaVoxel-*-win64 MagicaVoxel
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/MagicaVoxel.lnk')
$lnk.TargetPath='D:/portable/MagicaVoxel/MagicaVoxel.exe'
$lnk.Save()
```
### Installing NotEnoughAV1Encodes
Download [neav1e-portable-*.7z](https://github.com/Alkl58/NotEnoughAV1Encodes/releases)
```powershell
mkdir D:/portable/NotEnoughAV1Encodes
7z x neav1e-portable-*.7z -oD:/portable/NotEnoughAV1Encodes
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/NotEnoughAV1Encodes.lnk')
$lnk.TargetPath='D:/portable/NotEnoughAV1Encodes/NotEnoughAV1Encodes.exe'
$lnk.Save()
```
### Installing NVIDIA Profile Inspector (Internet access required)
Download [nvidiaProfileInspector.zip](https://github.com/Orbmu2k/nvidiaProfileInspector/releases)
```powershell
mkdir D:/portable/nvidiaProfileInspector
7z x nvidiaProfileInspector.zip -oD:/portable/nvidiaProfileInspector
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/NVIDIA Profile Inspector.lnk')
$lnk.TargetPath='D:/portable/nvidiaProfileInspector/nvidiaProfileInspector.exe'
$lnk.Save()
```
### Installing Oculante
Download [oculante.exe](https://github.com/woelper/oculante/releases)
```powershell
mkdir D:/portable/Oculante
copy oculante.exe D:/portable/Oculante
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Oculante.lnk')
$lnk.TargetPath='D:/portable/Oculante/oculante.exe'
$lnk.Save()
```
Open `Oculante`

Click $\equiv$ icon

Click `Preferences`

Click `Visual`

Click `Accent color`

Click `R 255`

Type `135`

Click `G 0`

Type `100`

Click `B 75`

Type `184`

Window title `{FULLPATH}`
### Installing PhantomJS 2.1.1
Download [phantomjs-2.1.1-windows.zip](https://phantomjs.org/download.html)
```powershell
7z x phantomjs-2.1.1-windows.zip -oD:/portable
Rename-Item D:/portable/phantomjs-2.1.1-windows phantomjs
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\phantomjs\bin"
```
### Installing Process Hacker 2.39
Download [processhacker-2.39-bin.zip](https://sourceforge.net/projects/processhacker/files/processhacker2/processhacker-2.39-bin.zip/download)
```powershell
mkdir 'D:/portable/Process Hacker 2'
7z x processhacker-2.39-bin.zip -o'D:/portable/Process Hacker 2'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Process Hacker.lnk')
$lnk.TargetPath='D:/portable/Process Hacker 2/x64/ProcessHacker.exe'
$lnk.Save()
```
### Installing SmoothDraw 4.0.5
Download [SmoothDraw4.zip](https://qrli.github.io/smoothdraw/SmoothDraw4.zip)
```powershell
mkdir D:/portable/SmoothDraw
7z x SmoothDraw4.zip -oD:/portable/SmoothDraw
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/SmoothDraw.lnk')
$lnk.TargetPath='D:/portable/SmoothDraw/SmoothDraw4.exe'
$lnk.Save()
```
### Installing TerraMap
Download [TerraMap-*.zip](https://terramap.github.io/windows.html)
```powershell
7z x TerraMap-*.zip -oD:/portable
Rename-Item D:/portable/TerraMap-* TerraMap
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/TerraMap.lnk')
$lnk.TargetPath='D:/portable/TerraMap/TerraMap.exe'
$lnk.Save()
```
### Installing USBWebserver
Download [USBWebServer.zip](https://github.com/grimgravy/USBWebServer/releases)
```powershell
7z x USBWebServer.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/USBWebServer.lnk')
$lnk.TargetPath='D:/portable/USBWebServer/usbwebserver.exe'
$lnk.Save()
```
Open `USBWebServer`

Click `Allow`

Click `Allow`

Click ▾ icon

Click `English`

Click `PHPMyAdmin`

Username: `root`

Password: `your_password`

Click `Log in`

Select `Original` for Theme`
### Installing Voice Changer Client Demo 1.5.3.15
Download [MMVCServerSIO_win_onnxgpu-cuda_v.1.5.3.15.zip](https://huggingface.co/wok000/vcclient000/blob/main/MMVCServerSIO_win_onnxgpu-cuda_v.1.5.3.15.zip)
```powershell
7z x MMVCServerSIO_win_onnxgpu-cuda_v.1.5.3.15.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Voice Changer.lnk')
$lnk.TargetPath='D:/portable/MMVCServerSIO/MMVCServerSIO.exe'
$lnk.Save()
```
### Installing VOVSOFT - File Splitter And Joiner
Download [file-splitter-and-joiner-portable.zip](https://files.vovsoft.com/file-splitter-and-joiner-portable.zip)
```powershell
mkdir 'D:/portable/File Splitter And Joiner'
7z x file-splitter-and-joiner-portable.zip -o'D:/portable/File Splitter And Joiner'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/File Splitter And Joiner.lnk')
$lnk.TargetPath='D:/portable/File Splitter And Joiner/filesplitjoin.exe'
$lnk.Save()
```
### Installing wCopy NFC Reader Read and Write Tool
Download [nfcPro_x64.exe](https://www.xixei.com/nfc/tool/soft/down_enus.html)
```powershell
mkdir 'D:/portable/wCopy NFC Reader Read and Write Tool'
copy nfcPro_x64.exe 'D:/portable/wCopy NFC Reader Read and Write Tool'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/wCopy NFC Reader Read and Write Tool.lnk')
$lnk.TargetPath='D:/portable/wCopy NFC Reader Read and Write Tool/nfcPro_x64.exe'
$lnk.Save()
```
### Installing y-cruncher
Download [y-cruncher.v*.zip](https://github.com/Mysticial/y-cruncher/releases)
```powershell
7z x y-cruncher.v*.zip -oD:/portable
Rename-Item 'D:/portable/y-cruncher v*' y-cruncher
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/y-cruncher.lnk')
$lnk.TargetPath='D:/portable/y-cruncher/y-cruncher.exe'
$lnk.Save()
```
## Paid Portable
### Installing 4K Stogram Professional License
Open `4K Stogram Professional` installer
### Installing 4K Video Downloader Plus Professional License
Open `4K Video Downloader+` installer
### Installing 4K Video Downloader Professional License 4.33.5
Open `4K Video Downloader 4.33.5` installer
### Installing Adobe Acrobat Pro DC 2021.007.20102
Open `Adobe Acrobat Pro 2021.007.20102` installer
### Installing Adobe Illustrator 2023 27.0.1.620
Open `Adobe Illustrator 2023 27.0.1.620` installer
### Installing Adobe Lightroom Classic 11.0.1.10
Open `Adobe Photoshop Lightroom Classic 11.0.1.10` installer
### Installing Adobe Photoshop 2024 25.1.0.120
Open `Adobe Photoshop 2024 25.1.0.120` installer
### Installing AIDA64 Extreme
Open `AIDA64 Extreme` installer
### Installing AS SSD Benchmark
Open `AS SSD Benchmark` installer
### Installing Bandicam
Open `Bandicam` installer
### Installing Google Earth Pro
Open `Google Earth Pro` installer
### Installing iZotope RX 11 Advanced Audio Editor 11.3.0
Open `iZotope RX 11 Audio Editor Advanced 11.3.0` installer
### Installing Movavi Video Converter Premium 22.5
Open `Movavi Video Converter 22.5` installer
### Installing PassMark PerformanceTest 10.2
Open `PassMark PerformanceTest 10.2` installer
### Installing Piriform CCleaner - Professional Edition
Open `CCleaner` installer
### Installing Sejda PDF Desktop 7.7.0
Open `Sejda PDF Desktop 7.7.0` installer
### Installing Similarity 2.2.0
Open `Similarity 2.2.0` installer
### Installing TechSmith Camtasia Studio 23.4.1
Open `TechSmith Camtasia Studio 23.4.1` installer
### Installing Topaz Adjust AI 1.0.6
Open `Topaz Adjust AI 1.0.6` installer
### Installing Topaz DeNoise AI 3.7.2
Open `Topaz DeNoise AI 3.7.2` installer
### Installing Topaz Gigapixel
Open `Topaz Gigapixel` installer
### Installing Topaz Gigapixel AI
Open `Topaz Gigapixel AI` installer
### Installing Topaz Mask AI 1.3.9
Open `Topaz Mask AI 1.3.9` installer
### Installing Topaz Photo
Open `Topaz Photo` installer
### Installing Topaz Photo AI
Open `Topaz Photo AI` installer
### Installing Topaz Sharpen AI 4.0.2
Open `Topaz Sharpen AI 4.0.2` installer
### Installing Topaz Video
Open `Topaz Video` installer
### Installing Topaz Video AI
Open `Topaz Video AI` installer
### Installing Total Commander
Open `Total Commander Extended 64-bit` installer
### Installing Uninstall Tool
Open `Uninstall Tool` installer
### Installing WinRAR 7.13
Open `WinRAR 7.13 (64-bit)` installer
### Installing Wondershare PDFelement 11.4.6
Open `Wondershare PDFelement Pro 11.4.6` installer
### Installing ZBrush 2023.1.1
Open `ZBrush 2023.1.1` installer
## Winget
### Installing ActivityWatch
```powershell
winget install -e --id ActivityWatch.ActivityWatch
```
Or

Download [activitywatch-v*-windows-x86_64.zip](https://github.com/ActivityWatch/activitywatch/releases)
```powershell
7z x activitywatch-v*-windows-x86_64.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ActivityWatch.lnk')
$lnk.TargetPath='D:/portable/activitywatch/aw-qt.exe'
$lnk.Save()
copy D:/portable/ActivityWatch.lnk 'C:/ProgramData/Microsoft/Windows/Start Menu/Programs/Startup'
```
### Installing AdGuard
```powershell
winget install -e --id AdGuard.AdGuard
```
Or

Download [AdGuard-*.exe](https://github.com/AdguardTeam/AdguardForWindows/releases)

Open `AdGuard-*.exe`

Click `Install`

Click `Leave as it is`
### Installing AdGuard VPN
```powershell
winget install -e --id AdGuard.AdGuardVPN
```
Or

Download [AdGuardVpn-*.exe](https://github.com/AdguardTeam/AdGuardVPNForWindows/releases)

Open `AdGuardVpn-*.exe`

Click `Install`

Click `Close`
### Configuring AdGuard VPN (Internet access required)
Click `I accept the AdGuard VPN EULA and Privacy policy`

Click `Log in or create an account`

Email `your_email`

Click `Continue`

Password `your_password`

Click `Continue`

Click `Open`

Click `Stay with free version`

Click `Settings`

Click `App settings`

Click `Launch app on system startup`

Turn off `Launch app on system startup`

Click < icon

Click `Advanced settings`

Turn on `Post-quantum cryptography`

Turn on `Use Wintun`
### Installing AIMP
```powershell
winget install -e --id AIMP.AIMP
```
Or

Download [aimp_*_w64_no-installer.zip](https://aimp.ru/?do=download&os=windows)
```powershell
7z x aimp_*_w64_no-installer.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/AIMP.lnk')
$lnk.TargetPath='D:/portable/AIMP/AIMP.exe'
$lnk.Save()
```
### Installing Kindle
```powershell
winget install -e --id Amazon.Kindle
```
Or

Download [KindleForPC-installer-*.exe](https://www.amazon.com/kindlepcdownload)

Open `KindleForPC-installer-*.exe`
### Installing Android SDK Platform-Tools
```powershell
winget install -e --id Google.PlatformTools
```
Or

Download [platform-tools-latest-windows.zip](https://dl.google.com/android/repository/platform-tools-latest-windows.zip)
```powershell
7z x platform-tools-latest-windows.zip -oD:/portable
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\platform-tools"
```
### Installing Android Studio
```powershell
winget install -e --id Google.AndroidStudio
```
Or

Download [android-studio-*-windows.zip](https://developer.android.com/studio)
```powershell
7z x android-studio-*-windows.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Android Studio.lnk')
$lnk.TargetPath='D:/portable/android-studio/bin/studio64.exe'
$lnk.Save()
```
### Installing Anki
```powershell
winget install -e --id Anki.Anki
```
Or

Download [anki-*-win-x64.msi](https://github.com/ankitects/anki/releases)

Open `anki-*-win-x64.msi`

Click `Next`

Turn on `I accept the terms in the License Agreement`

Click `Next`

Click `Install for all users of this machine`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Click `Finish`
### Installing Antutu Benchmark
```powershell
winget install -e --id Antutu.AntutuBenchmark
```
Or

Download [AntutuBenchmark_x64_Setup.exe](https://file.antutu.com/soft2/AntutuBenchmark_x64_Setup.exe)

Click `Install`

Turn off `Run Antutu Benchmark`

Click `Finish`
### Installing AnyDesk
```powershell
winget install -e --id AnyDesk.AnyDesk
```
Or

Download [AnyDesk.exe](https://download.anydesk.com/AnyDesk.exe)
```powershell
mkdir D:/portable/AnyDesk
copy AnyDesk.exe D:/portable/AnyDesk
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/AnyDesk.lnk')
$lnk.TargetPath='D:/portable/AnyDesk/AnyDesk.exe'
$lnk.Save()
```
### Installing Arduino IDE
```powershell
winget install -e --id ArduinoSA.IDE.stable
```
Or

Download [arduino-ide_*_Windows_64bit.zip](https://github.com/arduino/arduino-ide/releases)
```powershell
mkdir 'D:/portable/Arduino IDE'
7z x arduino-ide_*_Windows_64bit.zip -o'D:/portable/Arduino IDE'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Arduino IDE.lnk')
$lnk.TargetPath='D:/portable/Arduino IDE/Arduino IDE.exe'
$lnk.Save()
```
### Installing Audacity
```powershell
winget install -e --id Audacity.Audacity
```
Or

Download [audacity-win-*-64bit.zip](https://github.com/audacity/audacity/releases)
```powershell
7z x audacity-win-*-64bit.zip -oD:/portable
Rename-Item D:/portable/audacity-win-*-64bit audacity
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Audacity.lnk')
$lnk.TargetPath='D:/portable/audacity/Audacity.exe'
$lnk.Save()
```
### Installing balenaEtcher
```powershell
winget install -e --id Balena.Etcher
```
Or

Download [balenaEtcher-win32-x64-*.zip](https://github.com/balena-io/etcher/releases)
```powershell
mkdir D:/portable/balena_etcher
7z x balenaEtcher-win32-x64-*.zip -oD:/portable/balena_etcher
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/balenaEtcher.lnk')
$lnk.TargetPath='D:/portable/balena_etcher/balenaEtcher.exe'
$lnk.Save()
```
### Installing Bambu Studio
```powershell
winget install -e --id Bambulab.Bambustudio
```
Or

Download [Bambu_Studio_win-v*.zip](https://github.com/bambulab/BambuStudio/releases)
```powershell
mkdir 'D:/portable/Bambu Studio'
7z x Bambu_Studio_win-v*.zip -o'D:/portable/Bambu Studio'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Bambu Studio.lnk')
$lnk.TargetPath='D:/portable/Bambu Studio/bambu-studio.exe'
$lnk.Save()
```
### Installing Binary Ninja
```powershell
winget install -e --id Vector35.BinaryNinja
```
Or

Download [binaryninja_free_win64.exe](https://cdn.binary.ninja/installers/binaryninja_free_win64.exe)

Open `binaryninja_free_win64.exe`

Click `Next`

Click `I Agree`

Select `Install for anyone using this computer`

Click `Next`

Click `Install`

Click `Finish`
### Installing Bitwarden
```powershell
winget install -e --id Bitwarden.Bitwarden
```
Or

Download [bitwarden-*-x64.nsis.7z](https://github.com/bitwarden/clients/releases)
```powershell
mkdir D:/portable/Bitwarden
7z x bitwarden-*-x64.nsis.7z -oD:/portable/Bitwarden
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Bitwarden.lnk')
$lnk.TargetPath='D:/portable/Bitwarden/Bitwarden.exe'
$lnk.Save()
copy D:/portable/Bitwarden.lnk 'C:/ProgramData/Microsoft/Windows/Start Menu/Programs/Startup'
```
### Configuring Bitwarden
Open `Bitwarden`

Email address `your_email`

Turn on `Remember email`

Click `Continue`

Master password `your_password`

Click `Log in`

Click `File`

Click `Settings`

Select `On system lock` for `Timeout`

Turn on `Unlock with Windows Hello`

Click `Preferences`

Select `10 seconds` for `Clear clipboard`

Click `App settings (all accounts)`

Turn on `Minimize to tray icon`

Turn on `Allow browser integration`
### Installing BlueStacks (Internet access required)
```powershell
winget install -e --id BlueStack.BlueStacks
```
Or

Download [BlueStacksInstaller_5.*_native.exe](https://cloud.bluestacks.com/api/getdownloadnow?platform=win)

Open `BlueStacksInstaller_5.*_native.exe`
### Installing Brother iPrint&Scan
```powershell
winget install -e --id Brother.iPrintScan
```
Or

Download [iPrintScan-Setup-*.exe](https://www.brother.fr/services-et-supports/ds640/downloads)

Open `iPrintScan-Setup-*.exe`

Turn on `I agree to the license terms and conditions`

Click `Install`

Click `Close`
### Installing Brotli
```powershell
winget install -e --id Google.Brotli
```
Or

Download [brotli-x64-windows-static.zip](https://github.com/google/brotli/releases)
```powershell
mkdir D:/portable/brotli
7z x brotli-x64-windows-static.zip -oD:/portable/brotli
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\brotli"
```
### Installing bsc
Download [bsc-*-x64.zip](https://github.com/IlyaGrebnov/libbsc/releases)
```powershell
mkdir D:/portable/bsc
7z x bsc-*-x64.zip -oD:/portable/bsc
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\bsc"
```
### Installing bsc-m03
Download [bsc-m03-*-win64.zip](https://github.com/IlyaGrebnov/bsc-m03/releases)
```powershell
mkdir D:/portable/bsc-m03
7z x bsc-m03-*-win64.zip -oD:/portable/bsc-m03
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\bsc-m03"
```
### Installing calibre
```powershell
winget install -e --id calibre.calibre
```
Or

Download [calibre-portable-installer-*.exe](https://github.com/kovidgoyal/calibre/releases)

Open `calibre-portable-installer-*.exe`

Folder: `D:\portable`

Click `OK`

Click `No`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/calibre.lnk')
$lnk.TargetPath='D:/portable/Calibre Portable/calibre-portable.exe'
$lnk.Save()
```
### Installing CapCut (Internet access required)
```powershell
winget install -e --id ByteDance.CapCut
```
Or

Download [CapCut_*_installer.exe](https://www.capcut.com/download-guidance)

Open `CapCut_*_installer.exe`
### Installing Claude (Internet access required)
```powershell
winget install -e --id Anthropic.Claude
```
Or

Download [Claude Setup.exe](https://claude.com/download)

Open `Claude Setup.exe`
### Installing CMake
```powershell
winget install -e --id Kitware.CMake
```
Or

Download [cmake-*-windows-x86_64.zip](https://github.com/Kitware/CMake/releases)
```powershell
7z x cmake-*-windows-x86_64.zip -oD:/portable
Rename-Item D:/portable/cmake-*-windows-x86_64 cmake
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CMake (cmake-gui).lnk')
$lnk.TargetPath='D:/portable/cmake/bin/cmake-gui.exe'
$lnk.Save()
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\cmake\bin"
```
### Installing Code::Blocks with MinGW
```powershell
winget install -e --id CodeBlocks.CodeBlocks.MinGW
```
Or

Download [codeblocks-*mingw-nosetup.zip](https://sourceforge.net/projects/codeblocks/files/Binaries)
```powershell
mkdir D:/portable/CodeBlocks
7z x codeblocks-*mingw-nosetup.zip -oD:/portable/CodeBlocks
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CodeBlocks.lnk')
$lnk.TargetPath='D:/portable/CodeBlocks/codeblocks.exe'
$lnk.Save()
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\CodeBlocks\MinGW\bin"
```
### Installing Comet
```powershell
winget install -e --id Perplexity.Comet
```
Or

Download [comet_latest_intel_system.exe](https://www.perplexity.ai/rest/browser/download?platform=win_x64&channel=stable)

Open `comet_latest_intel_system.exe`

Click `Close`
### Installing CPUID CPU-Z
```powershell
winget install -e --id CPUID.CPU-Z
```
Or

Download [cpu-z_*-en.zip](https://cpuid.com/softwares/cpu-z.html)
```powershell
mkdir D:/portable/CPU-Z
7z x cpu-z_*-en.zip -oD:/portable/CPU-Z
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CPU-Z.lnk')
$lnk.TargetPath='D:/portable/CPU-Z/cpuz_x64.exe'
$lnk.Save()
```
### Installing CrystalDiskInfo
```powershell
winget install -e --id CrystalDewWorld.CrystalDiskInfo
```
Or

Download [CrystalDiskInfo*.zip](https://sourceforge.net/projects/crystaldiskinfo/files)
```powershell
mkdir D:/portable/CrystalDiskInfo
7z x CrystalDiskInfo*.zip -oD:/portable/CrystalDiskInfo
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CrystalDiskInfo.lnk')
$lnk.TargetPath='D:/portable/CrystalDiskInfo/DiskInfo64.exe'
$lnk.Save()
```
### Configuring CrystalDiskInfo
Click `Jazyk(Language)`

Click `A-N`

Click `English, [English]`
### Installing CrystalDiskMark
```powershell
winget install -e --id CrystalDewWorld.CrystalDiskMark
```
Or

Download [CrystalDiskMark*.zip](https://sourceforge.net/projects/crystaldiskmark/files)
```powershell
mkdir D:/portable/CrystalDiskMark
7z x CrystalDiskMark*.zip -oD:/portable/CrystalDiskMark
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CrystalDiskMark.lnk')
$lnk.TargetPath='D:/portable/CrystalDiskMark/DiskMark64.exe'
$lnk.Save()
```
### Installing Cursor
```powershell
winget install -e --id Anysphere.Cursor
```
Or

Download [CursorSetup-x64-*.exe](https://cursor.com/download)

Open `CursorSetup-x64-*.exe`

Click `I accept the agreement`

Click `Next`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Cursor`

Click `Finish`
### Installing Custom Resolution Utility
```powershell
winget install -e --id ToastyX.CustomResolutionUtility
```
Or

Download [cru-*.zip](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)
```powershell
mkdir D:/portable/cru
7z x cru-*.zip -oD:/portable/cru
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Custom Resolution Utility.lnk')
$lnk.TargetPath='D:/portable/cru/CRU.exe'
$lnk.Save()
```
### Installing CyberGhost (Internet access required)
```powershell
winget install -e --id CyberGhost.CyberGhost
```
Or

Download [CyberGhostVPNSetup.exe](https://download.cyberghostvpn.com/windows/CyberGhostVPNSetup.exe)

Open `CyberGhostVPNSetup.exe`
### Installing Czkawka
```powershell
winget install -e --id qarmin.czkawka.gui
```
Or

Download [windows_czkawka_gui*.zip](https://github.com/qarmin/czkawka/releases)
```powershell
mkdir D:/portable/czkawka
7z x windows_czkawka_gui*.zip -oD:/portable/czkawka
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Czkawka.lnk')
$lnk.TargetPath='D:/portable/czkawka/czkawka_gui.exe'
$lnk.Save()
```
### Installing DB Browser for SQLite
```powershell
winget install -e --id DBBrowserForSQLite.DBBrowserForSQLite
```
Or

Download [DB.Browser.for.SQLite-v*-win64.zip](https://github.com/sqlitebrowser/sqlitebrowser/releases)
```powershell
mkdir 'D:/portable/DB Browser for SQLite'
7z x DB.Browser.for.SQLite-v*-win64.zip -o'D:/portable/DB Browser for SQLite'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/DB Browser for SQLite.lnk')
$lnk.TargetPath='D:/portable/DB Browser for SQLite/DB Browser for SQLite.exe'
$lnk.Save()
```
### Installing Devin
```powershell
winget install -e --id CognitionAI.DevinDesktop
```
Or

Download [Devin-win32-x64-*.zip](https://docs.devin.ai/desktop/releases)
```powershell
mkdir D:/portable/Devin
7z x Devin-win32-x64-*.zip -oD:/portable/Devin
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Devin.lnk')
$lnk.TargetPath='D:/portable/Devin/Devin.exe'
$lnk.Save()
```
### Installing Discord
```powershell
winget install -e --id Discord.Discord
```
Or

Download [DiscordSetup.exe](https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64)

Open `DiscordSetup.exe`
### Configuring Discord
Open `Discord`

Type `your_email`

Type `your_password`

Click `Log In`

Click ⚙️ icon

Click `Voice & Video`

Turn off `Automatically Adjust Input Sensitivity`

Select `-100dB`

Turn off `Echo Cancellation`
### Installing DiscordChatExporter.GUI
```powershell
winget install -e --id Tyrrrz.DiscordChatExporter.GUI
```
Or

Download [DiscordChatExporter.win-x64.zip](https://github.com/Tyrrrz/DiscordChatExporter/releases)
```powershell
mkdir D:/portable/DiscordChatExporter
7z x DiscordChatExporter.win-x64.zip -oD:/portable/DiscordChatExporter
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/DiscordChatExporter.lnk')
$lnk.TargetPath='D:/portable/DiscordChatExporter/DiscordChatExporter.exe'
$lnk.Save()
```
### Installing Docker Desktop
```powershell
winget install -e --id Docker.DockerDesktop
```
Or

Download [Docker Desktop Installer.exe](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)

Open `Docker Desktop Installer.exe`

Click `OK`

Click `Close and restart`
### Installing DuckDuckGo (Internet access required)
```powershell
winget install -e --id DuckDuckGo.DesktopBrowser
```
Or

Download [DuckDuckGo.Installer.exe](https://duckduckgo.com)

Open `DuckDuckGo.Installer.exe`

Turn off `Open DuckDuckGo when computer starts up`

Click `Install now`
### Installing dupeGuru
```powershell
winget install -e --id DupeGuru.DupeGuru
```
Or

Download [dupeguru-win64_*.zip](https://github.com/arsenetar/dupeguru/releases)
```powershell
7z x dupeguru-win64_*.zip -oD:/portable
Rename-Item D:/portable/dupeguru-win64_* dupeguru
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/dupeGuru.lnk')
$lnk.TargetPath='D:/portable/dupeguru/dupeguru-win64.exe'
$lnk.Save()
```
### Installing EarTrumpet
```powershell
winget install -e --id File-New-Project.EarTrumpet
```
### Installing Eclipse IDE for Java Developers
```powershell
winget install -e --id EclipseFoundation.Eclipse.Java
```
Or

Download [eclipse-java-*-R-win32-x86_64.zip](https://www.eclipse.org/downloads/packages)
```powershell
7z x eclipse-java-*-R-win32-x86_64.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Eclipse IDE for Java Developers.lnk')
$lnk.TargetPath='D:/portable/eclipse/eclipse.exe'
$lnk.Save()
```
### Installing Epic Games Launcher (Internet access required)
```powershell
winget install -e --id EpicGames.EpicGamesLauncher
```
Or

Download [EpicInstaller-*.exe](https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.exe)

Open `EpicInstaller-*.exe`
### Configuring Epic Games Launcher (Internet access required)
Type `your_email`

Click `Continue`

Type `your_password`

Click `Sign in`

Click `Allow`
### Installing Everything
```powershell
winget install -e --id voidtools.Everything
```
Or

Download [Everything-*.x64.zip](https://www.voidtools.com/downloads)
```powershell
mkdir D:/portable/Everything
7z x Everything-*.x64.zip -oD:/portable/Everything
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Everything.lnk')
$lnk.TargetPath='D:/portable/Everything/everything.exe'
$lnk.Save()
```
### Installing Exact Audio Copy
```powershell
winget install -e --id AndreWiethoff.ExactAudioCopy
```
Or

Download [eac-*.exe](https://www.exactaudiocopy.de)

Open `eac-*.exe`

Click `Next >`

Click `I Agree`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Run Exact Audio Copy *`

Click `Finish`
### Installing ExifGlass
```powershell
winget install -e --id PhapDieuDuong.ExifGlass
```
Or

Download [ExifGlass_*_x64.zip](https://github.com/d2phap/ExifGlass/releases)
```powershell
7z x ExifGlass_*_x64.zip -oD:/portable
Rename-Item D:/portable/ExifGlass_*_x64 ExifGlass
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ExifGlass.lnk')
$lnk.TargetPath='D:/portable/ExifGlass/ExifGlass.exe'
$lnk.Save()
```
### Installing ExifTool
```powershell
winget install -e --id OliverBetz.ExifTool
```
Or

Download [exiftool-*_64.zip](https://sourceforge.net/projects/exiftool/files)
```powershell
7z x exiftool-*_64.zip -oD:/portable
Rename-Item D:/portable/exiftool-*_64 exiftool
Rename-Item 'D:/portable/exiftool/exiftool(-k).exe' exiftool.exe
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\exiftool"
```
### Installing ExifToolGUI
```powershell
winget install -e --id FrankBijnen.ExifToolGUI
```
Or

Download [ExifToolGUI_X64.exe](https://github.com/FrankBijnen/ExifToolGui/releases)
```powershell
mkdir D:/portable/ExifToolGUI
copy ExifToolGUI_X64.exe D:/portable/ExifToolGUI
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ExifToolGUI.lnk')
$lnk.TargetPath='D:/portable/ExifToolGUI/ExifToolGUI_X64.exe'
$lnk.Save()
```
### Installing FFmpeg (Shared)
```powershell
winget install -e --id Gyan.FFmpeg.Shared
```
Or

Download [ffmpeg-*-full_build-shared.7z](https://github.com/GyanD/codexffmpeg/releases)
```powershell
7z x ffmpeg-*-full_build-shared.7z -oD:/portable
Rename-Item D:/portable/ffmpeg-*-full_build-shared ffmpeg
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\ffmpeg\bin"
```
### Installing Figma (Internet access required)
```powershell
winget install -e --id Figma.Figma
```
Or

Download [FigmaSetup.exe](https://desktop.figma.com/win/FigmaSetup.exe)

Open `FigmaSetup.exe`
### Installing Filius
```powershell
winget install -e --id StefanFreischlad.Filius
```
Or

Download [filius-*.zip](https://www.lernsoftware-filius.de/Herunterladen)
```powershell
mkdir D:/portable/Filius
7z x filius-*.zip -oD:/portable/Filius
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Filius.lnk')
$lnk.TargetPath='D:/portable/Filius/Filius.exe'
$lnk.Save()
```
### Installing Finite Element Method Magnetics
```powershell
winget install -e --id DavidMeeker.FEMM
```
Or

Download [femm*.exe](https://www.femm.info/doku/doku.php?id=download)

Open `femm*.exe`

Click `I accept the agreement`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `View readme.txt`

Click `Finish`
### Installing Focusrite Control 2
```powershell
winget install -e --id FocusriteAudioEngineeringLtd.FocusriteControl2
```
Or

Download [Focusrite-Control-2.exe](https://releases.focusrite.com/com.focusrite.focusrite-control/latest/Focusrite-Control-2.exe)

Open `Focusrite-Control-2.exe`

Click `OK`

Click `Install`

Click `Next`

Click `Next`

Click `I accept the agreement`

Click `Next`

Click `Install`

Click `Finish`

Click `Finish`
### Installing FontForge
```powershell
winget install -e --id FontForge.FontForge
```
Or

Download [FontForge-*-Windows-x64.exe](https://github.com/fontforge/fontforge/releases)

Open `FontForge-*-Windows-x64.exe`

Click `OK`

Click `Next`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch FontForge`

Click `Finish`
### Installing FreeCAD
```powershell
winget install -e --id FreeCAD.FreeCAD
```
Or

Download [FreeCAD_*.7z](https://github.com/FreeCAD/FreeCAD/releases)
```powershell
7z x FreeCAD_*.7z -oD:/portable
Rename-Item D:/portable/FreeCAD_* FreeCAD
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/FreeCAD.lnk')
$lnk.TargetPath='D:/portable/FreeCAD/FreeCAD.exe'
$lnk.Save()
```
### Installing Geeks3D FurMark 2
```powershell
winget install -e --id Geeks3D.FurMark.2
```
Or

Download [FurMark_2.*_win64.zip](https://www.geeks3d.com/furmark/downloads)
```powershell
7z x FurMark_2.*_win64.zip -oD:/portable
Rename-Item D:/portable/FurMark_win64 FurMark
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/FurMark.lnk')
$lnk.TargetPath='D:/portable/FurMark/FurMark_GUI.exe'
$lnk.Save()
```
### Installing GIMP
```powershell
winget install -e --id GIMP.GIMP
```
Or

Download [gimp-*-setup.exe](https://www.gimp.org/downloads)

Open `gimp-*-setup.exe`

Click `Install for all users`

Click `Customize`

Click `Next`

Click `Next`

Turn off `Translations`

Click `Next`

Click `Next`

Click `Install`

Click `Finish`
### Installing Git
```powershell
winget install -e --id Git.Git
```
Or

Download [PortableGit-*-64-bit.7z.exe](https://github.com/git-for-windows/git/releases)

Open `PortableGit-*-64-bit.7z.exe`

Where do you want to install portable Git? `D:/portable/Git`

Click `OK`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Git Bash.lnk')
$lnk.TargetPath='D:/portable/Git/git-bash.exe'
$lnk.Arguments='--cd-to-home'
$lnk.WorkingDirectory='%HOMEDRIVE%%HOMEPATH%'
$lnk.Save()
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Git CMD.lnk')
$lnk.TargetPath='D:/portable/Git/git-cmd.exe'
$lnk.Arguments='--cd-to-home'
$lnk.WorkingDirectory='%HOMEDRIVE%%HOMEPATH%'
$lnk.Save()
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Git GUI.lnk')
$lnk.TargetPath='D:/portable/Git/cmd/git-gui.exe'
$lnk.WorkingDirectory='%HOMEDRIVE%%HOMEPATH%'
$lnk.Save()
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\Git\cmd"
```
### Configuring Git
```bash
git config --global --unset-all user.email
git config --global --unset-all user.name
git config --global init.defaultBranch master
git config --global user.email email
git config --global user.name name
```
### Installing GitHub Desktop
```powershell
winget install -e --id GitHub.GitHubDesktop
```
Or

Download [GitHubDesktopSetup-x64.exe](https://desktop.github.com/download)

Open `GitHubDesktopSetup-x64.exe`

Click `Skip this step`

Click `Finish`
### Installing Google Chrome
```powershell
winget install -e --id Google.Chrome
```
Or

Download [googlechromestandaloneenterprise64.msi](https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi)

Open `googlechromestandaloneenterprise64.msi`
### Installing Google Drive
```powershell
winget install -e --id Google.GoogleDrive
```
Or

Download [GoogleDriveSetup.exe](https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe)

Open `GoogleDriveSetup.exe`

Turn off `Add desktop shortcuts to Google Docs, Sheets, and Slides`

Click `Install`

Click `Close`
### Installing grepWin
```powershell
winget install -e --id StefansTools.grepWin
```
Or

Download [grepWin-x64-*_portable.zip](https://github.com/stefankueng/grepWin/releases)
```powershell
mkdir D:/portable/grepWin
7z x grepWin-x64-*_portable.zip -oD:/portable/grepWin
Rename-Item D:/portable/grepWin/grepWin-x64-*_portable.exe grepWin.exe
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/grepWin.lnk')
$lnk.TargetPath='D:/portable/grepWin/grepWin.exe'
$lnk.Save()
```
### Installing HakuNeko
```powershell
winget install -e --id HakuNeko.HakuNeko
```
Or

Download [hakuneko-desktop_*_windows-portable_amd64.zip](https://github.com/manga-download/hakuneko/releases)
```powershell
7z x hakuneko-desktop_*_windows-portable_amd64.zip -oD:/portable
Rename-Item D:/portable/hakuneko-desktop_*_windows-portable_amd64 hakuneko
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/HakuNeko.lnk')
$lnk.TargetPath='D:/portable/hakuneko/hakuneko.exe'
$lnk.Save()
```
### Installing Hamachi
```powershell
winget install -e --id LogMeIn.Hamachi
```
Or

Download [hamachi.msi](https://secure.logmein.com/hamachi.msi)

Open `hamachi.msi`

Click `Next >`

Turn on `I have read and agree to the terms of the License Agreement`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Launch Hamachi`

Click `Finish`
### Installing HandBrake
```powershell
winget install -e --id HandBrake.HandBrake
```
Or

Download [HandBrake-*-x86_64-Win_GUI.zip](https://github.com/HandBrake/HandBrake/releases)
```powershell
7z x HandBrake-*-x86_64-Win_GUI.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/HandBrake.lnk')
$lnk.TargetPath='D:/portable/HandBrake/HandBrake.exe'
$lnk.Save()
```
### Installing Helium
```powershell
winget install -e --id ImputNet.Helium
```
Or

Download [helium_*_x64-windows.zip](https://github.com/imputnet/helium-windows/releases)
```powershell
7z x helium_*_x64-windows.zip -oD:/portable
Rename-Item D:/portable/helium_*_x64-windows helium
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Helium.lnk')
$lnk.TargetPath='D:/portable/helium/chrome.exe'
$lnk.Save()
```
### Installing HP Connectivity Kit
```powershell
winget install -e --id HP.ConnectivityKit
```
Or

Download [HP_Prime_Connectivity_Kit_x64_*.exe](https://updates.moravia-consulting.com)

Open `HP_Prime_Connectivity_Kit_x64_*.exe`

Turn on `I agree to the license terms and conditions`

Click `Install`

Click `Close`
### Installing HP Prime Virtual Calculator
```powershell
winget install -e --id HP.PrimeVirtualCalculator
```
Or

Download [HP_Prime_Virtual_Calculator_x64_*.exe](https://updates.moravia-consulting.com)

Open `HP_Prime_Virtual_Calculator_x64_*.exe`

Turn on `I agree to the license terms and conditions`

Click `Install`

Click `Close`
### Installing HWiNFO
```powershell
winget install -e --id REALiX.HWiNFO
```
Or

Download [hwi_*.zip](https://www.hwinfo.com/download)
```powershell
mkdir D:/portable/HWiNFO
7z x hwi_*.zip -oD:/portable/HWiNFO
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/HWiNFO.lnk')
$lnk.TargetPath='D:/portable/HWiNFO/HWiNFO64.exe'
$lnk.Save()
```
### Installing HxD Hex Editor
```powershell
winget install -e --id MHNexus.HxD
```
Or

Download [HxDSetup.zip](https://mh-nexus.de/downloads/HxDSetup.zip)

Open `HxDSetup.zip`

Open `HxDSetup.exe`

Click `OK`

Click `Next >`

Click `I accept the agreement`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `View readme.txt`

Turn off `Launch HxD Hex Editor`

Click `Finish`
### Installing iBackupBot for Windows
```powershell
winget install -e --id VOWSoft.iBackupBot
```
Or

Download [ibackupbot_setup.exe](https://www.icopybot.com/ibackupbot_setup.exe)

Open `ibackupbot_setup.exe`

Click `OK`

Click `Next >`

Click `I Agree`

Click `Next >`

Click `Install`

Turn off `Run iBackupBot for Windows *`

Click `Finish`
### Installing Icaros
```powershell
winget install -e --id Xanashi.Icaros
```
Or

Download [Icaros_v*.zip](https://github.com/Xanashi/Icaros/releases)
```powershell
mkdir D:/cache/icaros
mkdir D:/portable/Icaros
7z x Icaros_v*.zip -oD:/portable/Icaros
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Icaros.lnk')
$lnk.TargetPath='D:/portable/Icaros/IcarosConfig.exe'
$lnk.Save()
```
### Configuring Icaros
Open `Icaros`

Click `Continue`

Click `Got It!`

PRESET: `MOST KNOWN`

Click `3g2, 3gp, 3gp2, 3gpp, ai, aiff, amv, ape, asf, avi, avif, bik, bmp, cb7, cbr, cbz, dds, divx, dpg, dv, dvr-ms, eps, epub, evo, exr, f4v, flac, flv, gif, hdmov, heic, heif, indd, jpg, k3g, m1v, m2t, m2ts, m2v, m4b, m4p, m4v, mk3d, mka, mkv, mov, mp2v, mp3, mp4, mp4v, mpc, mpe, mpeg, mpg, mpv2, mpv4, mqv, mts, mxf, nsv, odp, ods, odt, ofr, ofs, ogg, ogm, ogv, opus, png, psd, psxprj, px, qt, ram, rm, rmvb, skm, spx, swf, tak, tif, tiff, tp, tpr, trp, ts, tta, vob, wav, webm, webp, wm, wmv, wv, xvid`

Type `;aac;jxl;m4a`

Turn on `Enable black/white frame detection`

Turn on `Display movie reel on video thumbnails`

Turn on `Use embedded Cover Art for thumbnails`

Turn on `Use any embedded image as Cover Art`

Click PROPERTIES icon

Click THUMBNAILING icon

Click PROPERTIES icon

Click `Deselect All`

Click all `Select All`

Click CACHE icon

Cache Location `D:\cache\icaros`

Press Enter

Click `Yes`

Click `THUMBNAILING`

Click `PROPERTIES`

Click `CACHE`

Click `CACHE`
### Installing ICAT
```powershell
winget install -e --id Nvidia.ICAT
```
Or

Download [ICAT-*.exe](https://www.nvidia.com/en-us/geforce/technologies/icat)

Open `ICAT-*.exe`

Click `I Agree`
### Installing iCloud
```powershell
winget install -e --id Apple.iCloud
```
### Installing ImageGlass
```powershell
winget install -e --id DuongDieuPhap.ImageGlass
```
Or

Download [ImageGlass_*_x64.zip](https://github.com/d2phap/ImageGlass/releases)
```powershell
7z x ImageGlass_*_x64.zip -oD:/portable
Rename-Item D:/portable/ImageGlass_x64 ImageGlass
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ImageGlass.lnk')
$lnk.TargetPath='D:/portable/ImageGlass/ImageGlass.exe'
$lnk.Save()
```
### Installing Inkscape
```powershell
winget install -e --id Inkscape.Inkscape
```
Or

Download [inkscape-*.7z](https://inkscape.org)
```powershell
7z x inkscape-*.7z -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Inkscape.lnk')
$lnk.TargetPath='D:/portable/inkscape/bin/inkscape.exe'
$lnk.Save()
```
### Configuring Inkscape
Open `Inkscape`

Click `Time to Draw`

Turn off `Show this every time`

Click `New Document`
### Installing iPerf3
```powershell
winget install -e --id ar51an.iPerf3
```
Or

Download [iperf-3.*-win64.zip](https://github.com/ar51an/iperf3-win-builds/releases)
```powershell
mkdir D:/portable/iperf3
7z x iperf-3.*-win64.zip -oD:/portable/iperf3
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\iperf3"
```
### Installing JetBrains dotPeek
```powershell
winget install -e --id JetBrains.dotPeek
```
Or

Download [dotPeek64.*.exe](https://www.jetbrains.com/decompiler/download/download-thanks.html?platform=windows64)
```powershell
mkdir 'D:/portable/JetBrains dotPeek'
copy dotPeek64.*.exe 'D:/portable/JetBrains dotPeek/dotPeek64.exe'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/JetBrains dotPeek.lnk')
$lnk.TargetPath='D:/portable/JetBrains dotPeek/dotPeek64.exe'
$lnk.Save()
```
### Configuring JetBrains dotPeek
Open `JetBrains dotPeek`

Click `I accept the terms of the license agreement`

Click `OK`

Click `Not specified`

Click `Europe`

Click `OK`

Scroll all down

Click `I Accept`

Click `OK`

Click `OK`
### Installing Jpegoptim
```powershell
winget install -e --id TimoKokkonen.Jpegoptim
```
Or

Download [jpegoptim-*-x64-windows.zip](https://github.com/tjko/jpegoptim/releases)
```powershell
mkdir D:/portable/jpegoptim
7z x jpegoptim-*-x64-windows.zip -oD:/portable/jpegoptim
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\jpegoptim"
```
### Installing KiCad
```powershell
winget install -e --id KiCad.KiCad
```
Or

Download [kicad-*-x86_64.exe](https://github.com/KiCad/kicad-source-mirror/releases)

Open `kicad-*-x86_64.exe`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Launch KiCad *`

Click `Finish`
### Installing Lazarus
```powershell
winget install -e --id Lazarus.Lazarus
```
Or

Download [lazarus-*-win64.exe](https://sourceforge.net/projects/lazarus/files)

Open `lazarus-*-win64.exe`

Click `OK`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Click `Finish`
### Installing libjxl
```powershell
winget install -e --id libjxl.libjxl
```
Or

Download [jxl-x64-windows-static.zip](https://github.com/libjxl/libjxl/releases)
```powershell
mkdir D:/portable/jxl
7z x jxl-x64-windows-static.zip -oD:/portable/jxl
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\jxl\bin"
```
### Installing LibreOffice
```powershell
winget install -e --id TheDocumentFoundation.LibreOffice
```
Or

Download [LibreOffice_*_Win_x86-64.msi](https://www.libreoffice.org/download)

Open `LibreOffice_*_Win_x86-64.msi`

Click `Next >`

Click `Custom`

Click `Next >`

Click all `+`

Select `This feature will be installed on local hard drive.` for `Russian` for `Dictionaries` for `Optional Components`

Select `This feature will be installed on local hard drive.` for `Ukrainian` for `Dictionaries` for `Optional Components`

Select `This feature will not be available.` for `Spanish` for `Dictionaries` for `Optional Components`

Select `This feature will not be available.` for `Online Update` for `Optional Components`

Select `This feature will not be available.` for `Quickstarter` for `Optional Components`

Select `This feature will not be available.` for `English (South Africa)` for `User interface languages`

Click `Next >`

Click `Next >`

Click `Install`

Click `Finish`
### Installing LM Studio
```powershell
mkdir D:/portable/lmstudio
```
```powershell
winget install -e --id ElementLabs.LMStudio
```
Or

Download [LM-Studio-*-x64.exe](https://lmstudio.ai/download/latest/win32/x64)

Open `LM-Studio-*-x64.exe`

Click `I Agree`

Click `Anyone who uses this computer (all users)`

Click `Next`

Click `Install`

Click `Finish`

Click `Get Started`

Click `Continue`

Turn on `Turn on Developer Mode`

Turn off `Start local LLM service on login`

Click `Continue to LM Studio`

Click My Models icon

Click ⋯ icon

Click `Change...`

Folder: `D:\lmstudio`

Click `Select Folder`

Click App Settings icon

Click `Chat`

Turn off `Move deleted chats and folders to Trash`
### Configuring LM Studio (Internet access required)
Click Start Menu icon

Type `LM Studio`

Press Enter

Click App Settings icon

Click `Runtime`

Click `Check for updates`

Click all `Update`

Click 🗙 icon

Click Chat icon

Click `Select a model to load`

Type `Qwen3.6-35B-A3B-MTP-GGUF`

Click `🔎 Search more results for "Qwen3.6-35B-A3B-MTP-GGUF"`

Select `GGUF Qwen3.6 35B A3B UD Q6_K_XL` for `Download Options`

Click `📥 Download 34.40 GB`

Click 🗙 icon

Click `Select a model to load`

Turn on `Manually choose model load parameters (or hold Alt)`

Click `Qwen3.6 35B A3B UD`

Context Length `262144`

GPU Offload `41`

Turn on `Remember settings for openai's gpt-oss 120b`

Turn on `Show advanced settings`

CPU Thread Pool Size `10`

Number of layers for which to force MoE weights onto CPU `35`

Click `Load Model`
### Installing Logi Options+ (Internet access required)
```powershell
winget install -e --id Logitech.OptionsPlus
```
Or

Download [logioptionsplus_installer.exe](https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe)

Open `logioptionsplus_installer.exe`

Click `INSTALL OPTIONS+`
### Installing LTspice
```powershell
winget install -e --id AnalogDevices.LTspice
```
Or

Download [LTspice64.msi](https://ltspice.analog.com/software/LTspice64.msi)

Open `LTspice64.msi`

Click `Next >`

Click `I accept the terms in the License Agreement`

Click `Next >`

Click `Next >`

Click `All users of this computer (administrator rights required)`

Click `Next >`

Click `Install`

Click `Finish`
### Installing Microsoft Windows Malicious Software Removal Tool
```powershell
winget install -e --id Microsoft.MaliciousSoftwareRemovalTool
```
Or

Download [Windows-KB890830-x64-V*.exe](https://www.microsoft.com/en-us/download/details.aspx?id=9905)
```powershell
mkdir 'D:/portable/Microsoft Windows Malicious Software Removal Tool'
copy Windows-KB890830-x64-V*.exe 'D:/portable/Microsoft Windows Malicious Software Removal Tool/Windows-KB890830-x64.exe'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Microsoft Windows Malicious Software Removal Tool.lnk')
$lnk.TargetPath='D:/portable/Microsoft Windows Malicious Software Removal Tool/Windows-KB890830-x64.exe'
$lnk.Save()
```
### Installing Mathpix Snipping Tool
```powershell
winget install -e --id Mathpix.MathpixSnippingTool
```
Or

Download [mathpix_snipping_tool_setup.v*.exe](https://mathpix.com/windows-guide)

Open `mathpix_snipping_tool_setup.v*.exe`

Click `Next >`

Turn off `Run at Windows startup`

Click `Next >`

Turn off `Launch Mathpix Snipping Tool`

Click `Finish`
### Installing MEGAsync
```powershell
winget install -e --id Mega.MEGASync
```
Or

Download [MEGAsyncSetup64.exe](https://mega.nz/MEGAsyncSetup64.exe)

Open `MEGAsyncSetup64.exe`

Click `OK`

Click `Next >`

Click `I Agree`

Click `Install for anyone using this computer`

Click `Next >`

Click `Install`

Turn off `Run MEGAsync *`

Click `Finish`
### Installing Microsoft Teams (Internet access required)
```powershell
winget install -e --id Microsoft.Teams
```
Or

Download [MSTeamsSetup.exe](https://statics.teams.cdn.office.net/production-windows-x86/lkg/MSTeamsSetup.exe)

Open `MSTeamsSetup.exe`
### Installing Microsoft Visual Studio Code
```powershell
winget install -e --id Microsoft.VisualStudioCode
```
Or

Download [VSCode-win32-x64-*.zip](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive)
```powershell
mkdir 'D:/portable/Microsoft VS Code'
7z x VSCode-win32-x64-*.zip -o'D:/portable/Microsoft VS Code'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/VSCode.lnk')
$lnk.TargetPath='D:/portable/Microsoft VS Code/Code.exe'
$lnk.Save()
```
### Installing MiKTeX
```powershell
winget install -e --id MiKTeX.MiKTeX
```
Or

Download [basic-miktex-*-x64.exe](https://miktex.org/download)

Click Start Menu icon

Type `Change User Account Control settings`

Press Enter

Select not `Never notify`

Click `OK`

Restart
```powershell
copy basic-miktex-*-x64.exe D:/portable/miktex-portable.exe
```
Open `miktex-portable.exe`

Turn on `I accept the MiKTeX copying conditions.`

Click `Next >`

Install MiKTeX to: `D:/portable/MiKTeX`

Click `Next >`

Click `Next >`

Click `Start`

Click `Next >`

Turn off `Check for updates now`

Click `OK`

Click `Next >`

Turn off `Tell me more`

Click `Close`

Open `Win 10 Tweaker`

Click `Yes`
#### Confidentiality
#### Context Menu
#### Interface
#### System
Turn on `Stop and disable User Account Control`

Click `Apply`
#### Services
#### Cleaner
#### Applications
#### Startup
#### Optimization
#### Virus Scanner
#### System Information
Restart
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/MiKTeX Console.lnk')
$lnk.TargetPath='D:/portable/MiKTeX/texmfs/install/miktex/bin/x64/miktex-console.exe'
$lnk.Save()
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/TeXworks.lnk')
$lnk.TargetPath='D:/portable/MiKTeX/texmfs/install/miktex/bin/x64/miktex-texworks.exe'
$lnk.Save()
del D:/portable/miktex-portable.exe
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\MiKTeX\texmfs\install\miktex\bin\x64"
```
Or

Open `basic-miktex-*-x64.exe`

Turn on `I accept the MiKTeX copying conditions.`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Start`

Click `Next >`

Turn off `Check for updates now`

Click `OK`

Click `Next >`

Turn off `Tell me more`

Click `Close`
### Installing Mine-imator
```powershell
winget install -e --id DavidNorgren.Mine-imator
```
Or

Download [Mine-imator *.zip](https://www.mineimator.com/dl/mineimator-zip)
```powershell
7z x 'Mine-imator *.zip' -oD:/portable
Rename-Item 'D:/portable/Mine-imator *' Mine-imator
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Mine-imator.lnk')
$lnk.TargetPath='D:/portable/Mine-imator/Mine-imator.exe'
$lnk.Save()
```
### Installing MinerU
```powershell
winget install -e --id OpenDataLab.MinerU
```
Or

Download [MinerU-*-setup.exe](https://mineru.net)

Open `MinerU-*-setup.exe`

Click `I Agree`

Click `Anyone who uses this computer (all users)`

Click `Next >`

Click `Install`

Turn off `Run MinerU`

Click `Finish`
### Installing Miniconda3
```powershell
winget install -e --id Anaconda.Miniconda3
```
Or

Download [Miniconda3-latest-Windows-x86_64.exe](https://anaconda.com/api/installers/Miniconda3-latest-Windows-x86_64.exe)

Open `Miniconda3-latest-Windows-x86_64.exe`

Click `Next >`

Click `I Agree`

Click `Next >`

Click `Next >`

Turn on `Clear the package cache upon completion`

Click `Install`

Click `Next >`

Turn off `Gettings started with Conda`

Turn off `Welcome to Anaconda`

Click `Finish`
### Configuring Miniconda3 (Internet access required)
Click Start Menu icon

Type `Anaconda PowerShell Prompt`

Press Enter
```powershell
conda init --condabin
conda tos accept
```
### Installing Mozilla Firefox (en-US)
```powershell
winget install -e --id Mozilla.Firefox
```
Or

Download [Firefox Setup *.exe](https://download.mozilla.org/?product=firefox-latest-ssl&os=win64)

Open `Firefox Setup *.exe`

Click `Next >`

Click `Custom`

Click `Next >`

Click `Next >`

Turn off `Install Maintenance Service`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Launch Firefox now`

Click `Finish`
### Installing Mp3tag
```powershell
winget install -e --id FlorianHeidenreich.Mp3tag
```
Or

Download [mp3tag-v*-x64-setup.exe](https://www.mp3tag.de/dodownload64.html)

Open `mp3tag-v*-x64-setup.exe`

Click `Next >`

Click `I Agree`

Click `Portable Installation`

Click `Next >`

Destination Folder `D:\portable\Mp3tag`

Click `Next >`

Click `Next >`

Turn off `Run Mp3tag v*`

Click `Finish`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Mp3tag.lnk')
$lnk.TargetPath='D:/portable/Mp3tag/Mp3tag.exe'
$lnk.Save()
```
### Installing mpv.net
```powershell
winget install -e --id mpv.net
```
Or

Download [mpv.net-v*-portable-x64.zip](https://github.com/mpvnet-player/mpv.net/releases)
```powershell
mkdir D:/portable/mpv.net
7z x mpv.net-v*-portable-x64.zip -oD:/portable/mpv.net
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/mpv.net.lnk')
$lnk.TargetPath='D:/portable/mpv.net/mpvnet.exe'
$lnk.Save()
```
### Installing MSI Afterburner
```powershell
winget install -e --id Guru3D.Afterburner
```
Or

Download [[Guru3D]-MSIAfterburnerSetup*.zip](https://www.guru3d.com/download/msi-afterburner-beta-download)

Open `[Guru3D]-MSIAfterburnerSetup*.zip`

Open `MSIAfterburnerSetup*.exe`

Click `Run`

Click `OK`

Click `Next >`

Click `I accept the terms of the License Agreement`

Click `Next >`

Turn off `RiveTuner Statistics Server`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Run MSI Afterburner`

Turn off `Show Readme`

Click `Finish`
### Installing Nextcloud
```powershell
winget install -e --id Nextcloud.NextcloudDesktop
```
Or

Download [Nextcloud-*-x64.msi](https://github.com/nextcloud-releases/desktop/releases)

Open `Nextcloud-*-x64.msi`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Nextcloud`

Click `Finish`
### Installing Node.js
```powershell
winget install -e --id OpenJS.NodeJS
```
Or

Download [node-v*-win-x64.zip](https://nodejs.org/en/download)
```powershell
7z x node-v*-win-x64.zip -oD:/portable
Rename-Item D:/portable/node-v*-win-x64 node
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\node"
```
### Installing NormCap
```powershell
winget install -e --id dynobo.NormCap
```
Or

Download [NormCap-*-x86_64-Windows.zip](https://github.com/dynobo/normcap/releases)
```powershell
7z x NormCap-*-x86_64-Windows.zip -oD:/portable
Rename-Item D:/portable/NormCap-* NormCap
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/NormCap.lnk')
$lnk.TargetPath='D:/portable/NormCap/NormCap.exe'
$lnk.Save()
```
### Installing Notepad++
```powershell
winget install -e --id Notepad++.Notepad++
```
Or

Download [npp.*.portable.x64.7z](https://github.com/notepad-plus-plus/notepad-plus-plus/releases)
```powershell
mkdir D:/portable/Notepad++
7z x npp.*.portable.x64.7z -oD:/portable/Notepad++
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Notepad++.lnk')
$lnk.TargetPath='D:/portable/Notepad++/notepad++.exe'
$lnk.Save()
```
### Installing Npcap
Download [npcap-*.exe](https://npcap.com)

Open `npcap-*.exe`

Click `I Agree`

Turn on `Support raw 802.11 traffic (and monitor mode) for wireless adapters`

Click `Install`

Click `Next >`

Click `Finish`
### Installing NVIDIA Broadcast (Internet access required)
Download [NVIDIA_Broadcast_v*.exe](https://www.nvidia.com/en-us/geforce/broadcasting/broadcast-app)

Open `NVIDIA_Broadcast_v*.exe`

Click `AGREE AND CONTINUE`

Click `Custom (Advanced)`

Turn on `Perform a clean installation`

Click `Next`
### Installing OBS Studio
```powershell
winget install -e --id OBSProject.OBSStudio
```
Or

Download [OBS-Studio-*-Windows-x64.zip](https://github.com/obsproject/obs-studio/releases)
```powershell
mkdir D:/portable/obs-studio
7z x OBS-Studio-*-Windows-x64.zip -oD:/portable/obs-studio
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/OBS Studio.lnk')
$lnk.TargetPath='D:/portable/obs-studio/bin/64bit/obs64.exe'
$lnk.Save()
```
### Installing Obsidian
```powershell
winget install -e --id Obsidian.Obsidian
```
Or

Download [Obsidian-*.exe](https://github.com/obsidianmd/obsidian-releases/releases)

Open `Obsidian-*.exe`

Click `Anyone who uses this computer (all users)`

Click `Next >`

Click `Install`

Turn off `Run Obsidian`

Click `Finish`
### Installing Ollama
```powershell
winget install -e --id Ollama.Ollama
```
Or

Download [ollama-windows-amd64.zip](https://github.com/ollama/ollama/releases)
```powershell
mkdir D:/portable/Ollama
7z x ollama-windows-amd64.zip -oD:/portable/Ollama
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\Ollama"
```
Or

Download [OllamaSetup.exe](https://github.com/ollama/ollama/releases)

Open `OllamaSetup.exe`

Click `Install`
### Installing OP Auto Clicker
```powershell
winget install -e --id OPAutoClicker.OPAutoClicker
```
Or

Download [AutoClicker.exe](https://sourceforge.net/projects/orphamielautoclicker/files)
```powershell
mkdir 'D:/portable/OP Auto Clicker'
copy AutoClicker.exe 'D:/portable/OP Auto Clicker'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/OP Auto Clicker.lnk')
$lnk.TargetPath='D:/portable/OP Auto Clicker/AutoClicker.exe'
$lnk.Save()
```
### Installing Oracle VirtualBox
```powershell
winget install -e --id Oracle.VirtualBox
```
Or

Download [VirtualBox-*-Win.exe](https://www.virtualbox.org/wiki/Downloads)

Open `VirtualBox-*-Win.exe`

Click `Next`

Click `I accept the terms of the license agreement`

Click `Next`

Click `Next`

Click `Yes`

Click `Next`

Click `Install`

Turn off `Start Oracle VirtualBox *?`

Click `Finish`
### Installing ParkControl
```powershell
winget install -e --id BitSum.ParkControl
```
Or

Download [parkcontrolsetup64.exe](https://dl.bitsum.com/files/parkcontrolsetup64.exe)

Open `parkcontrolsetup64.exe`

Click `OK`

Click `I Agree`

Turn off `Launch ParkControl`

Click `Next >`

Click `Install`
### Installing Parsec
```powershell
winget install -e --id Parsec.Parsec
```
Or

Download [parsec-windows.exe](https://builds.parsec.app/package/parsec-windows.exe)

Open `parsec-windows.exe`

Click `Next`

Click `Per Computer`

Click `Next`
### Configuring Parsec (Internet access required)
Click Start Menu icon

Type `Parsec`

Press Enter

Email `your_email`

Password `your_password`

Click `Log In`

Click `Settings`

Select `Keyboard` for `Immersive mode`

Click `Host`

Select `50 Mbps` for `Bandwidth limit`

Turn on `Constant FPS`

Turn off `Echo Cancelling`
### Installing PeaZip
```powershell
winget install -e --id Giorgiotani.Peazip
```
Or

Download [peazip_portable-*.WIN64.zip](https://github.com/peazip/PeaZip/releases)
```powershell
7z x peazip_portable-*.WIN64.zip -oD:/portable
Rename-Item D:/portable/peazip_portable-*.WIN64 peazip
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/PeaZip.lnk')
$lnk.TargetPath='D:/portable/peazip/peazip.exe'
$lnk.Save()
```
### Installing Prime95
```powershell
winget install -e --id mersenne.prime95
```
Or

Download [p95v*.win64.zip](https://www.mersenne.org/download)
```powershell
mkdir D:/portable/prime95
7z x p95v*.win64.zip -oD:/portable/prime95
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Prime95.lnk')
$lnk.TargetPath='D:/portable/prime95/prime95.exe'
$lnk.Save()
```
### Installing PuTTY
```powershell
winget install -e --id PuTTY.PuTTY
```
Or

Download [putty.zip](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
```powershell
mkdir D:/portable/PuTTY
7z x putty.zip -oD:/portable/PuTTY
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/PuTTY.lnk')
$lnk.TargetPath='D:/portable/PuTTY/PUTTY.EXE'
$lnk.Save()
```
### Installing qBittorrent (libtorrent 2)
```powershell
winget install -e --id qBittorrent.qBittorrent.lt2
```
Or

Download [qbittorrent_*_lt20_x64_setup.exe](https://sourceforge.net/projects/qbittorrent/files/qbittorrent-win32)

Open `qbittorrent_*_lt20_x64_setup.exe`

Click `OK`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Launch qBittorrent.`

Click `Finish`
### Installing qView
```powershell
winget install -e --id jurplel.qView
```
Or

Download [qView-*-win64.zip](https://github.com/jurplel/qView/releases)
```powershell
7z x qView-*-win64.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/qView.lnk')
$lnk.TargetPath='D:/portable/qView/qView.exe'
$lnk.Save()
rmdir D:/portable/__MACOSX -Recurse
```
### Installing Raspberry Pi Imager
```powershell
winget install -e --id RaspberryPiFoundation.RaspberryPiImager
```
Or

Download [imager-v*.exe](https://github.com/raspberrypi/rpi-imager/releases)

Open `imager-v*.exe`

Click `OK`

Click `Next`

Click `I accept the agreement`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Raspberry Pi Imager`

Click `Finish`
### Installing Python 3.13
Download [python-3.13.*-amd64.exe](https://www.python.org/downloads/windows)

Open `python-3.13.*-amd64.exe`

Turn on `Use admin privileges when installing py.exe`

Turn on `Add python.exe to PATH`

Click `Install Now`

Click `Close`
### Installing Rivatuner Statistics Server
```powershell
winget install -e --id Guru3D.RTSS
```
Or

Download [[Guru3D]-RTSSSetup*.zip](https://www.guru3d.com/download/rtss-rivatuner-statistics-server-download)

Open `[Guru3D]-RTSSSetup*.zip`

Open `RTSSSetup*.exe`

Click `Run`

Click `OK`

Click `Next >`

Click `I accept the terms of the License Agreement`

Click `Next >`

Click `Next >`

Click `Next >`

Turn off `Show Readme`

Click `Finish`
### Installing Rufus
Download [rufus-*p.exe](https://github.com/pbatard/rufus/releases)
```powershell
mkdir D:/portable/Rufus
copy rufus-*p.exe D:/portable/Rufus/rufus.exe
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Rufus.lnk')
$lnk.TargetPath='D:/portable/Rufus/rufus.exe'
$lnk.Save()
```
### Installing Samsung Magician
Download [Samsung_Magician_Installer_Official_*.exe](https://semiconductor.samsung.com/consumer-storage/support/tools)

Open `Samsung_Magician_Installer_Official_*.exe`

Click `OK`

Click `Yes`

Click `Next`

Click `I accept the agreement`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Samsung Magician`

Click `Settings`

Turn off `Run at Startup`

Click `Save`

Click `Finish`
### Installing SimpleTex
```powershell
winget install -e --id SimpleTex.SimpleTex
```
Or

Download [SimpleTex Setup *.exe](https://gitee.com/simpletex/simple-tex-download/releases)

Open `SimpleTex Setup *.exe`

Click `Install`

Turn off `Run SimpleTex`

Click `Finish`
### Installing Spacedrive
```powershell
winget install -e --id spacedrive.Spacedrive
```
Or

Download [Spacedrive-windows-x86_64.msi](https://github.com/spacedriveapp/spacedrive/releases)

Open `Spacedrive-windows-x86_64.msi`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Spacedrive`

Click `Finish`
### Installing Speedtest by Ookla
```powershell
winget install -e --id Ookla.Speedtest.Desktop
```
Or

Download [speedtestbyookla_x64.msi](https://install.speedtest.net/app/windows/latest/speedtestbyookla_x64.msi)

Open `speedtestbyookla_x64.msi`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Launch Speedtest by Ookla`

Click `Finish`
### Installing Spek
```powershell
winget install -e --id AlexanderKojevnikov.Spek
```
Or

Download [spek-*.zip](https://github.com/alexkay/spek/releases)
```powershell
7z x spek-*.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Spek.lnk')
$lnk.TargetPath='D:/portable/Spek/spek.exe'
$lnk.Save()
```
### Installing Steam
```powershell
winget install -e --id Valve.Steam
```
Or

Download [SteamSetup.exe](https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe)

Open `SteamSetup.exe`

Click `Next >`

Click `Next >`

Click `Install`

Turn off `Run Steam`

Click `Finish`
### Installing Studio
```powershell
winget install -e --id BrickLink.Studio
```
Or

Download [Studio+2.0.exe](https://studio.download.bricklink.info/Studio2.0/Studio+2.0.exe)

Open `Studio+2.0.exe`

Click `I accept the agreement`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Install`

Click `Finish`
### Installing System Informer
```powershell
winget install -e --id WinsiderSS.SystemInformer
```
Or

Download [systeminformer-*-release-bin.zip](https://github.com/winsiderss/systeminformer/releases)
```powershell
mkdir D:/portable/SystemInformer
7z x systeminformer-*-release-bin.zip -oD:/portable/SystemInformer
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/System Informer.lnk')
$lnk.TargetPath='D:/portable/SystemInformer/amd64/SystemInformer.exe'
$lnk.Save()
```
### Installing TechPowerUp GPU-Z
```powershell
winget install -e --id TechPowerUp.GPU-Z
```
Or

Download [GPU-Z.*.exe](https://www.techpowerup.com/download/techpowerup-gpu-z)
```powershell
mkdir 'D:/portable/TechPowerUp GPU-Z'
copy GPU-Z.*.exe 'D:/portable/TechPowerUp GPU-Z/GPU-Z.exe'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/TechPowerUp GPU-Z.lnk')
$lnk.TargetPath='D:/portable/TechPowerUp GPU-Z/GPU-Z.exe'
$lnk.Save()
```
### Configuring TechPowerUp GPU-Z
Open `TechPowerUp GPU-Z`

Click `No`
### Installing Telegram
```powershell
winget install -e --id Telegram.TelegramDesktop
```
Or

Download [tportable-x64.*.zip](https://github.com/telegramdesktop/tdesktop/releases)
```powershell
7z x tportable-x64.*.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Telegram.lnk')
$lnk.TargetPath='D:/portable/Telegram/Telegram.exe'
$lnk.Save()
```
### Installing GraalVM CE Gluon 23+25.1
Download [graalvm-java23-windows-amd64-gluon-23+25.1-dev.zip](https://github.com/gluonhq/graal/releases)
```powershell
7z x graalvm-java23-windows-amd64-gluon-23+25.1-dev.zip -oD:/portable
```
```cmd
setx /M GRAALVM_HOME "D:\portable\graalvm-java23-windows-amd64-gluon-23+25.1-dev"
```
### Installing TeXworks
```powershell
winget install -e --id TUG.TeXworks
```
Or

Download [TeXworks-win10-*.zip](https://github.com/TeXworks/texworks/releases)
```powershell
mkdir D:/portable/TeXworks
7z x TeXworks-win10-*.zip -oD:/portable/TeXworks
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/TeXworks.lnk')
$lnk.TargetPath='D:/portable/TeXworks/TeXworks.exe'
$lnk.Save()
```
Or

Follow [Installing MiKTeX](WINDOWS.md)
### Installing The Silver Searcher
```powershell
winget install -e --id JFLarvoire.Ag
```
Or

Download [ag.zip](https://github.com/JFLarvoire/the_silver_searcher/releases)
```powershell
mkdir D:/portable/ag
7z x ag.zip -oD:/portable/ag
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\ag\WIN64"
```
### Installing Thio's SVG Thumbnail Extension
```powershell
winget install -e --id ThioJoe.SvgThumbnailExtension
```
Or

Download [SVG-Thumbnail-Extension-Installer_*_x64.msi](https://github.com/ThioJoe/win-svg-thumbs-rust/releases)

Open `SVG-Thumbnail-Extension-Installer_*_x64.msi`

Click `Next`

Click `Install`

Click `Finish`
### Installing ThrottleStop
```powershell
winget install -e --id TechPowerUp.ThrottleStop
```
Or

Download [ThrottleStop_*.zip](https://www.techpowerup.com/download/techpowerup-throttlestop)
```powershell
mkdir D:/portable/ThrottleStop
7z x ThrottleStop_*.zip -oD:/portable/ThrottleStop
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/ThrottleStop.lnk')
$lnk.TargetPath='D:/portable/ThrottleStop/ThrottleStop.exe'
$lnk.Save()
```
### Installing Tor Browser
```powershell
winget install -e --id TorProject.TorBrowser
```
Or

Download [tor-browser-windows-x86_64-portable-*.exe](https://www.torproject.org/download)

Open `tor-browser-windows-x86_64-portable-*.exe`

Click `OK`

Destination Folder `D:\portable\Tor Browser`

Click `Install`

Turn off `Run Tor Browser`

Click `Finish`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Tor Browser.lnk')
$lnk.TargetPath='D:/portable/Tor Browser/firefox.exe'
$lnk.Save()
```
### Installing Ultimate Vocal Remover
```powershell
winget install -e --id Anjok07.UltimateVocalRemover
```
Or

Download [UVR_v*_setup.exe](https://github.com/Anjok07/ultimatevocalremovergui/releases)

Open `UVR_v*_setup.exe`

Click `I accept the agreement`

Click `Next`

Click `Next`

Click `Next`

Click `Install`

Turn off `Launch Ultimate Vocal Remover`

Click `Finish`
### Installing Unity 2020.3.12f1
```powershell
winget install -e --id Unity.Unity.2020 -v "2020.3.12f1"
```
Or

Download [UnitySetup64-2020.3.12f1.exe](https://download.unity3d.com/download_unity/b3b2c6512326/Windows64EditorInstaller/UnitySetup64-2020.3.12f1.exe)

Open `UnitySetup64-2020.3.12f1.exe`

Click `Next >`

Turn on `I accept the terms of the License Agreement`

Click `Next >`

Click `Next >`

Click `Next >`

Click `Finish`
### Installing Unity Hub
```powershell
winget install -e --id Unity.UnityHub
```
Or

Download [UnityHubSetup-x64.exe](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup-x64.exe)

Open `UnityHubSetup-x64.exe`

Click `I Agree`

Click `Install`

Turn off `Run Unity Hub`

Click `Finish`
### Installing Universal Android Debloater Next Generation
```powershell
winget install -e --id Universal-Debloater-Alliance.uad-ng
```
Or

Download [uad-ng-windows.exe](https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases)
```powershell
mkdir 'D:/portable/Universal Android Debloater Next Generation'
copy uad-ng-windows.exe 'D:/portable/Universal Android Debloater Next Generation'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Universal Android Debloater Next Generation.lnk')
$lnk.TargetPath='D:/portable/Universal Android Debloater Next Generation/uad-ng-windows.exe'
$lnk.Save()
```
### Installing USB Device Tree Viewer
Download [UsbTreeView_x64.zip](https://www.uwe-sieber.de/files/UsbTreeView_x64.zip)
```powershell
mkdir 'D:/portable/USB Device Tree Viewer'
7z x UsbTreeView_x64.zip -o'D:/portable/USB Device Tree Viewer'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/USB Device Tree Viewer.lnk')
$lnk.TargetPath='D:/portable/USB Device Tree Viewer/UsbTreeView.exe'
$lnk.Save()
```
### Installing Ventoy
```powershell
winget install -e --id Ventoy.Ventoy
```
Or

Download [ventoy-*-windows.zip](https://github.com/ventoy/Ventoy/releases)
```powershell
7z x ventoy-*-windows.zip -oD:/portable
Rename-Item D:/portable/ventoy-* ventoy
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Ventoy.lnk')
$lnk.TargetPath='D:/portable/ventoy/Ventoy2Disk.exe'
$lnk.Save()
```
### Installing VeraCrypt
```powershell
winget install -e --id IDRIX.VeraCrypt
```
Or

Download [VeraCrypt.Setup.*.exe](https://github.com/veracrypt/VeraCrypt/releases)

Open `VeraCrypt.Setup.*.exe`

Click `OK`

Turn on `I accept the license terms`

Click `Next >`

Click `Next >`

Click `Install`

Click `OK`

Click `Finish`

Click `No`
### Installing Viber (Internet access required)
```powershell
winget install -e --id Rakuten.Viber
```
Or

Download [ViberSetup.exe](https://download.cdn.viber.com/desktop/windows/ViberSetup.exe)

Open `ViberSetup.exe`

Click `Install`
### Installing Victoria
```powershell
winget install -e --id Victoria.Victoria
```
Or

Download [Victoria*.zip](https://hdd.by/victoria)
```powershell
7z x Victoria*.zip -oD:/portable
Rename-Item D:/portable/Victoria* Victoria
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Victoria.lnk')
$lnk.TargetPath='D:/portable/Victoria/Victoria.exe'
$lnk.Save()
```
### Installing Visual Studio (Internet access required)
```powershell
winget install -e --id Microsoft.VisualStudio.Community
```
Or

Download [VisualStudioSetup.exe](https://visualstudio.microsoft.com/downloads)

Open `VisualStudioSetup.exe`

Click `Continue`

Click `Installation locations`

Turn off `Keep download cache after the installation`

Click `Install`

Click `Continue`
### Installing VLC media player
```powershell
winget install -e --id VideoLAN.VLC
```
Or

Download [vlc-*-win64.7z](https://www.videolan.org/vlc/download-windows.html)
```powershell
7z x vlc-*-win64.7z -oD:/portable
Rename-Item D:/portable/vlc-* vlc
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/VLC media player.lnk')
$lnk.TargetPath='D:/portable/vlc/vlc.exe'
$lnk.Save()
```
### Installing Wget
```powershell
winget install -e --id JernejSimoncic.Wget
```
Or

Download [wget-*-win64.zip](https://eternallybored.org/misc/wget)
```powershell
mkdir D:/portable/wget
7z x wget-*-win64.zip -oD:/portable/wget
```
Or

Download [wget.exe](https://eternallybored.org/misc/wget)
```powershell
mkdir D:/portable/wget
copy wget.exe D:/portable/wget
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\wget"
```
### Installing Win 10 Tweaker
```powershell
mkdir 'D:/portable/Win 10 Tweaker'
copy 'Win 10 Tweaker.exe' 'D:/portable/Win 10 Tweaker'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Win 10 Tweaker.lnk')
$lnk.TargetPath='D:/portable/Win 10 Tweaker/Win 10 Tweaker.exe'
$lnk.Save()
```
### Installing Winaero Tweaker
```powershell
winget install -e --id winaero.tweaker
```
Or

Download [winaerotweaker.zip](https://winaerotweaker.com/download/winaerotweaker.zip)

Open `winaerotweaker.zip`

Open `WinaeroTweaker-*-setup.exe`

Click `Run`

Click `Next`

Click `Portable mode (just extract files)`

Click `Next`

Click `I accept the agreement`

Click `Next`

Type `D:/portable/Winaero Tweaker`

Click `Extract files`

Click `Finish`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Winaero Tweaker.lnk')
$lnk.TargetPath='D:/portable/Winaero Tweaker/WinaeroTweaker.exe'
$lnk.Save()
```
### Installing Windhawk
```powershell
winget install -e --id RamenSoftware.Windhawk
```
Or

Download [windhawk_setup_offline.exe](https://github.com/ramensoftware/windhawk/releases)

Open `windhawk_setup_offline.exe`

Click `OK`

Click `Portable installation`

Click `Next >`

Destination Folder `D:\portable\Windhawk`

Click `Install`

Turn off `Open Windhawk`

Click `Finish`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Windhawk.lnk')
$lnk.TargetPath='D:/portable/Windhawk/windhawk.exe'
$lnk.Save()
```
### Installing WinDirStat
```powershell
winget install -e --id WinDirStat.WinDirStat
```
Or

Download [WinDirStat.7z](https://github.com/windirstat/windirstat/releases)
```powershell
mkdir D:/portable/WinDirStat
7z x WinDirStat.7z -oD:/portable/WinDirStat
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/WinDirStat.lnk')
$lnk.TargetPath='D:/portable/WinDirStat/x64/WinDirStat.exe'
$lnk.Save()
```
### Installing Windsurf
```powershell
winget install -e --id Codeium.Windsurf
```
Or

Download [Windsurf-win32-x64-*.zip](https://docs.devin.ai/desktop/releases)
```powershell
mkdir D:/portable/Windsurf
7z x Windsurf-win32-x64-*.zip -oD:/portable/Windsurf
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Windsurf.lnk')
$lnk.TargetPath='D:/portable/Windsurf/Windsurf.exe'
$lnk.Save()
```
### Installing WinHTTrack Website Copier
```powershell
winget install -e --id XavierRoche.HTTrack
```
Or

Download [httrack_x64-noinst-*.zip](https://www.httrack.com/page/2/en/index.html)
```powershell
7z x httrack_x64-noinst-*.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/WinHTTrack Website Copier.lnk')
$lnk.TargetPath='D:/portable/httrack/WinHTTrack.exe'
$lnk.Save()
del D:/portable/file_id.diz
```
### Installing Wireshark
```powershell
winget install -e --id WiresharkFoundation.Wireshark
```
Or

Download [WiresharkPortable64_latest.paf.exe](https://www.wireshark.org/download/win64/WiresharkPortable64_latest.paf.exe)

Open `WiresharkPortable64_latest.paf.exe`

Click `OK`

Click `Next >`

Destination Folder `D:\portable\Wireshark`

Click `Install`

Click `Finish`
```powershell
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Wireshark.lnk')
$lnk.TargetPath='D:/portable/Wireshark/WiresharkPortable64.exe'
$lnk.Save()
```
### Installing XAMPP 8.2
```powershell
winget install -e --id ApacheFriends.Xampp.8.2
```
Or

Download [xampp-windows-x64-8.2.*-0-VS16.zip](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows)
```powershell
7z x xampp-windows-x64-8.2.*-0-VS16.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/XAMPP Control Panel.lnk')
$lnk.TargetPath='D:/portable/xampp/xampp-control.exe'
$lnk.Save()
```
### Installing XnView MP
```powershell
winget install -e --id XnSoft.XnViewMP
```
Or

Download [XnViewMP-win-x64.zip](https://download.xnview.com/XnViewMP-win-x64.zip)
```powershell
7z x XnViewMP-win-x64.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/XnView MP.lnk')
$lnk.TargetPath='D:/portable/XnViewMP/xnviewmp.exe'
$lnk.Save()
```
### Installing Yandex Browser (Internet access required)
```powershell
winget install -e --id Yandex.Browser
```
Or

Download [Yandex.exe](https://browser.yandex.com/download?os=win&bitness=64&statpromo=false)

Open `Yandex.exe`

Turn off `Set as default browser`

Click `Install`
### Installing yt-dlp
```powershell
winget install -e --id yt-dlp.yt-dlp
```
Or

Download [yt-dlp_win.zip](https://github.com/yt-dlp/yt-dlp/releases)
```powershell
mkdir D:/portable/yt-dlp
7z x yt-dlp_win.zip -oD:/portable/yt-dlp
```
Or

Download [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases)
```powershell
mkdir D:/portable/yt-dlp
copy yt-dlp.exe D:/portable/yt-dlp
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\yt-dlp"
```
### Installing Zig
```powershell
winget install -e --id zig.zig
```
Or

Download [zig-x86_64-windows-*.zip](https://ziglang.org/download)
```powershell
7z x zig-x86_64-windows-*.zip -oD:/portable
Rename-Item D:/portable/zig-x86_64-windows-* zig
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\zig"
```
### Installing Zoom Workplace
```powershell
winget install -e --id Zoom.Zoom
```
Or

Download [ZoomInstallerFull.exe](https://zoom.us/download)

Open `ZoomInstallerFull.exe`
### Installing Zstandard
```powershell
winget install -e --id Meta.Zstandard
```
Or

Download [zstd-v*-win64.zip](https://github.com/facebook/zstd/releases)
```powershell
7z x zstd-v*-win64.zip -oD:/portable
Rename-Item D:/portable/zstd-v*-win64 zstd
```
```cmd
setx /M PORTABLE_PATH "%PORTABLE_PATH%;D:\portable\zstd"
```
### Configuring System Clock
```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```
### Mapping Network Drive
Press Win + E

Click `Computer`

Click `Map network drive`

Drive: `S:`

Folder: `\\your_ip\shared`

Click `Finish`

User name `root`

Password `your_password`

Turn on `Remember my credentials`

Click `OK`

Or
```cmd
net use S: \\your_ip\shared /user:root your_password /persistent:yes
```

Sources:
- [Repair BCD File windows 8 or 10, Fix flashing cursor, fix none booting Windows 10](https://youtu.be/NdI5UDb6fBg)