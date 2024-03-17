# commands
`alias name=command`: Create a shortcut for a command, eliminating the need to type the full command

`aplay -l`:  List all available sound cards and digital audio devices

`apt install package`: Install package along with its dependencies

`apt remove package`: Remove package, preserve configuration and data

`apt purge package`: Remove package

`cd directory`: Change the current directory

`chattr attribute path`: Change the attributes of a file or directory

Options:

- `+i`, `-i`: Add/remove immutable attribute
- `+r`, `-r`: Add/remove read attribute
- `+w`, `-w`: Add/remove write attribute
- `+x`, `-x`: Add/remove executable attribute

`chmod mode path`: Change the mode of a file or directory

Mode parameter:

- `0`, `---`: No permissions
- `1`, `r--`: Read
- `2`, `-w-`: Write
- `3`, `rw-`: `1+2`
- `4`, `--x`: Execute
- `5`, `r-x`: `1+4`
- `6`, `-wx`: `2+4`
- `7`, `rwx`: `1+2+4`

Mode order for 3 elements:

- `u`: User
- `g`: Group
- `o`: Others

Mode order for 1 element:

- `a`: All

`chown user/uid path`: Change the owner of a file or directory

`code file`: Open the file in the Visual Studio Code text editor

`command > file`: Redirect the output of a command to a file, replacing the file's current contents

`command | grep pattern`: Filters the output of a command, showing only lines that match a specified pattern

`cp path1 path2`: Copy by overwriting the file or directory at `path1` to `path2`

`fc-list`: Display all available fonts and styles

`ffmpeg -i input -c copy output`: Copy the media stream from the input file to the output file without re-encoding

Options:

- `-c:a codec`: Encode the audio stream using a specified codec
- `-c:v copy`: Copy the video stream without re-encoding
- `-f format`: Specify the output format
- `-filter:a "atempo=float"`: Adjust the audio playback speed without changing its pitch
- `-i input`: Specify the input file
- `-itsscale float`: Scale the timestamps of the input video stream by a floating-point number
- `-output`: Specify the output file
- `-r float`: Set the frame rate of the output video
- `-ss float`: Specify the start time for trimming, seeking to the given time position before starting to process the file
- `-t float`: Set the duration of the output file

`find expression`: Searche for files within a directory hierarchy

`find -name pattern`: Look for files matching a specific pattern in a directory hierarchy

`gedit file`: Open the file in the Vim text editor

`git`: Version control system

Options:

- `add .`: Stages all changes in the current directory for the next commit
- `branch --unset-upstream`: Removes the upstream tracking from the current branch, making it a local branch only
- `clone link`: Creates a copy of an existing repository located at `link` into a new local directory
- `commit -m message`: Commits the staged changes with a commit message `message`
- `config pull.rebase false`: Configure git to merge the remote branch when pulling
- `init -b main`: Initializes a new Git repository and sets the default branch to `main`
- `push origin :branch-name` deletes the `branch-name` from the remote repository
- `push origin branch-name` pushes your local `branch-name` to the remote, updating or creating it as necessary
- `submodule update --init --recursive`: Initializes and updates submodules recursively, including nested submodules

`httrack link`: Download websites to a local directory for offline viewing

Options:

- `-%v`: Provide detailed information
- `--depth=10`: Set the maximum recursion depth to 10
- `--max-rate=200K`: Limit the download speed to 200KB/s
- `--robots=0`: Ignore robots.txt rules
- `-O path`: Specify the output directory

`id -u user`: Get UID of user

`ip link show`: Provide information about all network interfaces

`killall process`: Terminate all processes of `process`

`ln -s source destination`: Generate a symbolic link pointing to a file or directory

`ls`: List the files and directories in the current directory

Options:

- `-a`: Include hidden files
- `-l`: Use long format, showing permissions, ownership, size, and modification date

`lsattr path`: List the attributes of the files or directories

`lsblk`: List information about all available storage devices

`lshw`: List detailed information about the hardware configuration of the machine

`man program`: Show the manual page for a program

`mkdir directory`: Create a new directory

`mkfs.ext4 partition`: Create an ext4 filesystem

