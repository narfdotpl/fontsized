if g:fontsized_one_vertical_window
    if g:fontsized_fullscreen
        set guifont=Monaco:h18
    else
        set guifont=Monaco:h14
    endif
else
    set guifont=Monaco:h12
endif

" restart fullscreen to get maximal window height (needed when changing
" from one to two vertical windows)
if g:fontsized_fullscreen
    set nofullscreen
    set fullscreen
endif
