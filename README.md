# My config files

## Structure

I have a folder for each "program" I use and configure heavily. Most of my
configuration preferences are common to all computers I use. However, there are
some exceptions, such as multi-monitor i3 configuration for my lab computer
(always two screens) and single-monitor for my laptop. For this reason, I try
to adhere to a convention which makes keeping track of things fairly simple:
for config files that vary depending on the computer I use, I append `$HOST` to
the file name in this repository.

## File mapping

| source                 | destination                  |
| ---------------------- | ---------------------------- |
| `git/.gitconfig`       | `~`                          |
| `i3/config`            | `~/.i3/`                     |
| `i3pystatus/config.py` | `~/.config/i3pystatus/`      |
| `i3status/config`      | `~/.config/i3status/`        |
| `fish/config.fish`     | `~/.config/fish/`            |
| `qtile/config.py`      | `~/.config/qtile/`           |
| `vim/.vimrc`           | `~`                          |
| `vim/mydarkblue.vim`   | `~/vim/colors/`              |
| `x/.xinitrc`           | `~`                          |
| `x/.xprofile`          | `~`                          |
| `x/.Xresources`        | `~`                          |
| `x/.xserverrc`         | `~`                          |
| `zsh/.zlogin`          | `~`                          |
| `zsh/.zshenv`          | `~`                          |
| `zsh/.zshrc`           | `~`                          |
