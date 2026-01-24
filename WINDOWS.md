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

Select `CD Drive (F:) virtio-win-0.1.271`

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
### Configuring Initial Password
Click `OK`

``

`your_password`

`your_password`

Click `OK`
### Installing NVIDIA Drivers
Predownload [NVIDIA Studio Driver](https://www.nvidia.com/en-us/drivers)

Copy `.*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe` to USB

Install `.*-desktop-win10-win11-64bit-international-nsd-dch-whql.exe`
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
### Configuring Personalization
Click Start Menu icon

Type `Settings`

Press Enter

Select `Personalization`

Click `Background`

Select `Solid color`

Click `Back`

Click `Colors`

Select `Dark`

Turn off `Transparency effects`

Select `Iris pastel`
### Configuring Taskbar
Right click Taskbar

Select `Show Search button`

Right click Taskbar

Select Show Task View button`
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

Turn off `Shift + Right Click`

Turn off `Add item "Upload on ImgBB" to images context menu`

Turn off `Add item "Upload on Upload.ee" to images context menu`

Click (choose)

Turn on all

Click (chosen)

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

Click (choose)

Turn off `Disable Navigation pane`

Click (chosen)

Click `Apply`
#### System
Click `Check all`

Turn off `Stop and disable Windows Defender and SmartScreen`

Turn off `Create Restart and Refresh shortcuts on Desktop`

Click `Apply`
#### Services
#### Cleaner
Click `Uncheck all`

Click `Check all`

Click `Apply`
#### Applications
Click `Remove all applications`

Click `Yes`

Click Microsoft Store icon
#### Startup
#### Optimization
#### Scanner
#### System Information
Restart
### Installing Parsec
Download [parsec-windows.exe](https://parsec.app/downloads)

Open `parsec-windows.exe`

Click `Next`

Select `Per Computer`

Click `Next`

Email `your_email`

Password `your_password`

Click `Log In`
### Installing 7-Zip
Download [7z.*-x64.exe](https://www.7-zip.org/download.html)

Click `Install`

Click `Close`
### Installing 7-Zip ZS
Download [7z.*-zstd-x64.exe](https://github.com/mcmilk/7-Zip-zstd/releases)

Click `Install`

Click `Close`
### Installing StartAllBack
Download `StartAllBack (StartIsBack++)`

Open installer

Click `OK`

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

Select Music's `Don't display`

Select Videos's `Link`

Select Recent Items's `Don't display`

Select This PC's `Don't display`

Select Run's `Don't display`
#### Taskbar
Taskbar location on screen: `Top`

Turn on `Centered task icons`

Turn on `Automatic hiding`
#### Tray icons
Corner icons open: `Windows 10 flyouts if possible`

Turn on all icons

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
### Configuring Disk
Right click Start Menu icon

Select `Disk Management`

Click `OK`

Right click Disk 1's `Unallocated`

Click `New Simple Volume...`

Click `Next`

Click `Next`

Select `D`

Click `Next`

Volume label: ``

Click `Next`
### Configuring Indexing
Open `File Explorer`

Click `Local Disk (C:)`

Press Alt+Enter

Turn off `Allow files on this drive to have contents indexed in addition to file properties`

Click `OK`

Click `OK`

Click `Ignore All`

Click `Local Disk (D:)`

Press Alt+Enter

Turn off `Allow files on this drive to have contents indexed in addition to file properties`

Click `OK`

Click `OK`
### Configuring Folders
Open `File Explorer`

Click `Local Disk (D:)`

Click `> This PC > Local Disk (D:)`

Type `cmd`

Press Enter

```powershell
mkdir lmstudio
mkdir portable
```
### Installing LM Studio
Download [LM-Studio-.*-x64.exe](https://lmstudio.ai/download/latest/win32/x64)

Open `LM-Studio-.*-x64.exe`

Select `Anyone who uses this computer (all users)`

Click `Next`

Click `Install`

Click `Finish`

Click `Get Started`

Click `Developer`

Click `Continue`

Click `Skip`

Click `OK`

Click 📂 icon

Click ⋯ icon

Click `Change...`

Folder: `D:\lmstudio`

Click `Select Folder`

Click ⚙️ icon

Click `Runtime`

Click all `Update`

Click 💬 icon

Click `Select a model to load`

Type `gpt-oss`

Click `Search more results for "gpt-oss"`

Click `Download (63.39 GB)`

Click `X`

Click `Select a model to load`

Turn on `Manually choose model load parameters`

Click `OpenAI's gpt-oss 120B`

Context Length `131072`

GPU Offload `8`/36

Turn on `Remember settings for openai's gpt-oss 120b`

Click `Load Model`
## Free Portable
### Installing Advanced Renamer 3.95.4
Download [advanced_renamer_portable_3_95_4.zip](https://www.advancedrenamer.com/down/advanced_renamer_portable_3_95_4.zip)
### Installing Advanced Renamer 4
Download [advanced_renamer_portable_4_.*.zip](https://www.advancedrenamer.com/download)
### Installing Anvil's Storage Utilities
Download [AnvilBenchmark_V110_[Guru3D.com].zip](https://www.guru3d.com/download/anvils-storage-utilities-download)
### Installing Apache Maven
Download [apache-maven-.*-bin.zip](https://maven.apache.org/download.cgi)
### Installing ATTO Disk Benchmark
Download [atto-disk-benchmark-.*.zip](https://www.techpowerup.com/download/atto-disk-benchmark)
### Installing Check Flash
Download [ChkFlsh.zip](https://www.mikelab.kiev.ua/PROGRAMS/ChkFlsh.zip)
### Installing Checksum Compare
Download [Checksum-compare-v.*.7z](https://checksumcompare.sanktuaire.com/downloads)
### Installing CUDA Information Utility
Download [CUDA-Z-.*-64bit.exe](https://sourceforge.net/projects/cuda-z/files/cuda-z)
### Installing Disk2vhd
Download [Disk2vhd.zip](https://download.sysinternals.com/files/Disk2vhd.zip)
### Installing Document Translation
Download [DocumentTranslation.rar](https://github.com/MicrosoftTranslator/DocumentTranslation/releases)
### Installing Domain Name Server Benchmark 1.3.6668.0
Download [DNSBench.exe](https://www.majorgeeks.com/files/details/dns_benchmark.html)
### Installing EncryptPad
Download [encryptpad.*_win32.zip](https://github.com/evpo/EncryptPad/releases)
### Installing FFMetrics
Download [FFMetrics.*.zip](https://github.com/fifonik/FFMetrics/releases)
### Installing Flowframes
Download [FlowframesInstaller.*.exe](https://nmkd.itch.io/flowframes)
### Installing Ghidra
Download [ghidra_.*_PUBLIC_.*.zip](https://github.com/NationalSecurityAgency/ghidra/releases)
### Installing H2testw
Download [h2testw_.*.zip](https://h2testw.org)
### Installing hashcat
Download [hashcat-.*.7z](https://github.com/hashcat/hashcat/releases)
### Installing JDM Drift
Download [JDM Drift Build DEMO.zip](https://howdyho.net/windows-software/demka-drift-igry-na-unity-eksperiment-v2)
### Installing Kiwix
Download [kiwix-desktop_windows_x64_.*.zip](https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop_windows_x64.zip)
### Installing KruTube
Download [krutube_.*.zip](https://www.krutube.pro/en/download)
### Installing LinpackXtreme
Download [LinpackXtreme-.*.zip](https://www.techpowerup.com/download/linpack-xtreme)
### Installing Looping
Download [Looping.zip](https://looping.net/Looping.zip)
### Installing MagicaVoxel
Download [MagicaVoxel-.*.-win64.zip](https://github.com/ephtracy/ephtracy.github.io/releases)
### Installing NEAV1E
Download [neav1e-portable-.*.7z](https://github.com/Alkl58/NotEnoughAV1Encodes/releases)
### Installing NVIDIA Profile Inspector
Download [nvidiaProfileInspector.zip](https://github.com/Orbmu2k/nvidiaProfileInspector/releases)
### Installing Oculante
Download [oculante.exe](https://github.com/woelper/oculante/releases)
### Installing PhantomJS
Download [phantomjs-.*-windows.zip](https://phantomjs.org/download.html)
### Installing Process Hacker 2.39
Download [processhacker-2.39-bin.zip](https://sourceforge.net/projects/processhacker/files/processhacker2/processhacker-2.39-bin.zip/download)
### Installing SmoothDraw 4.0.5
Download [SmoothDraw4.zip](https://qrli.github.io/smoothdraw/SmoothDraw4.zip)
### Installing TerraMap
Download [TerraMap-.*.zip](https://terramap.github.io/windows.html)
### Installing USBWebserver
Download [USBWebServer.zip](https://github.com/grimgravy/USBWebServer/releases)
### Installing Voice Changer Client Demo 1.5.3.15
Download [MMVCServerSIO_win_onnxgpu-cuda_v.1.5.3.15.zip](https://huggingface.co/wok000/vcclient000/blob/main/MMVCServerSIO_win_onnxgpu-cuda_v.1.5.3.15.zip)
### Installing VOVSOFT - File Splitter And Joiner
Download [file-splitter-and-joiner-portable.zip](https://files.vovsoft.com/file-splitter-and-joiner-portable.zip)
### Installing wCopy NFC Reader Read and Write Tool
Download [nfcPro_x64.exe](https://www.xixei.com/nfc/tool/soft/down_enus.html)
### Installing y-cruncher
Download [y-cruncher.v.*.zip](https://github.com/Mysticial/y-cruncher/releases)
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
### Installing AIMP
```powershell
winget install -e --id AIMP.AIMP
```
### Installing Android Studio
```powershell
winget install -e --id Google.AndroidStudio
```
### Installing Audacity
```powershell
winget install -e --id Audacity.Audacity
```
### Installing calibre
```powershell
winget install -e --id calibre.calibre
```
### Installing Code::Blocks with MinGW
```powershell
winget install -e --id CodeBlocks.CodeBlocks.MinGW
```
### Installing CPUID CPU-Z
```powershell
winget install -e --id CPUID.CPU-Z
```
### Installing CrystalDiskInfo
```powershell
winget install -e --id CrystalDewWorld.CrystalDiskInfo
```
### Installing CrystalDiskMark
```powershell
winget install -e --id CrystalDewWorld.CrystalDiskMark
```
### Installing Custom Resolution Utility
```powershell
winget install -e --id ToastyX.CustomResolutionUtility
```
### Installing Czkawka
```powershell
winget install -e --id qarmin.czkawka.gui
```
### Installing DB Browser for SQLite
```powershell
winget install -e --id DBBrowserForSQLite.DBBrowserForSQLite
```
### Installing DiscordChatExporter.GUI
```powershell
winget install -e --id Tyrrrz.DiscordChatExporter.GUI
```
### Installing dupeGuru
```powershell
winget install -e --id DupeGuru.DupeGuru
```
### Installing Eclipse IDE for Java Developers
```powershell
winget install -e --id EclipseFoundation.Eclipse.Java
```
### Installing ExifGlass
```powershell
winget install -e --id PhapDieuDuong.ExifGlass
```
### Installing ExifTool
```powershell
winget install -e --id OliverBetz.ExifTool
```
### Installing ExifToolGUI
```powershell
winget install -e --id FrankBijnen.ExifToolGUI
```
### Installing Geeks3D FurMark 2
```powershell
winget install -e --id Geeks3D.FurMark.2
```
### Installing Git
```powershell
winget install -e --id Git.Git
```
### Installing grepWin
```powershell
winget install -e --id StefansTools.grepWin
```
### Installing HakuNeko Desktop
```powershell
winget install -e --id HakuNeko.HakuNeko
```
### Installing HandBrake
```powershell
winget install -e --id HandBrake.HandBrake
```
### Installing HWiNFO®
```powershell
winget install -e --id REALiX.HWiNFO
```
### Installing Icaros
```powershell
winget install -e --id Xanashi.Icaros
```
### Installing ImageGlass
```powershell
winget install -e --id DuongDieuPhap.ImageGlass
```
### Installing Inkscape
```powershell
winget install -e --id Inkscape.Inkscape
```
### Installing Malicious Software Removal Tool
```powershell
winget install -e --id Microsoft.MaliciousSoftwareRemovalTool
```
### Installing Microsoft Visual Studio Code
```powershell
winget install -e --id Microsoft.VisualStudioCode
```
### Installing Mine-imator
```powershell
winget install -e --id DavidNorgren.Mine-imator
```
### Installing Mp3tag
```powershell
winget install -e --id FlorianHeidenreich.Mp3tag
```
### Installing mpv.net
```powershell
winget install -e --id mpv.net
```
### Installing Notepad++
```powershell
winget install -e --id Notepad++.Notepad++
```
### Installing OP Auto Clicker
```powershell
winget install -e --id OPAutoClicker.OPAutoClicker
```
### Installing PeaZip
```powershell
winget install -e --id Giorgiotani.Peazip
```
### Installing Prime95
```powershell
winget install -e --id mersenne.prime95
```
### Installing System Informer
```powershell
winget install -e --id WinsiderSS.SystemInformer
```
### Installing TechPowerUp GPU-Z
```powershell
winget install -e --id TechPowerUp.GPU-Z
```
### Installing Telegram Desktop
```powershell
winget install -e --id Telegram.TelegramDesktop
```
### Installing The Silver Searcher
```
winget install -e --id JFLarvoire.Ag
```
### Installing ThrottleStop
```powershell
winget install -e --id TechPowerUp.ThrottleStop
```
### Installing Tor Browser
```powershell
winget install -e --id TorProject.TorBrowser
```
### Installing Universal Android Debloater Next Generation
```powershell
winget install -e --id Universal-Debloater-Alliance.uad-ng
```
### Installing Ventoy
```powershell
winget install -e --id Ventoy.Ventoy
```
### Installing VeraCrypt
```powershell
winget install -e --id IDRIX.VeraCrypt
```
### Installing Victoria
```powershell
winget install -e --id Victoria.Victoria
```
### Installing Winaero Tweaker
```powershell
winget install -e --id winaero.tweaker
```
### Installing Windhawk
```powershell
winget install -e --id RamenSoftware.Windhawk
```
### Installing XnView MP
```powershell
winget install -e --id XnSoft.XnViewMP
```
### Installing Zig
```powershell
winget install -e --id zig.zig
```
### Configuring System Clock
```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```