if g:fontsized_fullscreen && g:fontsized_one_vertical_window
    set guifont=Monaco:h18
else
    set guifont=Monaco:h14
endif

if g:fontsized_fullscreen
    set nofullscreen
    set fullscreen
else
    set lines=40
endif
