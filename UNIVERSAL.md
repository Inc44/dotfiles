### Installing 7-Zip
```
wget https://www.7-zip.org/a/7z2301-linux-x64.tar.xz -O 7z2301-linux-x64.tar.xz
mkdir 7-zip
tar xf 7z2301-linux-x64.tar.xz -C 7-zip
rm 7z2301-linux-x64.tar.xz
```
### Installing Blazingly Fast Rust Donut
```
cargo install blazingly_fast_rust_donut
```
### Installing Color Picker
Open `Extension Manager`

Click `Browse`

Type `Color Picker`

Click `Install`

Select: `WhiteSur-Light-solid-purple`

Click `Installed`

Click `Color Picker` > `Settings`

Turn on `Automatically copy`

Select `Default format` > `HEX`

Select `Shortcut to pick` > `Super + C`

Turn off `Notification style`

Turn on `Persistent mode`

Select `Enable preview` > `Label`

Turn off `Enable systray`
### Installing Dotfiles
```
git clone https://github.com/Inc44/dotfiles.git
cd dotfiles
stow .
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
sudo python3 -O /boot/grub2/themes/minegrub/update_theme.py '' 'I use Arch BTW!'
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
### Installing Nerd Fonts
```
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Noto.zip
unzip Noto.zip "*.ttf" -d ~/.fonts
unzip Noto.zip "*.ttf" -d ~/.fonts
sudo fc-cache -f -v
rm Noto.zip
```
### Installing Vim-Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim > :set spell > Y > Y > 1 > Y > Enter
vim > :PlugInstall
mkdir ~/.vim/UltiSnips
wget https://raw.githubusercontent.com/gillescastel/latex-snippets/master/tex.snippets -O ~/.vim/UltiSnips/tex.snippets
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
