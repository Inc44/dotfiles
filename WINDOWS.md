### Creating Shared Network
Press Win and R

Type `ncpa.cpl`

Right click `Wi-Fi`

Click `Properties`

Click `Sharing`

Turn on `Allow other network users to connect through this computer's Internet connection`

Select `Ethernet`

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

Click `Ethernet`

Right click `Bridge Connections`
### Repairing BCD
Click `Next`

Click `Next`

Select `Repair my PC`

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

Select `French (France)`

Click `Add layout`

Click `I don't have internet`
### Configuring Device Name
Click Start Menu icon

Type `Settings`

Press Enter

Click `Rename`

Click `Name your device`

Type `pc`

Click `Next`

Click `Restart later`
### Installing VirtIO Drivers
Right click Start Menu icon

Select `Device Manager`

Right click `PCI Simple Communications Controller`

Select `Update driver`

Click `Browse my computer for drivers`

Click `Browse`

Select `CD Drive (E:) virtio-win-0.1.271`

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

``

`your_password`

`your_password`

Click `OK`
### Installing NVIDIA Drivers
Predownload [NVIDIA Studio Driver](https://www.nvidia.com/en-us/drivers)

Copy `*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe` to USB

Install `*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe`

Click `AGREE AND CONTINUE`

Select `Custom (Advanced)`

Turn on `Perform a clean installation`

Click `Next`

Turn off `Create desktop shortcut for NVIDIA App`

Turn off `Launch NVIDIA App`

Click `Close`
### Installing Intel Drivers
Predownload [Intel® Arc™ Graphics - Windows*](https://www.intel.com/content/www/us/en/download/785597/873358)

Copy `gfx_win_101.8425_101.8362.exe` to USB

Install `gfx_win_101.8425_101.8362.exe`
### Optimizing Performance
Click Start Menu icon

Type `View advanced system settings`

Press Enter

Click `Settings`

Turn on `Adjust for best performance`

Turn on `Show thumbnails instead of icons`

Turn on `Smooth edges of screen fonts`

Click `OK`

Click `OK`
### Configuring Win 10 Tweaker
Predownload [Win 10 Tweaker](https://win10tweaker.ru)

Copy `Win 10 Tweaker.exe` to USB

Open `Win 10 Tweaker.exe`

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
#### Scanner
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

Format: `English (world)`

Short time: `HH:mm`

Long time: `HH:mm:ss`

Click `OK`
### Configuring Sound
Click Start Menu icon

Type `Change system sounds`

Press Enter

Sound Scheme: `No Sounds`

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

Turn on `Quick Settings`

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
### Installing LM Studio
```powershell
mkdir D:/portable/lmstudio
```
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
### Installing Parsec
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
7z x AnvilBenchmark_V110_[Guru3D.com].zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut("D:/portable/Anvil's Storage Benchmark.lnk")
$lnk.TargetPath='D:/portable/AnvilPro.exe'
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
mkdir 'D:/portable/Checksum compare'
7z x Checksum-compare-v*.7z -o'D:/portable/Checksum compare'
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Checksum compare.lnk')
$lnk.TargetPath='D:/portable/Checksum compare/Checksum compare.exe'
$lnk.Save()
```
Open `Checksum compare`

Click `Edition`

Click `Options...`

Turn on `Sauvegarder les répertoires courants en quittant.`

Turn on `Sauvegarder l'agencement des vues en quittant.`

Langue `English`

Click `Sauver`

Click `Yes`
### Installing CUDA Information Utility
Download [CUDA-Z-*-64bit.exe](https://sourceforge.net/projects/cuda-z/files/cuda-z)
```powershell
copy CUDA-Z-*-64bit.exe D:/portable/CUDA-Z.exe
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/CUDA-Z.lnk')
$lnk.TargetPath='D:/portable/CUDA-Z.exe'
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
7z x DocumentTranslation.zip -oD:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Document Translation.lnk')
$lnk.TargetPath='D:/portable/DocumentTranslation/DocumentTranslation.GUI.exe'
$lnk.Save()
```
### Installing Domain Name Server Benchmark 1.3.6668.0
Download [DNSBench.exe](https://www.majorgeeks.com/mg/getmirror/dns_benchmark,1.html)
```powershell
copy DNSBench.exe D:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/DNS Benchmark.lnk')
$lnk.TargetPath='D:/portable/DNSBench.exe'
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
mkdir D:/portable/Flowframes
```
Download [FlowframesInstaller*.exe](https://nmkd.itch.io/flowframes)

Open `FlowframesInstaller*.exe`

Click `Custom Folder`

Click `Browse`

Select `D:/portable/Flowframes`

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
Download [GPEN-Windows.rar](https://github.com/yangxy/GPEN)
```powershell
git clone https://github.com/yangxy/GPEN.git D:/portable/GPEN
7z x GPEN-Windows.rar -oD:/portable/GPEN
```
### Installing H2testw
Download [h2testw_*.zip](https://h2testw.org)
```powershell
mkdir D:/portable/h2testw
7z x h2testw_*.zip -oD:/portable/h2testw
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/h2testw.lnk')
$lnk.TargetPath='D:/portable/h2testw/h2testw.exe'
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
### Installing NEAV1E
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
$lnk = $ws.CreateShortcut('D:/portable/nvidiaProfileInspector.lnk')
$lnk.TargetPath='D:/portable/nvidiaProfileInspector/nvidiaProfileInspector.exe'
$lnk.Save()
```
### Installing Oculante
Download [oculante.exe](https://github.com/woelper/oculante/releases)
```powershell
copy oculante.exe D:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Oculante.lnk')
$lnk.TargetPath='D:/portable/oculante.exe'
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
mkdir D:/portable/processhacker
7z x processhacker-2.39-bin.zip -oD:/portable/processhacker
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/Process Hacker.lnk')
$lnk.TargetPath='D:/portable/processhacker/x64/ProcessHacker.exe'
$lnk.Save()
```
### Installing SmoothDraw 4.0.5
Download [SmoothDraw4.zip](https://qrli.github.io/smoothdraw/SmoothDraw4.zip)
```powershell
mkdir D:/portable/SmoothDraw4
7z x SmoothDraw4.zip -oD:/portable/SmoothDraw4
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/SmoothDraw4.lnk')
$lnk.TargetPath='D:/portable/SmoothDraw4/SmoothDraw4.exe'
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
copy nfcPro_x64.exe D:/portable
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/wCopy NFC Reader Read and Write Tool.lnk')
$lnk.TargetPath='D:/portable/nfcPro_x64.exe'
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
### Installing AdGuard
```powershell
winget install -e --id AdGuard.AdGuard
```
Or

Download [AdGuard-*.exe](https://github.com/AdguardTeam/AdguardForWindows/releases)
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
### Installing Amazon Kindle
```powershell
winget install -e --id Amazon.Kindle
```
### Installing Android Studio
```powershell
winget install -e --id Google.AndroidStudio
```
### Installing Anki
```powershell
winget install -e --id Anki.Anki
```
Or

Download [anki-*-win-x64.msi](https://github.com/ankitects/anki/releases)
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
### Installing Arduino IDE
```powershell
winget install -e --id ArduinoSA.IDE.stable
```
Or

Download [arduino-ide_*_Windows_64bit.zip](https://github.com/arduino/arduino-ide/releases)
### Installing Audacity
```powershell
winget install -e --id Audacity.Audacity
```
Or

Download [audacity-win-*-64bit.zip](https://github.com/audacity/audacity/releases)
### Installing balenaEtcher
```powershell
winget install -e --id Balena.Etcher
```
Or

Download [balenaEtcher-win32-x64-*.zip](https://github.com/balena-io/etcher/releases)
### Installing Bambu Studio
```powershell
winget install -e --id Bambulab.Bambustudio
```
Or

Download [Bambu_Studio_win-v*.zip](https://github.com/bambulab/BambuStudio/releases)
### Installing Binary Ninja
```powershell
winget install -e --id Vector35.BinaryNinja
```
### Installing Bitwarden
```powershell
winget install -e --id Bitwarden.Bitwarden
```
### Installing BlueStacks
```powershell
winget install -e --id BlueStack.BlueStacks
```
### Installing Brother iPrint&Scan
```powershell
winget install -e --id Brother.iPrintScan
```
### Installing Brotli
```powershell
winget install -e --id Google.Brotli
```
Or

Download [brotli-x64-windows-static.zip](https://github.com/google/brotli/releases)
### Installing calibre
```powershell
winget install -e --id calibre.calibre
```
Or

Download [calibre-portable-installer-*.exe](https://github.com/kovidgoyal/calibre/releases)
### Installing CapCut
```powershell
winget install -e --id ByteDance.CapCut
```
Or

Download [CapCut_*_installer.exe](https://www.capcut.com/download-guidance)
### Installing Claude
```powershell
winget install -e --id Anthropic.Claude
```
Or

Download [Claude Setup.exe](https://claude.com/download)
### Installing CMake
```powershell
winget install -e --id Kitware.CMake
```
Or

Download [cmake-*-windows-x86_64.zip](https://github.com/Kitware/CMake/releases)
### Installing Code::Blocks with MinGW
```powershell
winget install -e --id CodeBlocks.CodeBlocks.MinGW
```
Or

Download [codeblocks-*mingw-nosetup.zip](https://sourceforge.net/projects/codeblocks/files/Binaries)
### Installing Comet
```powershell
winget install -e --id Perplexity.Comet
```
Or

Download [comet_latest_intel_system.exe](https://www.perplexity.ai/rest/browser/download?platform=win_x64&channel=stable)
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
### Installing Custom Resolution Utility
```powershell
winget install -e --id ToastyX.CustomResolutionUtility
```
Or

Download [cru-*.zip](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)
### Installing CyberGhost
```powershell
winget install -e --id CyberGhost.CyberGhost
```
### Installing Czkawka
```powershell
winget install -e --id qarmin.czkawka.gui
```
Or

Download [windows_czkawka_gui_gtk_412.zip](https://github.com/qarmin/czkawka/releases)
### Installing DB Browser for SQLite
```powershell
winget install -e --id DBBrowserForSQLite.DBBrowserForSQLite
```
Or

Download [DB.Browser.for.SQLite-v*-win64.zip](https://github.com/sqlitebrowser/sqlitebrowser/releases)
### Installing Discord
```powershell
winget install -e --id Discord.Discord
```
Or

Download [DiscordSetup.exe](https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64)
### Installing DiscordChatExporter.GUI
```powershell
winget install -e --id Tyrrrz.DiscordChatExporter.GUI
```
Or

Download [DiscordChatExporter.win-x64.zip](https://github.com/Tyrrrz/DiscordChatExporter/releases)
### Installing Docker Desktop
```powershell
winget install -e --id Docker.DockerDesktop
```
Or

Download [Docker Desktop Installer.exe](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe)
### Installing DuckDuckGo
```powershell
winget install -e --id DuckDuckGo.DesktopBrowser
```
### Installing dupeGuru
```powershell
winget install -e --id DupeGuru.DupeGuru
```
Or

Download [dupeguru-win64_*.zip](https://github.com/arsenetar/dupeguru/releases)
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
### Installing Everything
```powershell
winget install -e --id voidtools.Everything
```
Or

Download [Everything-*.x64.zip](https://www.voidtools.com/downloads)
### Installing Exact Audio Copy
```powershell
winget install -e --id AndreWiethoff.ExactAudioCopy
```
Or

Download [eac-*.exe](https://www.exactaudiocopy.de)
### Installing ExifGlass
```powershell
winget install -e --id PhapDieuDuong.ExifGlass
```
Or

Download [ExifGlass_*_x64.zip](https://github.com/d2phap/ExifGlass/releases)
### Installing ExifTool
```powershell
winget install -e --id OliverBetz.ExifTool
```
Or

Download [exiftool-*_64.zip](https://sourceforge.net/projects/exiftool/files)
### Installing ExifToolGUI
```powershell
winget install -e --id FrankBijnen.ExifToolGUI
```
Or

Download [ExifToolGUI_X64.exe](https://github.com/FrankBijnen/ExifToolGui/releases)
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
### Installing Figma
```powershell
winget install -e --id Figma.Figma
```
Or

Download [FigmaSetup.exe](https://desktop.figma.com/win/FigmaSetup.exe)
### Installing Filius
```powershell
winget install -e --id StefanFreischlad.Filius
```
Or

Download [filius-*.zip](https://www.lernsoftware-filius.de/Herunterladen)
### Installing Finite Element Method Magnetics
```powershell
winget install -e --id DavidMeeker.FEMM
```
Or

Download [femm*.exe](https://www.femm.info/doku/doku.php?id=download)
### Installing Focusrite Control 2
```powershell
winget install -e --id FocusriteAudioEngineeringLtd.FocusriteControl2
```
Or

Download [Focusrite-Control-2.exe](https://releases.focusrite.com/com.focusrite.focusrite-control/latest/Focusrite-Control-2.exe)
### Installing FontForge
```powershell
winget install -e --id FontForge.FontForge
```
Or

Download [FontForge-*-Windows-x64.exe](https://github.com/fontforge/fontforge/releases)
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
### Installing GIMP
```powershell
winget install -e --id GIMP.GIMP
```
Or

Download [gimp-*-setup.exe](https://www.gimp.org/downloads)
### Installing Git
```powershell
winget install -e --id Git.Git
```
### Installing GitHub Desktop
```powershell
winget install -e --id GitHub.GitHubDesktop
```
Or

Download [GitHubDesktopSetup-x64.exe](https://desktop.github.com/download)
### Installing Google Chrome
```powershell
winget install -e --id Google.Chrome
```
Or

Download [googlechromestandaloneenterprise64.msi](https://dl.google.com/dl/chrome/install/googlechromestandaloneenterprise64.msi)
### Installing Google Drive
```powershell
winget install -e --id Google.GoogleDrive
```
Or

Download [GoogleDriveSetup.exe](https://dl.google.com/drive-file-stream/GoogleDriveSetup.exe)
### Installing grepWin
```powershell
winget install -e --id StefansTools.grepWin
```
Or

Download [grepWin-x64-*_portable.zip](https://github.com/stefankueng/grepWin/releases)
### Installing HakuNeko Desktop
```powershell
winget install -e --id HakuNeko.HakuNeko
```
Or

Download [hakuneko-desktop_*_windows-portable_amd64.zip](https://github.com/manga-download/hakuneko/releases)
### Installing Hamachi
```powershell
winget install -e --id LogMeIn.Hamachi
```
Or

Download [hamachi.msi](https://secure.logmein.com/hamachi.msi)
### Installing HandBrake
```powershell
winget install -e --id HandBrake.HandBrake
```
Or

Download [HandBrake-*-x86_64-Win_GUI.zip](https://github.com/HandBrake/HandBrake/releases)
### Installing Helium
```powershell
winget install -e --id ImputNet.Helium
```
Or

Download [helium_*_x64-windows.zip](https://github.com/imputnet/helium-windows/releases)
### Installing HP Connectivity Kit
```powershell
winget install -e --id HP.ConnectivityKit
```
Or

Download [HP_Prime_Connectivity_Kit_x64_*.exe](https://updates.moravia-consulting.com)
### Installing HP Prime Virtual Calculator
```powershell
winget install -e --id HP.PrimeVirtualCalculator
```
Or

Download [HP_Prime_Virtual_Calculator_x64_*.exe](https://updates.moravia-consulting.com)
### Installing HWiNFO®
```powershell
winget install -e --id REALiX.HWiNFO
```
Or

Download [hwi_*.zip](https://www.hwinfo.com/download)
### Installing HxD Hex Editor
```powershell
winget install -e --id MHNexus.HxD
```
Or

Download [HxDSetup.zip](https://mh-nexus.de/downloads/HxDSetup.zip)
### Installing iBackupBot for Windows
```powershell
winget install -e --id VOWSoft.iBackupBot
```
Or

Download [ibackupbot_setup.exe](https://www.icopybot.com/ibackupbot_setup.exe)
### Installing Icaros
```powershell
winget install -e --id Xanashi.Icaros
```
Or

Download [Icaros_v*.zip](https://github.com/Xanashi/Icaros/releases)
### Installing ICAT
```powershell
winget install -e --id Nvidia.ICAT
```
Or

Download [ICAT-*.exe](https://www.nvidia.com/en-us/geforce/technologies/icat)
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
### Installing iPerf3
```powershell
winget install -e --id ar51an.iPerf3
```
Or

Download [iperf-3.*-win64.zip](https://github.com/ar51an/iperf3-win-builds/releases)
### Installing JetBrains dotPeek
```powershell
winget install -e --id JetBrains.dotPeek
```
Or

Download [dotPeek64.*.exe](https://www.jetbrains.com/decompiler/download/download-thanks.html?platform=windows64)
### Installing Jpegoptim
```powershell
winget install -e --id TimoKokkonen.Jpegoptim
```
Or

Download [jpegoptim-*-x64-windows.zip](https://github.com/tjko/jpegoptim/releases)
### Installing KiCad
```powershell
winget install -e --id KiCad.KiCad
```
Or

Download [kicad-*-x86_64.exe](https://github.com/KiCad/kicad-source-mirror/releases)
### Installing Lazarus
```powershell
winget install -e --id Lazarus.Lazarus
```
Or

Download [lazarus-*-win64.exe](https://sourceforge.net/projects/lazarus/files)
### Installing libjxl
```powershell
winget install -e --id libjxl.libjxl
```
Or

Download [jxl-x64-windows-static.zip](https://github.com/libjxl/libjxl/releases)
### Installing LibreOffice
```powershell
winget install -e --id TheDocumentFoundation.LibreOffice
```
Or

Download [LibreOffice_*_Win_x86-64.msi](https://www.libreoffice.org/download)
### Installing LM Studio
```powershell
winget install -e --id ElementLabs.LMStudio
```
Or

Download [LM-Studio-*-x64.exe](https://lmstudio.ai/download/latest/win32/x64)
### Installing Logi Options+
```powershell
winget install -e --id Logitech.OptionsPlus
```
Or

Download [logioptionsplus_installer.exe](https://download01.logi.com/web/ftp/pub/techsupport/optionsplus/logioptionsplus_installer.exe)
### Installing LTspice
```powershell
winget install -e --id AnalogDevices.LTspice
```
Or

Download [LTspice64.msi](https://ltspice.analog.com/software/LTspice64.msi)
### Installing Malicious Software Removal Tool
```powershell
winget install -e --id Microsoft.MaliciousSoftwareRemovalTool
```
Or

Download [Windows-KB890830-x64-V*.exe](https://www.microsoft.com/en-us/download/details.aspx?id=9905)
### Installing Mathpix Snipping Tool
```powershell
winget install -e --id Mathpix.MathpixSnippingTool
```
Or

Download [mathpix_snipping_tool_setup.v*.exe](https://mathpix.com/windows-guide)
### Installing MEGAsync
```powershell
winget install -e --id Mega.MEGASync
```
Or

Download [MEGAsyncSetup64.exe](https://mega.nz/MEGAsyncSetup64.exe)
### Installing Microsoft Teams
```powershell
winget install -e --id Microsoft.Teams
```
Or

Download [MSTeamsSetup.exe](https://statics.teams.cdn.office.net/production-windows-x86/lkg/MSTeamsSetup.exe)
### Installing Microsoft Visual Studio Code
```powershell
winget install -e --id Microsoft.VisualStudioCode
```
Or

Download [VSCode-win32-x64-*.zip](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive)
### Installing MiKTeX
```powershell
winget install -e --id MiKTeX.MiKTeX
```
Or

Download [basic-miktex-*-x64.exe](https://miktex.org/download)
### Installing Mine-imator
```powershell
winget install -e --id DavidNorgren.Mine-imator
```
Or

Download [Mine-imator *.zip](https://www.mineimator.com/dl/mineimator-zip)
### Installing MinerU
```powershell
winget install -e --id OpenDataLab.MinerU
```
Or

Download [MinerU-*-setup.exe](https://mineru.net)
### Installing Mozilla Firefox (en-US)
```powershell
winget install -e --id Mozilla.Firefox
```
Or

Download [Firefox Setup *.exe](https://download.mozilla.org/?product=firefox-latest-ssl&os=win64)
### Installing Mp3tag
```powershell
winget install -e --id FlorianHeidenreich.Mp3tag
```
Or

Download [mp3tag-v*-x64-setup.exe](https://www.mp3tag.de/dodownload64.html)
### Installing mpv.net
```powershell
winget install -e --id mpv.net
```
Or

Download [mpv.net-v*-portable-x64.zip](https://github.com/mpvnet-player/mpv.net/releases)
### Installing MSI Afterburner
```powershell
winget install -e --id Guru3D.Afterburner
```
Or

Download [[Guru3D]-MSIAfterburnerSetup*.zip](https://www.guru3d.com/download/msi-afterburner-beta-download)
### Installing Nextcloud
```powershell
winget install -e --id Nextcloud.NextcloudDesktop
```
Or

Download [Nextcloud-*-x64.msi](https://github.com/nextcloud-releases/desktop/releases)
### Installing Node.js
```powershell
winget install -e --id OpenJS.NodeJS
```
Or

Download [node-v*-win-x64.zip](https://nodejs.org/en/download)
### Installing NormCap
```powershell
winget install -e --id dynobo.NormCap
```
Or

Download [NormCap-*-x86_64-Windows.zip](https://github.com/dynobo/normcap/releases)
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
### Installing OBS Studio
```powershell
winget install -e --id OBSProject.OBSStudio
```
Or

Download [OBS-Studio-*-Windows-x64.zip](https://github.com/obsproject/obs-studio/releases)
### Installing Obsidian
```powershell
winget install -e --id Obsidian.Obsidian
```
Or

Download [Obsidian-*.exe](https://github.com/obsidianmd/obsidian-releases/releases)
### Installing Ollama
```powershell
winget install -e --id Ollama.Ollama
```
Or

Download [ollama-windows-amd64.zip](https://github.com/ollama/ollama/releases)
### Installing OP Auto Clicker
```powershell
winget install -e --id OPAutoClicker.OPAutoClicker
```
Or

Download [AutoClicker.exe](https://sourceforge.net/projects/orphamielautoclicker/files)
### Installing Oracle VirtualBox
```powershell
winget install -e --id Oracle.VirtualBox
```
Or

Download [VirtualBox-*-Win.exe](https://www.virtualbox.org/wiki/Downloads)
### Installing ParkControl
```powershell
winget install -e --id BitSum.ParkControl
```
Or

Download [parkcontrolsetup64.exe](https://dl.bitsum.com/files/parkcontrolsetup64.exe)
### Installing Parsec
```powershell
winget install -e --id Parsec.Parsec
```
Or

Download [parsec-windows.exe](https://builds.parsec.app/package/parsec-windows.exe)
### Installing PeaZip
```powershell
winget install -e --id Giorgiotani.Peazip
```
Or

Download [peazip_portable-*.WIN64.zip](https://github.com/peazip/PeaZip/releases)
### Installing Prime95
```powershell
winget install -e --id mersenne.prime95
```
Or

Download [p95v*.win64.zip](https://www.mersenne.org/download)
### Installing PuTTY
```powershell
winget install -e --id PuTTY.PuTTY
```
Or

Download [putty.zip](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
### Installing qBittorrent (libtorrent 2)
```powershell
winget install -e --id qBittorrent.qBittorrent.lt2
```
Or

Download [qbittorrent_*_lt20_x64_setup.exe](https://sourceforge.net/projects/qbittorrent/files/qbittorrent-win32)
### Installing qView
```powershell
winget install -e --id jurplel.qView
```
Or

Download [qView-*-win64.zip](https://github.com/jurplel/qView/releases)
### Installing Raspberry Pi Imager
```powershell
winget install -e --id RaspberryPiFoundation.RaspberryPiImager
```
Or

Download [imager-v*.exe](https://github.com/raspberrypi/rpi-imager/releases)
### Installing Rivatuner Statistics Server
```powershell
winget install -e --id Guru3D.RTSS
```
Or

Download [[Guru3D]-RTSSSetup*.zip](https://www.guru3d.com/download/rtss-rivatuner-statistics-server-download)
### Installing SimpleTex
```powershell
winget install -e --id SimpleTex.SimpleTex
```
Or

Download [SimpleTex Setup *.exe](https://gitee.com/simpletex/simple-tex-download/releases)
### Installing Spacedrive
```powershell
winget install -e --id spacedrive.Spacedrive
```
Or

Download [Spacedrive-windows-x86_64.msi](https://github.com/spacedriveapp/spacedrive/releases)
### Installing Speedtest by Ookla
```powershell
winget install -e --id Ookla.Speedtest.Desktop
```
Or

Download [speedtestbyookla_x64.msi](https://install.speedtest.net/app/windows/latest/speedtestbyookla_x64.msi)
### Installing Spek
```powershell
winget install -e --id AlexanderKojevnikov.Spek
```
Or

Download [spek-*.zip](https://github.com/alexkay/spek/releases)
### Installing Steam
```powershell
winget install -e --id Valve.Steam
```
Or

Download [SteamSetup.exe](https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe)
### Installing Studio
```powershell
winget install -e --id BrickLink.Studio
```
Or

Download [Studio+2.0.exe](https://studio.download.bricklink.info/Studio2.0/Studio+2.0.exe)
### Installing System Informer
```powershell
winget install -e --id WinsiderSS.SystemInformer
```
Or

Download [systeminformer-*-release-bin.zip](https://github.com/winsiderss/systeminformer/releases)
### Installing TechPowerUp GPU-Z
```powershell
winget install -e --id TechPowerUp.GPU-Z
```
Or

Download [GPU-Z.*.exe](https://www.techpowerup.com/download/techpowerup-gpu-z)
```powershell
copy GPU-Z.*.exe D:/portable/GPU-Z.exe
$ws = New-Object -ComObject WScript.Shell
$lnk = $ws.CreateShortcut('D:/portable/GPU-Z.lnk')
$lnk.TargetPath='D:/portable/GPU-Z.exe'
$lnk.Save()
```
### Configuring TechPowerUp GPU-Z
Open `GPU-Z`

Click `No`
### Installing Telegram Desktop
```powershell
winget install -e --id Telegram.TelegramDesktop
```
Or

Download [tportable-x64.*.zip](https://github.com/telegramdesktop/tdesktop/releases)
### Installing TeXworks
```powershell
winget install -e --id TUG.TeXworks
```
Or

Download [TeXworks-win10-*.zip](https://github.com/TeXworks/texworks/releases)
### Installing The Silver Searcher
```powershell
winget install -e --id JFLarvoire.Ag
```
Or

Download [ag.zip](https://github.com/JFLarvoire/the_silver_searcher/releases)
### Installing Thio's SVG Thumbnail Extension
```powershell
winget install -e --id ThioJoe.SvgThumbnailExtension
```
Or

Download [SVG-Thumbnail-Extension-Installer_*_x64.msi](https://github.com/ThioJoe/win-svg-thumbs-rust/releases)
### Installing ThrottleStop
```powershell
winget install -e --id TechPowerUp.ThrottleStop
```
Or

Download [ThrottleStop_*.zip](https://www.techpowerup.com/download/techpowerup-throttlestop)
### Installing Tor Browser
```powershell
winget install -e --id TorProject.TorBrowser
```
Or

Download [tor-browser-windows-x86_64-portable-*.exe](https://www.torproject.org/download)
### Installing Ultimate Vocal Remover
```powershell
winget install -e --id Anjok07.UltimateVocalRemover
```
Or

Download [UVR_v*_setup.exe](https://github.com/Anjok07/ultimatevocalremovergui/releases)
### Installing Unity 2020.3.12f1
```powershell
winget install -e --id Unity.Unity.2020 -v "2020.3.12f1"
```
Or

Download [UnitySetup64-2020.3.12f1.exe](https://download.unity3d.com/download_unity/b3b2c6512326/Windows64EditorInstaller/UnitySetup64-2020.3.12f1.exe)
### Installing Unity Hub
```powershell
winget install -e --id Unity.UnityHub
```
Or

Download [UnityHubSetup-x64.exe](https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup-x64.exe)
### Installing Universal Android Debloater Next Generation
```powershell
winget install -e --id Universal-Debloater-Alliance.uad-ng
```
Or

Download [uad-ng-windows.exe](https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/releases)
### Installing Ventoy
```powershell
winget install -e --id Ventoy.Ventoy
```
Or

Download [ventoy-*-windows.zip](https://github.com/ventoy/Ventoy/releases)
### Installing VeraCrypt
```powershell
winget install -e --id IDRIX.VeraCrypt
```
Or

Download [VeraCrypt.Setup.*.exe](https://github.com/veracrypt/VeraCrypt/releases)
### Installing Viber
```powershell
winget install -e --id Rakuten.Viber
```
Or

Download [ViberSetup.exe](https://download.cdn.viber.com/desktop/windows/ViberSetup.exe)
### Installing Victoria
```powershell
winget install -e --id Victoria.Victoria
```
Or

Download [Victoria*.zip](https://hdd.by/victoria)
### Installing Visual Studio Community 2026
```powershell
winget install -e --id Microsoft.VisualStudio.Community
```
Or

Download [VisualStudioSetup.exe](https://visualstudio.microsoft.com/downloads)
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
### Installing Winaero Tweaker
```powershell
winget install -e --id winaero.tweaker
```
Or

Download [winaerotweaker.zip](https://winaerotweaker.com/download/winaerotweaker.zip)
### Installing Windhawk
```powershell
winget install -e --id RamenSoftware.Windhawk
```
Or

Download [windhawk_setup_offline.exe](https://github.com/ramensoftware/windhawk/releases)
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
### Installing WinHTTrack Website Copier
```powershell
winget install -e --id XavierRoche.HTTrack
```
Or

Download [httrack_x64-noinst-*.zip](https://www.httrack.com/page/2/en/index.html)
### Installing Wireshark
```powershell
winget install -e --id WiresharkFoundation.Wireshark
```
Or

Download [WiresharkPortable64_latest.paf.exe](https://www.wireshark.org/download/win64/WiresharkPortable64_latest.paf.exe)
### Installing XAMPP 8.2
```powershell
winget install -e --id ApacheFriends.Xampp.8.2
```
Or

Download [xampp-windows-x64-8.2.*-0-VS16.zip](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows)
### Installing XnView MP
```powershell
winget install -e --id XnSoft.XnViewMP
```
Or

Download [XnViewMP-win-x64.zip](https://download.xnview.com/XnViewMP-win-x64.zip)
### Installing Yandex Browser
```powershell
winget install -e --id Yandex.Browser
```
Or

Download [Yandex.exe](https://browser.yandex.com/download?os=win&bitness=64&statpromo=false)
### Installing yt-dlp
```powershell
winget install -e --id yt-dlp.yt-dlp
```
Or

Download [yt-dlp.exe](https://github.com/yt-dlp/yt-dlp/releases)
### Installing Zig
```powershell
winget install -e --id zig.zig
```
Or

Download [zig-x86_64-windows-*.zip](https://ziglang.org/download)
### Installing Zoom Workplace
```powershell
winget install -e --id Zoom.Zoom
```
Or

Download [ZoomInstallerFull.exe](https://zoom.us/download)
### Installing Zstandard
```powershell
winget install -e --id Meta.Zstandard
```
Or

Download [zstd-v*-win64.zip](https://github.com/facebook/zstd/releases)
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