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

`conda list`: Display all installed packages in the current environment

`conda activate env`: Activate the `env` environment

`conda clean -a`: Clean unused packages and caches

`conda create --name env python=3.10`: Create a `env` environment named "env" with Python version 3.10 installed

`conda env list`: Show a list of all conda environments

`conda env remove env`: Remove the `env` environment

`cp path1 path2`: Copy by overwriting the file or directory at `path1` to `path2`

`df -H`: Display disk space usage in a human-readable format across all mounted filesystems

`docker run dromni/nerfstudio:1.1.3`: Start a Docker container for Nerf Studio

Options:

- `--gpus all`: Allocate all available GPUs to the Docker container
- `-u $(id -u)`: Set the user ID for the Docker container to the user ID of the current user, ensuring file permissions match outside and inside the container
- `-v /home/pc/data:/workspace/`: Mount the directory from the host to the container
- `-v /home/pc/.cache/:/home/user/.cache/`: Mount the cache directory from the host to the cache directory in the container
- `-p 7007:7007`: Map port 7007 on the host to port 7007 on the container
- `--rm`: Automatically remove the container when it exits, cleaning up any resources used
- `-it`: Run the container in interactive mode with a tty, allowing you to interact with the container via the command line
- `--shm-size=12gb`: Set the shared memory size available to the container to 12 GB

---

`ns-download-data`: Initiate a data download operation

Options:

- `blender`: Specify the Blender dataset

---

`ns-train model`: Start the training process

Options:

- `blender-data`: Indicate the type of the training dataset
- `--data data/blender/lego`: Specify the path for the dataset

---

- Highest Quality Models: `instant-ngp`, `splatfacto-big`
- Other Models: `splatfacto`, `nertfacto-big`, `pynerf`, `dolphincoder`, `seathru-nerf-lite`, `tensorf`, `vanilla-nerf`

---

`faillock --user user --reset`: Reset the faillock counter for user `user`

`fc-list`: Display all available fonts and styles

`ffmpeg -i input -c copy output`: Copy the media stream from the input file to the output file without re-encoding

`ffmpeg -i input -map 0:v -map 0:a:1 -map 0:a:0 -map 0:s:1 -map_metadata 0 -c copy -disposition:a:0 default -disposition:a:1 none -ss m:ss -t s -y output`: Copy the media stream from the input file to the output file without re-encoding, setting audio stream disposition, trimming, and overwriting the output file without asking

Options:

- `-`: Print output
- `-ac 2`: Set audio channels to 2
- `-an`: Disable audio
- `-ar 44100|48000`: Set audio sample rate
- `-b 0`: Use a bitrate of 0, which enables constant quality mode
- `-b:a 128k`: Set audio bitrate to 128k
- `-bufsize 10M`: Set buffer size to 10M
- `-b:v 10M`: Set video bitrate to 10M
- `-codec|c copy`: Copy both audio and video streams without re-encoding
- `-c:a aac`: Use Use AAC audio codec
    - `-strict experimental|-2`: Enable experimental features
- `-c:a copy`: Copy the audio stream without re-encoding
- `-c:a flac`: Use Free Lossless Audio Codec
    - `-compression_level 12`: Set to maximum compression level
    - `-strict experimental|-2`: Enable experimental features, such as 32-bit encoding
- `-color_range pc|0|tv|1|mpeg|2`: Set the color range
- `-c:v av1_nvenc|libaom-av1`: Use AV1 codec
    - `-tile-columns 0`: Set the number of tile columns
    - `-tile-rows 0`: Set the number of tile rows
- `-c:v av1_nvenc|hevc_nvenc|h264_nvenc`: Use NVIDIA's hardware-accelerated codecs
    - `-bf 4`: Set the maximum number of B-frames between non-B-frames
    - `-cq 32|24|16`: Specify Constant Quantizer for quality level
    - `-preset p7`: Use the highest quality preset
    - `-rc vbr`: Set rate control to use variable bitrate
- `-c:v ffv1`: Use FFV1 codec for lossless video encoding
- `-c:v hevc_qsv|h264_qsv|libx265|libx264`: Use respective codecs
    - `-preset placebo|veryslow`: Set encoding preset
    - `-qp 24|16`: Set the quantization parameter
    - `-vprofile high`: Use the high profile
- `-c:v libaom-av1`: Use AV1 codec
    - `-cpu-used 4`: Set encoding preset
    - `-lag-in-frames 48`: Specify frames for lookahead computation
    - `-aom-params lossless=1`: Encode in lossless mode
- `-c:v libsvtav1`: Use SVT-AV1 codec
    - `-preset 4`: Set encoding preset
- `-c:v libx265`: Use x265 codec
    - `-x265-params "profile=crf=16:preset=placebo:qp=16"`: Specify x265 encoding parameters for high quality
    - `-x265-params "profile=crf=0:lossless=1:preset=placebo:qp=0"`: Specify x265 encoding parameters for lossless
