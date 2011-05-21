if g:fontsized_one_vertical_window
    if g:fontsized_fullscreen
        set guifont=Monaco:h18
    else
        set guifont=Monaco:h14
    endif
    set columns=83  " 4 character line number + 79 character line
    set lines=40
else
    set guifont=Monaco:h12
    set columns=167
    set lines=45
endif
