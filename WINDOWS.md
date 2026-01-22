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
Predownload [NVIDIA Studio Driver](https://www.nvidia.com/en-us/drivers/)

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
### Configuring Win 10 Tweaker
Predownload [Win 10 Tweaker](https://win10tweaker.ru/)

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
### Configuring System Clock
```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```
### Installing The Silver Searcher
```
winget install "The Silver Searcher"
```