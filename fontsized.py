#!/usr/bin/env python
# encoding: utf-8
"""
Run all the time and change font size in Terminal and MacVim when
external display is (dis)connected.

Change to big font when display is connected and to small font when
it's disconnected.

Changing font size in MacVim requires a Vim plugin that has to be
run manually.  Function updating font size is mapped to `<Leader>f`
by default.

To detect external display the script investigates `ioreg`'s output
every five seconds; it's not very smart but I don't know a better
solution (<http://superuser.com/questions/174346>).
"""

from os import remove, symlink
from os.path import dirname, exists, join, realpath
from subprocess import PIPE, Popen
from time import sleep


__author__ = 'Maciej Konieczny <hello@narf.pl>'

SMALL_FONT = 14
BIG_FONT = 18
DISPLAY = 'AppleDisplay'  # that's how my LG display is called in `ioreg`
VIM_SIZE_DIR = join(dirname(realpath(__file__)), 'fontsized.vim/size')


def change_font_size_in_macvim(should_be_big):
    """
    Symlink "big" or "small" plugin file as "current".

    Vim function reloading plugin settings has to be run manually.
    """

    source = join(VIM_SIZE_DIR, 'big.vim' if should_be_big else 'small.vim')
    target = join(VIM_SIZE_DIR, 'current.vim')
    if exists(target):
        remove(target)
    symlink(source, target)

    # Here I should put an AppleScript snippet that would iterate over
    # MacVim windows, run `<Esc><Leader>f` in each of them and in the
    # end go back to the space it was in the beginning and change focus
    # to the application I was using then...  But my AppleScript skills
    # are not that crazy.


def change_font_size_in_terminal(should_be_big):
    """
    Change font size for set of settings (e.g. "Basic" or "Grass") used by
    first terminal window.

    Change will affect all windows using this set of settings.
    """

    run_applescript('tell application "Terminal" to ' \
                    'set font size of first window to {0}' \
                    .format(BIG_FONT if should_be_big else SMALL_FONT))


def get_stdout(command):
    """
    Run shell command without printing anything and return its output.
    """

    process = Popen(command, shell=True, stdout=PIPE)
    process.wait()  # run
    return process.stdout.read().rstrip()


def has_open_window(application):
    if is_running(application):
        stdout = run_applescript('tell application "{0}" to count windows' \
                                 .format(application))
        return int(stdout) > 0
    else:
        return False


def is_external_display_connected():
    # if display is disconnected, `ioreg`'s output is an empty string
    return bool(get_stdout('ioreg -rc ' + DISPLAY))


def is_running(application):
    stdout = run_applescript('tell application "System Events" to ' \
                             'count (every process whose name is "{0}")' \
                             .format(application))
    return int(stdout) > 0


def run_applescript(code):
    return get_stdout("osascript -e '{0}'".format(code))


def _main():
    was_connected = 'who knows?'
    while True:
        # check if external display is connected
        is_connected = is_external_display_connected()
        if was_connected != is_connected:
            was_connected = is_connected
            changed_in_terminal = False

            # change font size in MacVim
            change_font_size_in_macvim(is_connected)

        # change font size in Terminal
        if not changed_in_terminal and has_open_window('Terminal'):
            change_font_size_in_terminal(is_connected)
            changed_in_terminal = True

        # do it all again after five seconds
        sleep(5)

if __name__ == '__main__':
    _main()
