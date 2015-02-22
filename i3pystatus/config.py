#!/usr/bin/env python

import subprocess
from subprocess import CalledProcessError

from i3pystatus import IntervalModule

class KeyboardLayout(IntervalModule):
    """
    Shows the current keyboard layout and allows the layout to be changed by
    scrolling. It requires setxkbmap.

    Formatters:
        {layout} : the base layout name (usually two-letter code like `us`)
        {variant} : variant of the layout (e.g. `qwertz` vs. `qwerty`)
    """

    interval = 1

    settings = (
        ("format", "Format string used for output."),
        ("layouts", "List of (layout, variant) tuples."),
        ("color", "Standard color."),
    )

    format = "kbd: {layout} [{variant}]"
    layouts = [("us", ""), ("de", "qwerty")]
    color = "#FFFFFF"
    fdict = {}

    on_leftclick = "next_layout"

    def run(self):
        self.fdict['layout'] = self.layouts[0][0] 
        self.fdict['variant'] = self.layouts[0][1]

        full_text = self.format.format(**self.fdict)
        self.output = {
            "full_text": full_text,
            "color": self.color,
        }

    def set_layout(self, layouts):
        """
        Uses setxkbmap to set a list of layouts (first in the list is the one
        used).
        """
        llist = ",".join([l[0] for l in layouts])
        vlist = ",".join([l[1] for l in layouts])
        command = ["setxkbmap", "-layout", llist, "-variant", vlist]
        try:
            subprocess.check_call(command)
        except CalledProcessError as e:
            # invalid layout string
            pass
        except OSError as e:
            # setxkbmap not installed
            pass 

    def get_layout(self):
        xset_output = subprocess.check_call(['xset', '-q'])

    def next_layout(self):
        self.layouts = self.layouts[1:] + self.layouts[:1]
        self.set_layout(self.layouts)


"""
My configuration
"""

from i3pystatus import Status

blue = "#2b4e64"
red = "#962521"
purple = "#4e3d41"

status = Status(standalone=True)

status.register("clock", format="%b %d %H:%M", color=blue)
status.register(
    "disk",
    format="disk: {avail}/{total}",
    path='/',
    critical_limit=10,
    color=red
)
status.register(
    KeyboardLayout(
        layouts = [
            ("us", ""),
            ("de", "qwerty"),
            ("es", "")
        ]
    )
)
status.register(
    "battery",
    format="batt: {status} {remaining}",
    battery_ident="C23A",
    status={'DIS': '↓', 'CHR': '↑', 'FULL': 'full'},
    full_color=None,
    charging_color=None,
    critical_color=red
)
status.register(
    "cmus",
    format="cmus: {artist} {status} {title}",
    color=None)

status.run()
