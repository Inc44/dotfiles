# Commands

`(Get-PSReadlineOption).HistorySavePath`: Show the path where PowerShell stores its command history

`cls`: Clear the command prompt screen

`for %i in (*) do ffmpeg -y -i "%i" "%~ni.png"`: Convert all files in the current directory to PNG

`for %i in (*.ts) do echo file '%i' >> ts.txt`: Create `ts.txt` that lists all `.ts` files

`ipconfig /flushdns`: Flush the DNS cache

`mklink /D source destination`: Create a symlink

`PatreonDownloader.App.exe`: Download content from Patreon

Options:

- `--url https://www.patreon.com/c/user`: URL of the creator's page
- `--descriptions`: Save post descriptions
- `--embeds`: Save embedded content metadata
- `--json`: Save JSON data
- `--campaign-images`: Download the campaign's avatar and cover images
- `--download-directory path`: Directory to save all downloaded files

`reg add KeyName`: Add a new subkey or entry to the registry

Options:

- `/v ValueName`: The value name, under the selected key, to add
- `/t Type`: RegKey data type
- `/d Data`: The data to assign to the registry ValueName being added
- `/f`: Force overwriting the existing registry entry without prompt

`regsvr32 library.dll`: Register a DLL file

Options:

- `/u`: Unregister the specified DLL

`Set-MpPreference -ScanPurgeItemsAfterDelay 7`: Instruct Microsoft Defender to purge quarantined items after 7 days

`winget install package`: Install a package using the Windows Package Manager

`wsl --install Ubuntu`: Install Ubuntu on Windows Subsystem for Linux (WSL)

Options:

- `--install`: Install the specified Linux distribution
- `--list`: List available Linux distributions
- `--set-default`: Set the default Linux distribution