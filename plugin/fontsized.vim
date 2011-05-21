" set defaults
let g:fontsized_fullscreen = 0
let g:fontsized_one_vertical_window = 1


function! FontsizedReload()
    " load settings for current font size
    source ~/.vim/bundle/fontsized/size/current.vim

    " restart fullscreen to get maximal window height (needed when changing
    " from one to two vertical windows)
    set nofullscreen
    if g:fontsized_fullscreen
        set fuoptions=maxvert
        set fullscreen
    endif
endfunction


function! FontsizedTurnFullscreenOn()
    if !g:fontsized_fullscreen
        let g:fontsized_fullscreen = 1
        call FontsizedReload()
    endif
endfunction


function! FontsizedTurnFullscreenOff()
    if g:fontsized_fullscreen
        let g:fontsized_fullscreen = 0
        call FontsizedReload()
    endif
endfunction


function! FontsizedUseOneVerticalWindow()
    if !g:fontsized_one_vertical_window
        let g:fontsized_one_vertical_window = 1
        call FontsizedReload()
    endif
endfunction


function! FontsizedUseTwoVerticalWindows()
    if g:fontsized_one_vertical_window
        let g:fontsized_one_vertical_window = 0
        call FontsizedReload()
    endif
endfunction


" activate
call FontsizedReload()
