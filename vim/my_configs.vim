syntax enable
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific pluginsV
set clipboard=unnamed
set background=dark
colorscheme solarized
set selection=inclusive
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_start_key='<C-d>'
let g:NERDTreeWinPos = "left"
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
map <F2> :set paste<CR>
map <F2><F2> :set nopaste<CR>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
