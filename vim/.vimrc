"""""""""""""""""
" vundle config "
"""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'reedes/vim-pencil'
Plugin 'chriskempson/base16-vim'
call vundle#end()

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""""""""""""""""""
" general config "
""""""""""""""""""

" better backspacing
set backspace=indent,eol,start
" don't make backup files
set nobackup
" show selection size in visual mode
set showcmd
" show matches as a search string is typed
set incsearch
" ignore case in searches...
set ignorecase
" ...unless you search using uppercase letters
set smartcase
" copy indent form current line with <CR> or o or O
set autoindent
" show line numbers
set number
" always insert 4 spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab
" highlight line of the cursor
set cursorline
" use gui colors specified in the theme (requires +termguicolors)
set termguicolors
" use the mouse
set mouse=a
" keep search matches highlighted
set hlsearch
" wraps lines while keeping words intact
set linebreak

" space bar is a great map leader
let mapleader = "\<space>"

" enale filetype-dependent indenting
filetype plugin indent on

" enable syntax highlighting
syntax on

" nice colorscheme
colorscheme base16-tomorrow-night

" visual navigation of wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" flying buffer changes
nnoremap <leader>b :ls<CR>:b<space>

" mapping to build
nnoremap <leader>m :!make<CR>


""""""""""""""""
" netrw config "
""""""""""""""""

" tree view by default
let g:netrw_liststyle = 3
" percentage of split for netrw (great with :Lexplore)
let g:netrw_winsize = 25
" toggle left explorer
nnoremap <leader>e :Lexplore<cr>
" no banner at the top
let g:netrw_banner = 0


"""""""""""""""""""
" file type stuff "
"""""""""""""""""""

" give Makefiles tabs instead of spaces
autocmd FileType make setlocal noexpandtab
" break text files at 80
autocmd FileType text setlocal textwidth=80

" syntax highlighting for files with weird extensions
au BufNewFile,BufRead *.al set filetype=
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.pde set filetype=c
au BufNewFile,BufRead *.urdf set filetype=xml
au BufNewFile,BufRead *.sdf set filetype=xml
au BufNewFile,BufRead *.c.src set filetype=c

" jump to last known position in the file
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


"""""""""""""""""""""""""""
" fix trailing whitespace "
"""""""""""""""""""""""""""

" highlight trailing whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead,BufNew * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\\\@<!\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)


""""""""""""""""""""
" vim-pencil stuff "
""""""""""""""""""""

" wrap at 79 characters
let g:pencil#textwidth = 79
" don't conceal characters
let g:pencil#conceallevel = 0
" indicate pencil mode
let g:pencil#mode_indicators = {'hard': 'hpencil', 'soft': 'spencil', 'off': 'nopencil',}
" indicate if pencil autoformat is on (used by PencilAutoformat)
let g:pencil#autoformat_indicator = {'auto': '[a]', 'noauto': '',}

" toggle autoformat with <leader>p (default is off)
nnoremap <silent> <leader>p :PFormatToggle<cr>

" function to return a string indicating whether or not autoformat is enabled
fun! PencilAutoformat()
    if exists('b:last_autoformat')
        if b:last_autoformat
            return get(g:pencil#autoformat_indicator, 'auto', 'auto')
        else
            return get(g:pencil#autoformat_indicator, 'noauto', 'noauto')
        en
    else
        return ''
    en
endf

" when to use vim-pencil
augroup pencil
    autocmd!
    autocmd FileType tex,rst,markdown,mkd call
                \ pencil#init({'wrap': 'hard', 'autoformat': 0})
augroup END


""""""""""""""""""""""
" custom status line "
""""""""""""""""""""""

set laststatus=2
if has('statusline')
    " file name + modified flag
    set statusline=%<%f%m
    " right justify
    set statusline+=%=
    " current column, current line, total lines
    set statusline+=\|%c\ -%l/%L
    " vim-pencil mode
    set statusline+=\ %{PencilMode()}%{PencilAutoformat()}
endif
