### Adding Google Drive (GNOME <50)
```bash
WEBKIT_DISABLE_COMPOSITING_MODE=1 gnome-control-center online-accounts
```

`Google`

If 2FA enabled: `Right Click` > `Reload`
### Applying Wal
```bash
wal --theme base16-rebecca
```
### Configuring Git
```bash
git config --global --unset-all user.name
git config --global --unset-all user.email
git config --global user.name name
git config --global user.email email
```
### Configuring Opam
```bash
opam init
opam env --switch=default
```
### Configuring Rclone
```bash
rclone config
```
```bash
n/s/q> n
name> Google
Storage> 24
client_id>
client_secret>
scope> 1
service_account_file>
y/n>
y/n>
```
Type `your_email`

Click `Next`

Type `your_password`

Click `Next`

Click `Continue`
```bash
y/n>
y/e/d>
e/n/d/r/c/s/q> q
```
### Configuring Rclone Browser
```bash
mkdir Google
mkdir github/Notes
```
Open `Rclone Browser`

Click `File`

Click `Preferences...`

Mount options: `--vfs-cache-mode full`

Click `OK`

Click `Refresh`

Double click `Google`

Click `Mount`

Click `Google`

Click `Open`

Select `Files` > `Else` > `Notes`

Click `Download`

Destination: `/home/pc/github/Notes`

Turn on `Sync`

Select `Delete after transfering`

Task description: `Download Notes`

Click `Transfer`

Transfers `16`

Checkers `16`

Click `Save task`

Click `Upload`

Source: `/home/pc/github/Notes`

Turn on `Sync`

Select `Delete after transfering`

Task description: `Upload Notes`

Click `Transfer`

Transfers `16`

Checkers `16`

Click `Save task`
### Creating Swap
```bash
sudo dd if=/dev/zero of=/swap bs=1M count=16k status=progress
sudo chmod 0600 /swap
sudo mkswap -U clear /swap
sudo swapon /swap
free -h
```
Or
```bash
sudo mkswap /dev/nvme0n1p6
sudo swapon /dev/nvme0n1p6
```
### Fixing Bluetooth
```bash
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
```
### Fixing Docker
```bash
sudo systemctl enable docker
sudo systemctl start docker
```
### Fixing Default Apps
```bash
xdg-mime default code.desktop application/toml
xdg-mime default code.desktop application/x-ipynb+json
xdg-mime default code.desktop text/css
xdg-mime default code.desktop text/javascript
xdg-mime default code.desktop text/markdown
xdg-mime default code.desktop text/rust
xdg-mime default code.desktop text/x-c++src
xdg-mime default code.desktop text/x-csrc
xdg-mime default code.desktop text/x-go
xdg-mime default code.desktop text/x-python
xdg-mime default code.desktop text/x-tex
xdg-mime default com.interversehq.qView.desktop image/gif
xdg-mime default com.interversehq.qView.desktop image/heif
xdg-mime default com.interversehq.qView.desktop image/jpeg
xdg-mime default com.interversehq.qView.desktop image/png
xdg-mime default com.interversehq.qView.desktop image/svg+xml
xdg-mime default com.interversehq.qView.desktop image/tiff
xdg-mime default com.interversehq.qView.desktop image/vnd.adobe.photoshop
xdg-mime default com.interversehq.qView.desktop image/webp
xdg-mime default libreoffice-calc.desktop application/vnd.ms-excel.sheet.macroEnabled.12
xdg-mime default libreoffice-calc.desktop application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
xdg-mime default libreoffice-impress.desktop application/vnd.ms-powerpoint
xdg-mime default libreoffice-impress.desktop application/vnd.openxmlformats-officedocument.presentationml.presentation
xdg-mime default libreoffice-writer.desktop application/msword
xdg-mime default libreoffice-writer.desktop application/vnd.oasis.opendocument.text
xdg-mime default libreoffice-writer.desktop application/vnd.openxmlformats-officedocument.wordprocessingml.document
xdg-mime default microsoft-edge.desktop application/pdf
xdg-mime default microsoft-edge.desktop text/html
xdg-mime default mpv.desktop audio/aac
xdg-mime default mpv.desktop audio/flac
xdg-mime default mpv.desktop audio/ogg
xdg-mime default mpv.desktop audio/vnd.wave
xdg-mime default mpv.desktop video/mp2t
xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/vnd.avi
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-ms-wmv
xdg-mime default org.gnome.TextEditor.desktop application/json
xdg-mime default org.gnome.TextEditor.desktop application/yaml
xdg-mime default org.gnome.TextEditor.desktop text/csv
xdg-mime default org.gnome.TextEditor.desktop text/plain
xdg-mime default org.gnome.TextEditor.desktop text/tab-separated-values
xdg-mime default org.mozilla.Thunderbird.desktop text/vcard
xdg-mime default peazip.desktop application/gzip
xdg-mime default peazip.desktop application/vnd.efi.iso
xdg-mime default peazip.desktop application/x-7z-compressed
xdg-mime default peazip.desktop application/x-tar
xdg-mime default peazip.desktop application/x-vdi-disk
xdg-mime default peazip.desktop application/x-xz
xdg-mime default peazip.desktop application/zip
```
### Fixing Printer
```bash
sudo systemctl enable cups.service
sudo systemctl start cups.service
system-config-printer
```
Unblock > Add > Network Printer > Internet Printing Protocol > ipp://address/ipp > Forward > Brand > Model > Forward > Apply
### Fixing Sunshine
#### Cursor
```bash
sudo setcap cap_sys_admin+p $(readlink -f $(which sunshine))
sudo reboot
```
#### NVENC
```bash
sudo nano /etc/default/grub (`GRUB_CMDLINE_LINUX_DEFAULT="loglevel=0 quiet nvidia-drm.modeset=1"`)
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
#### Permissions
```bash
sudo usermod -aG video,render,input $USER
```
#### Reboot
```bash
systemctl --user edit sunshine
```
Insert
```bash
[Unit]
After=graphical-session.target

