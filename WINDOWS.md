### Configuring Initial Privacy
Click `Yes`

Click `Yes`

Click `Add layout`

Select `French (France)`

Click `Add layout`

Click `I don't have internet`
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

Copy `......-desktop-win10-win11-64bit-international-nsd-dch-whql.exe` to USB

Install `......-desktop-win10-win11-64bit-international-nsd-dch-whql.exe`
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
### Configuring System Clock
```
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```
### Installing The Silver Searcher
```
winget install "The Silver Searcher"
```