import subprocess


def open_editor(filename):
    # I created a .minimal-tex-vimrc, a vim config file that only includes stuff
    # relevant to LaTeX. This way, the popup opens instantly.  Some of the
    # noteworthy commands include:
    #
    #     set ft=tex
    #     " Quickly closing the window by jamming wq
    #     inoremap wq <Esc>:wq<CR>
    #     nnoremap wq :wq<CR>
    #     inoremap qw <Esc>:wq<CR>
    #     nnoremap qw :wq<CR>
    #
    #     " Start insert mode between $$'s
    #     autocmd BufEnter * startinsert | call cursor(1, 2)
    #
    #     nnoremap j gj
    #     nnoremap k gk
    #
    # I load this config using the -u flag.

    # I position the window by adding a name to the terminal window. As I'm using
    # bspwm, adding the following:
    #
    #     #! /bin/bash
    #
    #     wid=$1
    #     class=$2
    #     instance=$3
    #
    #
    #     if [ "$instance" = "popup-bottom-center" ]; then
    #         echo "state=floating"
    #         read W H <<< $(xdotool getdisplaygeometry)
    #         eval "$(xdotool getwindowgeometry --shell $wid )"
    #         xdotool windowmove $wid $(($W / 2 - $WIDTH / 2)) $(($H - $HEIGHT))
    #     fi
    #
    # to ~/.config/bspwm/external_rules makes all windows with the
    # popup-bottom-center name floating and centered at the bottom of my screen.

    subprocess.run([
        'urxvt',
        '+sb',
        '-fn', 'xft:Noto Sans Mono:size=20',
        '-geometry', '80x5',
        '-name', 'popup-bottom-center',
        '-e', "vim",
        f"{filename}",
    ])

config = {
    'open_editor': open_editor,
}