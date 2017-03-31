# My config files

## Structure

I have a folder for each "program" I use and configure heavily. Most of my
configuration preferences are common to all computers I use. However, there are
some exceptions, such as multi-monitor i3 configuration for my lab computer
(always two screens) and single-monitor for my laptop. For this reason, I try
to adhere to a convention which makes keeping track of things fairly simple:
for config files that vary depending on the computer I use, I append `$HOST` to
the file name in this repository.


## Currently Running

There are some config files I have here that I'm not really using. Here are the
folders I currently am using and update:

* fish: shell
* xfce4-terminal: terminal emulator
* vim: editor
* i3: window manager
* i3status: panel (bar) info generator
* git: VCS
* rofi: program launcher (has many more features I'm not currently using)
* x: window system


## File mapping

| source (file)                 | destination (dir)            |
| ----------------------------- | ---------------------------- |
| `git/.gitconfig`              | `~`                          |
| `i3/config`                   | `~/.i3/`                     |
| `i3pystatus/config.py`        | `~/.config/i3pystatus/`      |
| `i3status/config`             | `~/.config/i3status/`        |
| `fish/config.fish`            | `~/.config/fish/`            |
| `fish/functions/*`            | `~/.config/fish/functions/*` |
| `qtile/config.py`             | `~/.config/qtile/`           |
| `rofi/config`                 | `~/.config/rofi/`            |
| `termite/config`              | `~/.config/termite/`         |
| `twmn/twmn.conf`              | `~/.config/twmn/`            |
| `vim/.vimrc`                  | `~`                          |
| `x/.xinitrc`                  | `~`                          |
| `x/.xprofile`                 | `~`                          |
| `x/.Xresources`               | `~`                          |
| `x/.xserverrc`                | `~`                          |
| `xfce4-terminal/terminalrc`   | `~/.config/xfce4/terminal`   |
| `zsh/.zlogin`                 | `~`                          |
| `zsh/.zshenv`                 | `~`                          |
| `zsh/.zshrc`                  | `~`                          |
