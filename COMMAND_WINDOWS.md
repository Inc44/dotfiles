# Commands

`cls`: Clear the command prompt screen

`for %i in (*) do ffmpeg -y -i "%i" "%~ni.png"`: Convert all files in the current directory to PNG

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

`regsvr32 library.dll`: Register a DLL file

Options:

- `/u`: Unregister the specified DLL

`winget install package`: Install a package using the Windows Package Manager

`wsl --install Ubuntu`: Install Ubuntu on Windows Subsystem for Linux (WSL)

Options:

- `--install`: Install the specified Linux distribution
- `--list`: List available Linux distributions
- `--set-default`: Set the default Linux distribution