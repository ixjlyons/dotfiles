HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# don't beep
unsetopt beep
# vim keybindings
bindkey -v
# automatically rehash to find newly installed bins
setopt nohashdirs
# auto-correct
#setopt correctall

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%Bno matches for: %d%b'

autoload -U compinit colors
compinit
colors

alias ls='ls --color=auto'
alias ll='ls -lAh'

PROMPT="┌%{$fg_bold[blue]%}%n%{$fg[cyan]%} ∈ %{$fg_bold[green]%}%m%{$reset_color%} [%~]
└─▶%{$reset_color%} "
