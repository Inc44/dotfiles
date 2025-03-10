### Creating Symlinks
```
sudo rm -r /home/pc/.ollama/models
ln -s /hdd/ollama/models /home/pc/.ollama/models
```
### Configuring CyberGhost
```
sudo cyberghostvpn --setup
sudo vim /etc/sudoers
```
Comment out `Defaults secure_path`
Override the read-only file with `wq!`
### Configuring Github
```
gh auth login
```
### Configuring GRUB
```
sudo vim /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
### Configuring Mkinitcpio
```
sudo vim /etc/mkinitcpio.conf
mkinitcpio -p linux -p linux-lts
```
### Disabling Auto-Save Session
```
gsettings set org.gnome.SessionManager auto-save-session false
```
### Disabling Shutdown Confirmation
```
gsettings set org.gnome.SessionManager logout-prompt false
```
### Disabling Extension Version Validation
```
gsettings set org.gnome.shell disable-extension-version-validation true
```
### Fixing App Picker Layout
```
gsettings reset org.gnome.shell app-picker-layout 
```
### Installing 7-Zip
```
wget https://www.7-zip.org/a/7z2301-linux-x64.tar.xz -O 7z2301-linux-x64.tar.xz
mkdir 7-zip
tar xf 7z2301-linux-x64.tar.xz -C 7-zip
rm 7z2301-linux-x64.tar.xz
```
### Installing AppIndicator and KStatusNotifierItem Support
Open `Extension Manager`

Click `Browse`

Type `AppIndicator and KStatusNotifierItem Support`

Click `Install`

Click `Installed`

Click `AppIndicator and KStatusNotifierItem Support` > `Settings`

Click `Position and size`

Select `Opacity` > `255`
### Installing Autodesk Fusion 360
```
curl -L https://raw.githubusercontent.com/cryinkfly/Autodesk-Fusion-360-for-Linux/main/files/setup/autodesk_fusion_installer_x86-64.sh -o "autodesk_fusion_installer_x86-64.sh" && chmod +x autodesk_fusion_installer_x86-64.sh && ./autodesk_fusion_installer_x86-64.sh --install --default
```
### Installing AutoKhan
```
conda create --name AutoKhan python=3.10 -y
conda activate AutoKhan
git clone https://github.com/Inc44/AutoKhan.git
cd AutoKhan
pip install -r requirements.txt
```
### Installing Birthday
```
git clone https://github.com/Inc44/Birthday.git
```
### Installing Blazingly Fast Rust Donut
```
cargo install blazingly_fast_rust_donut
```
### Installing Blog
```
git clone https://github.com/Inc44/blog.git
```
### Installing Brute Force Instagram
```
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
```
conda create --name ctb python=3.10 -y
conda activate ctb
git clone https://github.com/n3d1117/chatgpt-telegram-bot.git
cd chatgpt-telegram-bot
pip install -r requirements.txt
```
### Installing Cargo Cache
```
cargo install cargo-cache
```
### Installing Color Picker
Open `Extension Manager`

Click `Browse`

Type `Color Picker`

Click `Install`

Click `Installed`

Click `Color Picker` > `Settings`

Turn on `Automatically copy`

Select `Default format` > `HEX`

Select `Shortcut to pick` > `Super + C`

Turn off `Notification style`

Turn on `Persistent mode`

Select `Enable preview` > `Label`

