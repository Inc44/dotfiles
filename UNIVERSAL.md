### Creating Symlinks
```
sudo rm -r /home/pc/.cache/huggingface/hub
sudo rm -r /home/pc/.cache/kagglehub/models
sudo rm -r /home/pc/.ollama/models
sudo rm -r /home/pc/stable-diffusion-webui/models
ln -s /run/media/pc/A0CE05DFCE05AF1A/huggingface/hub /home/pc/.cache/huggingface/hub
ln -s /run/media/pc/A0CE05DFCE05AF1A/kagglehub/models /home/pc/.cache/kagglehub/models
ln -s /run/media/pc/A0CE05DFCE05AF1A/ollama/models /home/pc/.ollama/models
ln -s /run/media/pc/A0CE05DFCE05AF1A/stable-diffusion-webui/models /home/pc/stable-diffusion-webui/models
```
### Disabling Shutdown Confirmation
```
gsettings set org.gnome.SessionManager logout-prompt false
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
### Installing AutoKhan
```
conda create --name AutoKhan python=3.10.13
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
### Installing Chatgpt Telegram Bot
```
conda create --name ctb python=3.10.13
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
### Installing Font Awesome
```
git clone https://github.com/eliyantosarage/font-awesome-pro.git
cp -r ~/font-awesome-pro/fontawesome-pro-6.5.1-desktop/otfs/* ~/.fonts
sudo rm -r ~/font-awesome-pro
sudo fc-cache -f -v
```
### Installing Inkscape Figures
```
sudo pip install inkscape-figures --break-system-packages
```
### Installing Inkscape Shortcut Manager
```
conda create --name inksm python=3.10.13
conda activate inksm
pip install xlib
git clone https://github.com/gillescastel/inkscape-shortcut-manager.git
```
### Installing Insanely Fast Whisper
```
conda create --name ifw python=3.10.13
conda activate ifw
pip install insanely-fast-whisper
pip install flash-attn
pip install speechbrain==0.5.16
insanely-fast-whisper --file-name audio --model-name openai/whisper-large-v3 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
insanely-fast-whisper --file-name audio --model-name distil-whisper/distil-large-v2 --task transcribe --language fr --batch-size 30 --flash True --hf_token token --diarization_model pyannote/speaker-diarization
```
### Installing Jupyter
```
conda create --name jupyter python=3.10.13
conda activate jupyter
conda install -c conda-forge jupyterlab notebook
```
### Installing MaTools
```
conda create --name MaTools python=3.10.13
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
conda deactivate
sudo python3 -OO /boot/grub2/themes/minegrub/update_theme.py '' 'I use Arch BTW!'
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
cd miniconda3/bin
./conda init
```
### Installing NanoGPT
```
conda create --name nanogpt python=3.10.13
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
### Installing Nerf Studio
```
sudo docker pull dromni/nerfstudio:1.0.2
```
### Installing OCRMyPDF
```
conda create --name ocrmypdf python=3.10.13
conda activate ocrmypdf
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install ocrmypdf
pip install git+https://github.com/ocrmypdf/OCRmyPDF-EasyOCR.git
```
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
### Installing Stable Diffusion Webui
```
conda deactivate
wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh
chmod +x webui.sh
LD_PRELOAD=/lib/libstdc++.so.6 ./webui.sh --xformers
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

Turn off ``
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
### Installing TheSync
```
git clone https://github.com/Inc44/TheSync.git
```
### Installing TheTTS
```
conda create --name TheTTS python=3.10.13
conda activate TheTTS
pip install openai==1.13.3 TTS==0.22.0
DS_BUILD_TRANSFORMER_INFERENCE=1 pip install deepspeed==0.14.0
git clone https://github.com/Inc44/TheTTS.git
cd TheTTS
git lfs install
git clone https://huggingface.co/coqui/XTTS-v2
sudo rm -r XTTS-v2/.git
cp /home/pc/TheTTS/xtts.py /home/pc/miniconda3/envs/TheTTS/lib/python3.10/site-packages/TTS/tts/models
```
### Installing UVR
```
conda create --name uvr python=3.10.13
conda activate uvr
git clone https://github.com/Anjok07/ultimatevocalremovergui.git
cd ultimatevocalremovergui
wget https://raw.githubusercontent.com/Inc44/dotfiles/main/Dora-0.0.3.tar.gz -O Dora-0.0.3.tar.gz
pip install Dora-0.0.3.tar.gz
pip install -r requirements.txt
```
### Installing Vim-Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim > :set spell > Y > Y > 1 > Y > Enter
vim > :PlugInstall
mkdir ~/.vim/UltiSnips
wget https://raw.githubusercontent.com/gillescastel/latex-snippets/master/tex.snippets -O ~/.vim/UltiSnips/tex.snippets
```
### Installing WhisperX
```
conda create --name whisperx python=3.10.13
conda activate whisperx
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
pip install git+https://github.com/m-bain/whisperx.git
pip install faster-whisper==1.0.0 --upgrade
```
### Installing WhiteSur Theme
```
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -t purple -c Light
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

Select: `WhiteSur-Light-solid-purple`
### Fixing Default Directory Opener
```
xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime query default inode/directory
```