" set defaults
let g:fontsized_fullscreen = 0
let g:fontsized_one_vertical_window = 1


function! FontsizedReload()
    source ~/.vim/bundle/fontsized/size/current.vim
endfunction


function! FontsizedTurnFullscreenOn()
    if !g:fontsized_fullscreen
        let g:fontsized_fullscreen = 1
        call FontsizedReload()
        set fuoptions=maxvert
        set fullscreen
    endif
endfunction


function! FontsizedTurnFullscreenOff()
    if g:fontsized_fullscreen
        let g:fontsized_fullscreen = 0
        call FontsizedReload()
        set nofullscreen
    endif
endfunction


function! FontsizedUseOneVerticalWindow()
    if !g:fontsized_one_vertical_window
        set columns=83  " 79 character line + 4 character line number
        let g:fontsized_one_vertical_window = 1
        call FontsizedReload()
    endif
endfunction


function! FontsizedUseTwoVerticalWindows()
    if g:fontsized_one_vertical_window
        set columns=167
        let g:fontsized_one_vertical_window = 0
        call FontsizedReload()
    endif
endfunction


" activate
call FontsizedReload()

" map reload
map <leader>f :call FontsizedReload()<Enter>