Turn off `Enable systray`
### Installing Comfy UI
```
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
### Installing Dash to Dock
Open `Extension Manager`

Click `Browse`

Type `Dash to Dock`

Click `Install`

Click `Installed`

Click `Dash to Dock` > `Settings`

Click `Intelligent autohide`

Turn off `Dodge windows`

Click `Position and size`

Select `Icon size limit` > `64`
### Installing Desktop Icons NG (DING)
Open `Extension Manager`

Click `Browse`

Type `Desktop Icons NG (DING)`

Click `Install`

Click `Installed`

Click `Desktop Icons NG (DING)` > `Settings`

Select `Size for the desktop icons` > `Large`

Turn off `Show the personal folder in the desktop`

Turn off `Show the trash icon in the desktop`

Turn off `Show external drives in the desktop`

Turn off `Show network drives in the desktop`

Select `New icons alignment` > `Top-left corner`

Turn off `Add new drives to the opposite side of the screen`

Turn on `Highlight the drop place during Drag'n'Drop`

Turn off `Use Nemo to open folders`

Turn on `Add an emblem to soft links`

Turn off `Use dark text in icon labels`

Select `Click type for open files` > `Double click`

Turn on `Show hidden files`

Turn off `Show a context menu item to delete permanently`

Select `Show image thumbnails` > `Local files only`
### Installing Dotfiles
```
git clone https://github.com/Inc44/dotfiles.git
cd dotfiles
stow . -t ~
```
### Installing ECT
```
git clone --recursive https://github.com/fhanau/Efficient-Compression-Tool.git
cd Efficient-Compression-Tool
mkdir build
cd build
cmake ../src
make
```
### Installing First Order Model
```
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
```
git clone https://github.com/eliyantosarage/font-awesome-pro.git
cp -r ~/font-awesome-pro/fontawesome-pro-6.5.1-desktop/otfs/* ~/.fonts
sudo rm -r ~/font-awesome-pro
sudo fc-cache -f -v
```
### Installing GPEN
```
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
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x4.pth)
wget https://public-vigen-video.oss-cn-shanghai.aliyuncs.com/robin/models/realesrnet_x4.pth
python demo.py --task FaceEnhancement --model GPEN-BFR-512 --in_size 512 --channel_multiplier 2 --narrow 1 --use_sr --sr_scale 4 --use_cuda --save_face --indir examples/imgs --outdir examples/outs-bfr
python demo.py --task FaceColorization --model GPEN-Colorization-1024 --in_size 1024 --use_cuda --indir examples/grays --outdir examples/outs-colorization
python demo.py --task FaceInpainting --model GPEN-Inpainting-1024 --in_size 1024 --use_cuda --indir examples/ffhq-10 --outdir examples/outs-inpainting
python demo.py --task Segmentation2Face --model GPEN-Seg2face-512 --in_size 512 --use_cuda --indir examples/segs --outdir examples/outs-seg2face
```
### Installing Inkscape Figures
```
sudo pip install inkscape-figures --break-system-packages
```
### Installing Inkscape Shortcut Manager
```
conda create --name inksm python=3.10 -y
conda activate inksm
pip install xlib
git clone https://github.com/gillescastel/inkscape-shortcut-manager.git
```
### Installing Insanely Fast Whisper
```
conda create --name ifw python=3.10 -y
conda activate ifw
pip install insanely-fast-whisper
pip install flash-attn
pip install speechbrain==0.5.16
insanely-fast-whisper --file-name audio --model-name openai/whisper-large-v3 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
insanely-fast-whisper --file-name audio --model-name distil-whisper/distil-large-v2 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
```
### Installing Jupyter
```
conda create --name jupyter python=3.10 -y
conda activate jupyter
conda install -c conda-forge jupyterlab notebook -y
```
### Installing MaTools
```
conda create --name MaTools python=3.10 -y
conda activate MaTools
git clone https://github.com/Inc44/MaTools.git
cd MaTools
pip install -r requirements.txt
```
### Installing Minegrub
```
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
```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init
```
In case you reinstalled conda and `conda env list` doesn't work:
```
pip install archspec
```
### Installing NanoGPT
```
conda create --name nanogpt python=3.10 -y
conda activate nanogpt
pip install torch numpy transformers datasets tiktoken wandb tqdm
git clone https://github.com/karpathy/nanoGPT.git
```
### Installing Nerd Fonts
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Noto.zip
unzip Noto.zip "*.ttf" -d ~/.fonts
rm Noto.zip
sudo fc-cache -f -v
```
### Installing Nerf Studio Docker
```
sudo docker pull dromni/nerfstudio:1.1.3
```
### Installing Nerf Studio Python
```
conda create --name nerfstudio python=3.8 -y
conda activate nerfstudio
pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
conda install -c "nvidia/label/cuda-11.8.0" cuda-toolkit -y
pip install nerfstudio
ns-install-cli
mkdir -p ~/data/blender
```
Download Dataset from [Kaggle](https://www.kaggle.com/datasets/nguyenhung1903/nerf-synthetic-dataset)
```
unzip archive.zip 'nerf_synthetic/*' -d ~/
mv ~/nerf_synthetic/* ~/data/blender/
rm -rf ~/nerf_synthetic
ns-train splatfacto blender-data --data data/blender/lego
ns-viewer --load-config /home/pc/outputs/nerfstudio/splatfacto/lego/config.yml
```
### Installing OCRMyPDF
```
conda create --name ocrmypdf python=3.10 -y
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
```
### Installing Ollama Benchmark
```
pipx install llm-benchmark
```
or
```
pipx run llm-benchmark run --no-sendinfo
```
### Installing Pano
Open [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano)

Click `Browse`

Click `Open`

Click `Unsupported`

Click `Install Anyway`
### Installing raqua
```
git clone https://github.com/Inc44/raqua.git
```
### Installing Recoverpy
```
sudo pipx install recoverpy
```
or
```
sudo pipx run recoverpy
```
### Installing Rockyou
```
wget https://download.weakpass.com/wordlists/90/rockyou.txt.gz -O rockyou.txt.gz
gzip -d rockyou.txt.gz
```
### Installing Sky AR
```
git clone https://github.com/jiupinjia/SkyAR.git 
cd SkyAR
```
Download Checkpoint from [Google Drive](https://drive.usercontent.google.com/download?id=1COMROzwR4R_7mym6DL9LXhHQlJmJaV0J)
```
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
```
conda create --name webui python=3.10
conda activate webui
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
python launch.py --xformers
```
### Installing Tactile
Open `Extension Manager`

Click `Browse`

Type `Tactile`

Click `Install`

Click `Installed`

Click `Tactile` > `Settings`

Click `Layout 1` > `3x1`

Click `Layout 2` > `4x1`

Click `Layout 3` > `3x2`

Click `Layout 4` > `4x2`

Click `Keyboard Shortcuts`

Select `Show tiles` > `Super + W`

Select `Open extension settings` > `Shift + Ctrl + Alt + Super + T`

Click `Advanced`

Turn off `Maximize window when possible`
### Installing TeX Live
```
wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
rm install-tl-unx.tar.gz
cd install-tl-*
sudo perl ./install-tl --no-interaction
rm -r install-tl-*
```
or
```
wget https://mirrors.ircam.fr/pub/CTAN/systems/texlive/Images/texlive.iso
sudo mkdir /mnt
sudo mount -t iso9660 -o ro,loop,noauto texlive.iso /mnt
sudo perl /mnt/install-tl --no-interaction
sudo umount texlive.iso
rm texlive.iso
```
### Installing Texify
```
conda create --name tex python=3.10 -y
conda activate tex
pip install streamlit streamlit-drawable-canvas-jsretry watchdog
texify_gui
pip install texify
texify_gui
```
### Installing TheSync
```
git clone https://github.com/Inc44/TheSync.git
```
### Installing TheTTS
```
conda create --name TheTTS python=3.10 -y
conda activate TheTTS
pip install openai==1.13.3 TTS==0.22.0
DS_BUILD_TRANSFORMER_INFERENCE=1 pip install deepspeed==0.14.0
git clone https://github.com/Inc44/TheTTS.git
cd TheTTS
git lfs install
git clone https://huggingface.co/coqui/XTTS-v2
sudo rm -r XTTS-v2/.git
cp /home/pc/github/TheTTS/xtts.py /home/pc/miniconda3/envs/TheTTS/lib/python3.10/site-packages/TTS/tts/models
```
### Installing UVR
```
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
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
vim > :set spell spelllang=fr > Y > 1 > Y > Enter
vim > :set spell spelllang=ru > Y > 1 > Y > Enter
vim > :PlugInstall
```
mkdir ~/.vim/UltiSnips
wget https://raw.githubusercontent.com/gillescastel/latex-snippets/master/tex.snippets -O ~/.vim/UltiSnips/tex.snippets
```
### Installing WhisperX
```
conda create --name whisperx python=3.10 -y
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
pip install git+https://github.com/m-bain/whisperx.git
pip install faster-whisper==1.0.0 --upgrade
```
### Installing WhiteSur Theme
```
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -t purple -c Dark
sudo rm -r ~/WhiteSur-gtk-theme
cd ..
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd WhiteSur-icon-theme
./install.sh -a -t purple
sudo rm -r ~/WhiteSur-icon-theme
```
Open `Extensions`

Click `Search`

Type `User Themes`

Turn on `User Themes`

Click `Settings`

Select `WhiteSur-Light-solid-purple`
### Fixing Default Directory Opener
```
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
