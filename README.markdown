fontsized
=========

Change OS X Terminal font size when external display is (dis)connected.

This is my personal toy. You've been warned.


Installation
------------

Fontsized runs on OS X 10.7 and requires 2.6 ≤ Python < 3.0.


### Download and enter directory

    git clone https://github.com/narfdotpl/fontsized.git
    cd fontsized

### Set correct path on line 13

    vim pl.narf.fontsized.plist
    git commit --all --message='set correct path'


### Symlink and start launchd job

    ln -s `pwd`/pl.narf.fontsized.plist ~/Library/LaunchAgents/
    launchctl load ~/Library/LaunchAgents/pl.narf.fontsized.plist


Meta
----

fontsized is written by [Maciej Konieczny][].  This software is released
into the [public domain][].

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
