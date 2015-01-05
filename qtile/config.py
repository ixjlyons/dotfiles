from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget
import subprocess

mod = "mod1"
win = "mod4"
blue = '2b4e64'
red = '962521'
purple = '4e3d41'

keys = [
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),

    Key([mod], "Tab", lazy.nextlayout()),

    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),

    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "e", lazy.shutdown()),

    Key([win], "space", lazy.spawncmd()),
    Key([mod], "Return", lazy.spawn("urxvt-xcwd")),

    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset Master 1%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset Master 1%-")),
    Key([], "Print",
        lazy.spawn("scrot \'/home/kenny/tmp/screenshot_%Y-%m-%d_%T.png\'")),
]

groups = [Group(i) for i in '1234567890']

for i in groups:
    # mod + letter of group = switch to group
    keys.append(
        Key([mod], i.name[0], lazy.group[i.name].toscreen())
    )

    # mod + shift + letter of group = switch to & move focused window to group
    keys.append(
        Key([mod, "shift"], i.name[0], lazy.window.togroup(i.name))
    )

layouts = [
    layout.MonadTall(
        border_focus='#'+blue,
        border_normal='#'+'0a0a0a'),
    layout.Max(),
]

widget_defaults = dict(
    font='Armata',
    foreground='aaaaaa',
    fontsize=11,
    padding=3,
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    active='aaaaaa',
                    inactive='404040',
                    borderwidth=2,
                    highlight_method='border',
                    rounded=True,
                    this_current_screen_border=blue,
                    invert_mouse_wheel=True),

                widget.Sep(linewidth=2, foreground=purple),

                widget.Prompt(),
                widget.WindowName(),
                widget.CurrentLayout(foreground=blue),

                widget.Sep(linewidth=2, foreground=purple),
                widget.Systray(icon_size=16),

                widget.Sep(linewidth=2, foreground=purple),

                widget.TextBox("vol:"),
                widget.Volume(),
                widget.Sep(linewidth=1, foreground='404040'),
                widget.TextBox("bat:"),
                widget.Battery(
                    low_foreground='#'+red,
                    charge_char='↑',
                    discharge_char='↓',
                    battery_name='C23A',
                    energy_now_file='charge_now',
                    energy_full_file='charge_full',
                    power_now_file='current_now'),
                widget.Sep(linewidth=1, foreground='404040'),
                widget.TextBox("lgt:"),
                widget.Backlight(),
                widget.Sep(linewidth=1, foreground='404040'),
                widget.Clock(
                    foreground=red,
                    fontsize=15,
                    format='%b %d - %H:%M'),
            ],
            24, background='#101010'
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


floating_layout = layout.Floating(
    auto_float_types=[
        "notification",
        "toolbar",
        "splash",
        "dialog",
    ]
)

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
wmname = "qtile"