[Service]
ExecStartPre=

[Install]
WantedBy=
WantedBy=default.target
```
#### Service
```bash
systemctl --user enable sunshine
systemctl --user start sunshine
```
### Fixing Telegram
If you encounter an empty screen upon launching, try executing the program from the terminal. This method helps to disable OpenGL if you are experiencing issues with it.
```bash
telegram-desktop
```
### Fixing Time
```bash
timedatectl set-local-rtc 1
```
### Moving Home Partition
```bash
https://help.ubuntu.com/community/Partitioning/Home/Moving
```
### Opam Installing Everything
```bash
opam install merlin tuareg user-setup
```
### Remove Arch Linux Logo
```bash
sudo -u gdm dbus-launch gsettings set org.gnome.login-screen logo ''
```
### Configuring Audacity
Open `Audacity`

Turn on `Don't show this again at start up`

Click `OK`
### Configuring Bambu Studio
Open `BambuStudio`

Turn on `Remember my choice`

Click `Yes`

Click `Get Started`

Click `Europe`

Click `Next`

Click `Skip`

Click `Clear all`

Turn on `Bambu Lab X1 Carbon`

Click `Next`

Click `Next`

Click `Finish`

Click `OK`

Click `Login/Register`

Click `System browser login`

Type `your_email`

Type `your_password`

Click `Log In`

Click `Agree`

Click `Open`

Click `Yes`

Click `Sync info`

Click `Continue to sync filaments`

Click `OK`
### Configuring Czkawka
Open `Czkawka`

Click `Ok`
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
### Configuring Emacs
Open `Emacs`

Click `Options`

Turn on `Cut/Paste with C-x/C-c/C-v (CUA Mode)`

Click `Save Options`
### Configuring Eye of GNOME
Open `Eye of GNOME`

Click $\cdots$ icon

Click `Open...`

Click `dotfiles`

Click `wallpaper.png`

Click `Open`

Click $\cdots$ icon

Click `Set as Wallpaper`
### Configuring Inkscape
Open `Inkscape`

Click `Time to Draw`

Turn off `Show this every time`

Click `New Document`
### Configuring Obsidian
Open `Obsidian`

Click `Open`

Click `Notes`

Click `Select`

Click `Trust author and enable plugins`
### Configuring Oculante
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
### Configuring Parsec
Open `Parsec`

Type `your_email`

Type `your_password`

Click `Log In`
### Configuring PeaZip
Open `PeaZip`

Click `Options`

Click `Settings`

Click `Theme`

Click `Application accent`

Click + icon

Type `#8764b8`

Click `Select`

Click `Text accent`

Click `#8764b8`

Click `Select`

Click `OK`
### Configuring qBittorrent
Open `qBittorrent`

Click `OK`

Click `0 B/s (0 B)`

Speed limits

Upload: $\infty$

Download: `$\infty$

Alternative speed limits

Upload: $\infty$

Download: `$\infty$

Click `OK`
### Configuring qView
Open `qView`

Click 🗙 icon
### Configuring Steam
Open `Steam`

Type `your_name`

Type `your_password`

Click `Sign in`

Click `Library`