`mkfs.fat -F32 partition`: Create a FAT32 filesystem

`mount`: Mount a unmounted filesystem

`mv path1 path2`: Move or rename by overwriting the file or directory at path1 to path2

`ollama`: Local LLM model server

Options:

- `serve`: Start the server to host models
- `list`: Display a list of available models
- `pull model`: Download a model to the local system
- `rm model`: Remove a model from the local storage
- `run model`: Execute a model that is available locally

`pip install package --upgrade`: Install the latest version of a package, upgrading it if already installed

`tar caf path.tar.algorithm path`: Compress a file using a specified algorithm

Options:

- `--exclude=path`: Exclude a specific path
- `--one-file-system`: Prevent following symlinks to other filesystems
- `-C directory`: Change the current working directory
- `-J`: Use xz compression
- `-a`: Autodetect the compression algorithm
- `-c`: Compress
- `-f name`: Specify the filename
- `-j`: Use bzip compression
- `-p`: Preserve file permissions
- `-v`: Provide detailed information
- `-x`: Extract
- `-z`: Use gzip compression
- `..`: Parent directory
- `.`: Current directory

`touch -amt 197001010100.00 file`: Create/update the access and modification times

`tree`: Show the contents of directories in a tree-like format

Options:

- `a`: Includes hidden files
- `d`: Displays only directories
- `x`: Stays within the same filesystem

`umount`: Unmount a mounted filesystem

`nano file`: Open the file in the Nano text editor

`vim file`: Open the file in the Vim text editor

`nvidia-smi`: Display information about GPU utilization, temperature, memory usage, and more

`ps -aux`: Lists all running processes on the system.

`-a`: All users, `-u`: User-oriented format, `-x`: Include hidden processes

`reboot`: Reboot the system immediately

`shutdown +minutes`: Schedule/delay shutting down

`shutdown -c`: Cancel shutting down

`shutdown now`: Shut down the system immediately

`wget`: Download files from the internet

Options:

- `--convert-links`: Convert links so that they work locally, off-line
- `--domains domain`: Limit the download to a specific domain
- `--html-extension`: Save files with the .html extension
- `--limit-rate=200K`: Limit the download speed to 200Kb/s
- `--no-clobber`: Don't overwrite any existing files
- `--no-parent`: Do not download anything from the parent directory
- `--page-requisites`: Download all the files necessary to properly display a web page
- `--random-wait`: Wait between downloads to mimic human browsing
- `--restrict-file-names=windows`: Modify filenames so that they will work in Windows as well
- `-E`: Append .html to the extensions of HTML documents that do not have it
- `-K`: Keep a backup of the original files before converting links
- `-O path`: Specify the output directory
- `-P path`: Set the directory prefix for downloaded files
- `-U mozilla`: Identify as a Mozilla browser
- `-e robots=off`: Ignore the robots.txt file to ensure no restrictions on the content
- `-k`: Convert links for offline viewing
- `-l 10`: Set the maximum recursion depth to 10
- `-m`: Mirror the entire site
- `-p`: Download all necessary files to display the HTML page
- `-r`, `--recursive`: Enable recursive downloading

`xprop`: Retrieve information about a window clicked in an X server environment

`xrandr`: List all available monitor configurations

`xz -9efkvz path`: Compress a file using the XZ compression algorithm

Options:

- `-9`: Highest compression level
- `-e`: Extreme compression
- `-f`: Force if already exists
- `-k`: Keep the original file
- `-v`: Provide detailed information
- `-z`: Compress

`zip -0 -r path.zip path`: Creates a zip archive

Options:

- `-0`: Stores without compression
- `-r`: Recursive/include subdirectories and their content

`unzip archive -d destination`: Extracts files from a ZIP archive

`rsync -avz path1 path2`: Synchronizes files and directories between two locations

Options:

- `--no-g`: Prevent setting group permissions
- `--no-o`: Prevent setting ownership permissions
- `--no-perms`: Prevent changing permissions
- `-a`: Archive mode/preserves symlinks, devices, attributes, permissions, ownerships
- `-v`: Provide detailed information
- `-z`: Compress during data transfer
