" set defaults
let g:fontsized_fullscreen = 0
let g:fontsized_one_vertical_window = 1


function! s:FontsizedReload()
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


function! s:FontsizedTurnFullscreenOn()
    if !g:fontsized_fullscreen
        let g:fontsized_fullscreen = 1
        call s:FontsizedReload()
    endif
endfunction


function! s:FontsizedTurnFullscreenOff()
    if g:fontsized_fullscreen
        let g:fontsized_fullscreen = 0
        call s:FontsizedReload()
    endif
endfunction


function! s:FontsizedUseOneVerticalWindow()
    if !g:fontsized_one_vertical_window
        let g:fontsized_one_vertical_window = 1
        call s:FontsizedReload()
    endif
endfunction


function! s:FontsizedUseTwoVerticalWindows()
    if g:fontsized_one_vertical_window
        let g:fontsized_one_vertical_window = 0
        call s:FontsizedReload()
    endif
endfunction


" activate
call s:FontsizedReload()


" expose commands
command! -nargs=0 FontsizedReload
         \ call s:FontsizedReload()

command! -nargs=0 FontsizedTurnFullscreenOn
         \ call s:FontsizedTurnFullscreenOn()

command! -nargs=0 FontsizedUseTwoVerticalWindows
         \ call s:FontsizedUseTwoVerticalWindows()

command! -nargs=0 FontsizedTurnFullscreenOff
         \ call s:FontsizedTurnFullscreenOff()

command! -nargs=0 FontsizedUseOneVerticalWindow
         \ call s:FontsizedUseOneVerticalWindow()
