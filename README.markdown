fontsized
=========

Change font size in Terminal and MacVim when external display is
(dis)connected.


Installation
------------

This is my personal toy (it makes few assumptions) and as such is
not ready to be used by the masses.  Nevertheless, you might be able
to take advantage of it, provided you make yourself familiar with
`fontsized.py`'s main docstring and `fontsized.vim`'s behaviour.

If you meet accustomed requirements (OS X 10.6, 2.6 <= Python < 3.0,
Git, Vim, etc.) follow these guidelines:


### Get code

    mkdir ~/tools
    cd !$
    git clone http://github.com/narfdotpl/fontsized.git


### Symlink Vim plugin

    cd ~/tools/fontsized
    ln -s `pwd`/fontsized.vim ~/.vim/bundle/fontsized

You use [pathogen][], right?

  [pathogen]: http://github.com/tpope/vim-pathogen


### Symlink and start launchd job

    cd ~/tools/fontsized
    vim pl.narf.fontsized.plist  # set correct path in line 13
    ln -s `pwd`/pl.narf.fontsized.plist ~/Library/LaunchAgents/
    launchctl load ~/Library/LaunchAgents/pl.narf.fontsized.plist


Meta
----

fontsized is written by [Maciej Konieczny][].  This software is released
into the [public domain][].

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