- `-c:v copy`: Copy the video stream without re-encoding
- `-crf 32|24|16`: Set Constant Rate Factor
- `-f md5`: Generate MD5 checksum of the output
- `-framerate 30`: Set the output framerate
- `-filter:a "atempo=float"`: Adjust the audio playback speed without changing its pitch
- `-hide_banner`: Suppress startup banner and other non-critical output
- `-hwaccel qsv; nvdec`: Use hardware acceleration
- `-i %d.png`: Specify input files with a sequence of numbered PNG files
- `-i %4d.png`: Specify input files with a sequence of four-digit numbered PNG files
- `-i %04d.png`: Specify input files with a sequence of four-digit numbered PNG files with leading zeros
- `-i "concat:0|1|...|n"`: Concatenate multiple inputs
- `-i input`: Specify the input file
- `-itsscale float`: Scale the timestamps of the input video stream by a floating-point number
- `-loglevel error`: Display only error messages
- `-lossless 1`: Enable lossless encoding
- `-map file:stream|int:int`: Map a stream of a file to an output
    - `-map 0:v:0`: Map the first video stream of the first input file
    - `-map 0:a:1 -map 0:a:0`: Map the second and first audio streams of the first input file
    - `-map 0:s:1`: Map the second subtitle stream of the first input file
- `-map_metadata 0`: Map all global metadata from the first input file
- `-maxrate 10M`: Set the maximum bitrate
- `-output`: Specify the output file
- `-pass 1 -f null /dev/null && \`: Execute a two-pass encoding, first pass with output directed to null
- `-pass 2`: Execute the second pass of a two-pass encoding
- `-pix_fmt yuv420p10le|yuv420p|yuv444p|rgba|bgra`: Set the pixel format
- `-r float`: Set the frame rate of the output video
- `-ss float`: Specify the start time for trimming, seeking to the given time position before starting to process the file
- `-t float`: Set the duration of the output file
- `-y`: Overwrite output files without asking
- `-disposition:a:0 default`: Set the first audio stream as the default
- `-disposition:a:1 none`: Set the second audio stream as non-default
- `-filter_complex|vf`: Apply complex video filters
    - `[file0][file1] overlay=240:250[output0]`: Overlay `file1` over `file0` and output to `output1`
    - `"[file0:v] [file0:a] [file1:v] [file1:a] concat=n=2:v=1:a=1 [output0v] [output0a]"`: Concatenate two sets of video and audio streams
    - `crop=230:120:190:50`: Crop the video to a width of 230 pixels and a height of 120 pixels, starting at position (190, 50) on the input video
    - `crop=min(iw\,ih):min(iw\,ih)`: Crop the video to a square where both the width and height are equal to the smaller dimension of the input video
    - `yadif`: Apply the YADIF deinterlacing filter to the video stream

`find expression`: Searche for files within a directory hierarchy

`find -name pattern`: Look for files matching a specific pattern in a directory hierarchy

`flatpak list`: Show all installed Flatpak applications

`free -h`: Display amount of free and used memory in a human-readable format

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

`ifconfig`: Display network interface configuration information, including IP addresses

`ip link show`: Provide information about all network interfaces

`killall process`: Terminate all processes of `process`

`ln -s source destination`: Generate a symbolic link pointing to a file or directory

`ls`: List the files and directories in the current directory

Options:

- `-a`: Include hidden files
- `-l`: Use long format, showing permissions, ownership, size, and modification date

`lsattr path`: List the attributes of the files or directories

`lsblk`: List information about all available storage devices

Options:

- `-f`: Output information about filesystems

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

---

- Smartest Models: `llama3`, `mixtral`, `phi3`
- Good Models: `cas/mistral-ft-optimized-1227`, `cas/mixtral_11bx2_moe`, `eas/nous-capybara`, `mgmacleod/laserxtral`
- Okay Models: `dolphin-mistral`, `dolphin-phi`, `dolphincoder`, `mistral`, `neural-chat`, `nexusraven`, `wizard-math`, `yarn-mistral`, `zephyr`
- Bad Models: `gemma`, `gemma:2b`, `phi2`
- Vision Good Models: `llava:13b`
- Vision Okay Models: `bakllava`

---

`pacman`: The package manager utility for Arch Linux

Options:

- `-Q`: Query installed packages
- `-Rsnc package`: Remove a package and its dependencies, along with the configuration files
- `-Ss package`: Search for packages that contain the keyword
- `-Syu`: Synchronize package databases and update all packages to their latest versions
- `-U /path/to/package`: Install a local package file
- `pacman -Qtdq`: List all unused packages (orphans)

`passwd user`: Change the user's password

`pihole status`: Display the status of the Pi-hole

`pihole -a -p`: Change the Pi-hole admin password

`ping example.com`: Check the network connection and measure the latency

`pip cache purge`: Clear the local cache of downloaded Python packages

`pip install -e .`: Install a Python package from the current directory

`pip install package --upgrade`: Install the latest version of a package, upgrading it if already installed

`python -OO script.py`: Execute a Python script with optimizations enabled, stripping docstrings and assert statements

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

`ss -lp "sport = :domain"`: Display all listening sockets with the source port 'domain'

`ssh user@192.168.0.0`: Initiate a secure shell connection to the device with IP address `192.168.0.0` using the username `user`

`sudo su`: Switche the user to the root user

`systemctl`: Control the systemd system and service manager

Options:

- `enable SERVICE`: Enable a service to start on boot
- `restart SERVICE`: Restart a service
- `start SERVICE`: Start a service

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