Click `Touge Shakai`

Click `Install`

Click `Install`
### Configuring Telegram
Open `Telegram`

Click `Start Messaging`

Type `your_password`

Click $\equiv$ icon

Turn on `Night Mode`

Click `Disable`

Click `Settings`

Click `Chat Settings`

Click `Night`

Click $\leftarrow$

Click `Advanced`

Click `Manage local storage`

Total size limit: `200 MB`

Clear files older than: `1 week`

Click `Save`

Turn on `Hardware accelerated video decoding`

Click `Manage dictionaries`

Turn on `Français`

Turn on `Русский`

Turn on `Українська`

Click `Save`

Click $\leftarrow$

Click `Battery and Animations`

Turn off `Animations in Chats`

Turn off `Animations in Calls`

Turn off `Interface animations`

Click `Save`
### Configuring Visual Studio Code
Open `Visual Studio Code`

Click 🗙 icon

Click `Backup and Sync Settings...`

Click `Sign in`

Click `Sign in with GitHub`

Type `your_email`

Type `your_password`

Click `Sign in`

Click `Continue`

Click `Open`

Click 🗙 icon

Click 🗙 icon
### Creating Symlinks
```bash
sudo rm -r /home/pc/.ollama/models
ln -s /hdd/ollama/models /home/pc/.ollama/models
```
### Configuring CyberGhost
```bash
sudo cyberghostvpn --setup
sudo vim /etc/sudoers
```
Comment out `Defaults secure_path`
Override the read-only file with `wq!`
### Configuring Github
```bash
gh auth login
```
### Configuring GRUB
```bash
sudo vim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
### Configuring Mkinitcpio
```bash
sudo vim /etc/mkinitcpio.conf
mkinitcpio -p linux -p linux-lts
```
### Disabling Auto-Save Session
```bash
gsettings set org.gnome.SessionManager auto-save-session false
```
### Disabling Shutdown Confirmation
```bash
gsettings set org.gnome.SessionManager logout-prompt false
```
### Disabling Extension Version Validation
```bash
gsettings set org.gnome.shell disable-extension-version-validation true
```
### Fixing App Picker Layout
```bash
gsettings reset org.gnome.shell app-picker-layout 
```
### Installing 7-Zip
```bash
wget https://github.com/ip7z/7zip/releases/download/26.01/7z2601-linux-x64.tar.xz
mkdir 7-zip
tar xfC 7z2601-linux-x64.tar.xz 7-zip
rm 7z2601-linux-x64.tar.xz
```
### Installing Autodesk Fusion 360
```bash
curl -L https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/setup/autodesk_fusion_installer_x86-64.sh -o "autodesk_fusion_installer_x86-64.sh" && chmod +x autodesk_fusion_installer_x86-64.sh && ./autodesk_fusion_installer_x86-64.sh --install --default
```
### Installing Brute Force Instagram
```bash
conda create --name bfi python=3.10 -y
conda activate bfi
git clone https://github.com/vv1ck/Brute-Force-instagram
cd Brute-Force-instagram
pip install requests
pip install colorama
wget https://raw.githubusercontent.com/zloi-user/hideip.me/main/https.txt
awk -F':' '{print $1":"$2}' https.txt > fixed_https.txt
```
### Installing Chatgpt Telegram Bot
```bash
conda create --name ctb python=3.10 -y
conda activate ctb
git clone https://github.com/n3d1117/chatgpt-telegram-bot.git
cd chatgpt-telegram-bot
pip install -r requirements.txt
```
### Installing Cargo Cache
```bash
cargo install cargo-cache
```
### Installing Comfy UI
```bash
conda create --name comfy python=3.10 -y
conda activate comfy
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/comfyanonymous/ComfyUI_bitsandbytes_NF4.git
cd ComfyUI_bitsandbytes_NF4
pip install -r requirements.txt
cd ../..
python main.py
```
### Installing ECT
```bash
git clone --recursive https://github.com/fhanau/Efficient-Compression-Tool.git
cd Efficient-Compression-Tool
mkdir build
cd build
cmake ../src
make
```
### Installing First Order Model
```bash
conda create --name fomd python=3.8 -y
conda activate fomd
conda install -c conda-forge jupyterlab notebook -y
git clone https://github.com/AliaksandrSiarohin/first-order-model
cd first-order-model
git clone https://github.com/graphemecluster/first-order-model-demo.git demo
wget https://github.com/graphemecluster/first-order-model-demo/releases/download/checkpoints/vox-cpk.pth.tar
wget https://github.com/graphemecluster/first-order-model-demo/releases/download/checkpoints/vox-adv-cpk.pth.tar
pip install -r requirements.txt
pip install torch torchvision --upgrade
cp "../github/dotfiles/first-order-model-demo (2024).ipynb" .
code "first-order-model-demo (2024).ipynb"
```
Execute `first-order-model-demo (2024).ipynb`
### Installing Font Awesome
```bash
git clone https://github.com/eliyantosarage/font-awesome-pro.git
cp -r ~/font-awesome-pro/fontawesome-pro-6.5.1-desktop/otfs/* ~/.fonts
sudo rm -r ~/font-awesome-pro
sudo fc-cache -f -v
```
### Installing GPEN
```bash
git clone https://github.com/yangxy/GPEN.git
cd GPEN
conda create --name gpen python=3.7 -y
conda activate gpen
conda install -c conda-forge libstdcxx-ng -y
pip install -r requirements.txt
cd weights
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-256-D.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-256.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-512-D.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-BFR-512.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Colorization-1024.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Inpainting-1024.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/GPEN-Seg2face-512.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/ParseNet-latest.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/RetinaFace-R50.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/model_ir_se50.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x1.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x2.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x4.pth
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x4.pth
python demo.py --task FaceEnhancement --model GPEN-BFR-512 --in_size 512 --channel_multiplier 2 --narrow 1 --use_sr --sr_scale 4 --use_cuda --save_face --indir examples/imgs --outdir examples/outs-bfr
python demo.py --task FaceColorization --model GPEN-Colorization-1024 --in_size 1024 --use_cuda --indir examples/grays --outdir examples/outs-colorization
python demo.py --task FaceInpainting --model GPEN-Inpainting-1024 --in_size 1024 --use_cuda --indir examples/ffhq-10 --outdir examples/outs-inpainting
python demo.py --task Segmentation2Face --model GPEN-Seg2face-512 --in_size 512 --use_cuda --indir examples/segs --outdir examples/outs-seg2face
```
### Installing Hound
```bash
sudo docker pull ghcr.io/hound-search/hound:latest
```
### Installing Inkscape Figures
```bash
sudo pip install inkscape-figures --break-system-packages
```
### Installing Inkscape Shortcut Manager
```bash
conda create --name inksm python=3.10 -y
conda activate inksm
pip install xlib
git clone https://github.com/gillescastel/inkscape-shortcut-manager.git
```
### Installing Insanely Fast Whisper
```bash
conda create --name ifw python=3.10 -y
conda activate ifw
pip install insanely-fast-whisper
pip install flash-attn
pip install speechbrain==0.5.16
insanely-fast-whisper --file-name audio --model-name openai/whisper-large-v3 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
insanely-fast-whisper --file-name audio --model-name distil-whisper/distil-large-v2 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
```
### Installing Jupyter
```bash
conda create --name jupyter python=3.10 -y
conda activate jupyter
conda install -c conda-forge jupyterlab notebook -y
```
### Installing Minegrub
```bash
git clone https://github.com/Lxtharia/minegrub-theme.git
cd ./minegrub-theme
sudo mkdir /boot/grub2
sudo mkdir /boot/grub2/themes
sudo cp -ruv ./minegrub /boot/grub2/themes
sudo rm -r ~/minegrub-theme
cd ..
conda deactivate
sudo python -OO /boot/grub2/themes/minegrub/update_theme.py '' 'I use Arch BTW!'
sudo vim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo reboot
```
### Installing Miniconda
```bash
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```
```bash
~/miniconda3/bin/conda init
```
Or
```bash
/opt/miniconda3/condabin/conda init
```
```bash
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
```
In case you reinstalled conda and `conda env list` doesn't work:
```bash
pip install archspec
```
### Installing NanoGPT
```bash
conda create --name nanogpt python=3.10 -y
conda activate nanogpt
pip install torch numpy transformers datasets tiktoken wandb tqdm
git clone https://github.com/karpathy/nanoGPT.git
```
### Installing Nerd Fonts
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Noto.zip
unzip Noto.zip "*.ttf" -d ~/.fonts
rm Noto.zip
sudo fc-cache -f -v
```
### Installing Nerf Studio Docker
```bash
sudo docker pull dromni/nerfstudio:1.1.3
```
### Installing Nerf Studio Python
```bash
conda create --name nerfstudio python=3.8 -y
conda activate nerfstudio
pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit -y
pip install nerfstudio
ns-install-cli
mkdir -p ~/data/blender
```
Download Dataset from [Kaggle](https://www.kaggle.com/datasets/nguyenhung1903/nerf-synthetic-dataset)
```bash
unzip archive.zip 'nerf_synthetic/*' -d ~/
mv ~/nerf_synthetic/* ~/data/blender/
rm -rf ~/nerf_synthetic
ns-train splatfacto blender-data --data data/blender/lego
ns-viewer --load-config /home/pc/outputs/nerfstudio/splatfacto/lego/config.yml
```
### Installing OCRMyPDF
```bash
conda create --name ocrmypdf python=3.10 -y
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
```
### Installing Ollama Benchmark
```bash
pipx install llm-benchmark
```
Or
```bash
pipx run llm-benchmark run --no-sendinfo
```
### Installing pngquant
```bash
cargo install pngquant
```
### Installing Recoverpy
```bash
sudo pipx install recoverpy
```
Or
```bash
sudo pipx run recoverpy
```
### Installing Rockyou
```bash
wget https://download.weakpass.com/wordlists/90/rockyou.txt.gz -O rockyou.txt.gz
gzip -d rockyou.txt.gz
```
### Installing Sky AR
```bash
git clone https://github.com/jiupinjia/SkyAR.git 
cd SkyAR
```
Download Checkpoint from [Google Drive](https://drive.usercontent.google.com/download?id=1COMROzwR4R_7mym6DL9LXhHQlJmJaV0J)
```bash
unzip checkpoints_G_coord_resnet50.zip
conda create --name sky python=3.7 -y
conda activate sky
pip install -r Requirements.txt
pip install scikit-image==0.15.0
python skymagic.py --path ./config/config-annarbor-castle.json
python skymagic.py --path ./config/config-annarbor-supermoon.json
python skymagic.py --path ./config/config-annarbor-thunderstorm.json
python skymagic.py --path ./config/config-canyon-district9ship.json
python skymagic.py --path ./config/config-canyon-galaxy.json
python skymagic.py --path ./config/config-canyon-jupiter.json
python skymagic.py --path ./config/config-canyon-rain.json
```
### Installing Stable Diffusion Webui
```bash
conda create --name webui python=3.10
conda activate webui
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
python launch.py --xformers
```
### Installing TeX Live
```bash
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
rm install-tl-unx.tar.gz
cd install-tl-*
sudo perl ./install-tl --no-interaction
rm -r install-tl-*
```
Or
```bash
wget https://mirrors.ircam.fr/pub/CTAN/systems/texlive/Images/texlive.iso
sudo mkdir /mnt
sudo mount -t iso9660 -o ro,loop,noauto texlive.iso /mnt
sudo perl /mnt/install-tl --no-interaction
sudo umount texlive.iso
rm texlive.iso
```
### Installing Texify
```bash
conda create --name tex python=3.10 -y
conda activate tex
pip install streamlit streamlit-drawable-canvas-jsretry watchdog
texify_gui
pip install texify
texify_gui
```
### Installing UVR
```bash
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv install 3.11.10
pyenv global 3.11.10
pyenv local 3.11.10
pip install --upgrade pip
pip install --upgrade setuptools wheel
pip install pygobject
git clone https://github.com/Anjok07/ultimatevocalremovergui.git
cd ultimatevocalremovergui
rm requirements.txt
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/requirements.txt -O requirements.txt
pip install -r requirements.txt
```
### Installing Vim-Plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
vim > :set spell spelllang=fr > Y > 1 > Y > Enter
vim > :set spell spelllang=ru > Y > 1 > Y > Enter
vim > :PlugInstall
```bash
mkdir ~/.vim/UltiSnips
wget https://raw.githubusercontent.com/gillescastel/latex-snippets/master/tex.snippets -O ~/.vim/UltiSnips/tex.snippets
```
### Installing WhisperX
```bash
conda create --name whisperx python=3.10 -y
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
pip install git+https://github.com/m-bain/whisperx.git
pip install faster-whisper==1.0.0 --upgrade
```
### Fixing Default Directory Opener
```bash
xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime query default inode/directory
```

### Fixing LibreOffice Interface
Open `LibreOffice`

Click `Tools`

Select `Options`

Select `Advanced`

Click `Enable experimental features`

Open `LibreOffice Calc`

Click `View`

Select `User Interface...`

Select `Tabbed`

Click `Apply to Calc`

Sources:
- [Default systemd doesn't work after reboot, requires manually launch](https://github.com/LizardByte/Sunshine/issues/1533)
- [GNOME 50 killed Google Drive integration because nobody wanted to maintain it](https://www.xda-developers.com/gnome-50-killed-google-drive-integration-nobody-wanted-to-maintain-it)
- [Swap](https://wiki.archlinux.org/title/Swap)