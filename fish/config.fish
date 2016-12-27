set PATH $PATH ~/bin

set -x VREP /home/kenny/usr/vrep/vrep
set -x EDITOR vim
set -x AURDEST /var/pacaur-build

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '★'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '←'

source (conda info --root)/etc/fish/conf.d/conda.fish
