set PATH $PATH ~/bin ~/.local/bin

set -x VREP /home/kenny/usr/vrep/vrep
set -x EDITOR vim
set -x CHEATCOLORS true
set -x ICAROOT /home/kenny/usr/citrix

set -x PYENV_ROOT $HOME/.pyenv
set PATH $PYENV_ROOT/bin $PATH

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'

set __fish_git_prompt_color_branch yellow

if status --is-login
    set PATH $PATH /usr/bin /sbin

    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

if status --is-interactive
    source ~/miniconda3/etc/fish/conf.d/conda.fish
    #conda activate base
end

source (pyenv init - | psub)

set QT_QPA_PLATFORMTHEME gtk2
