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
### Installing Dotfiles
```
git clone https://github.com/Inc44/dotfiles.git
cd dotfiles
stow . -t ~
```
### Installing Gitingest
```
conda create --name gitingest python=3.13 -y
conda activate gitingest
git clone https://github.com/Inc44/gitingest.git
cd gitingest
pip install .[server,static]
```
### Installing MaTools
```
conda create --name MaTools python=3.10 -y
conda activate MaTools
git clone https://github.com/Inc44/MaTools.git
cd MaTools
pip install -r requirements.txt
```
### Installing raqua
```
git clone https://github.com/Inc44/raqua.git
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