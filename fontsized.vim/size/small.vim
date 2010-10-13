if g:fontsized_fullscreen && g:fontsized_one_vertical_window
    set guifont=Monaco:h18
else
    set guifont=Monaco:h14
endif

" restart fullscreen to get maximal window height (needed when changing
" from one to two vertical windows)
if g:fontsized_fullscreen
    set nofullscreen
    set fullscreen
endif
