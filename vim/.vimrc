"""""""""""""""""
" vundle config "
"""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'ixjlyons/vim-colors-paramount'
Plug 'chriskempson/base16-vim'
" plugins I should check out more:
"Plug 'gotcha/vimpdb'
"Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
"Plug 'reedes/vim-pencil'
"Plug 'reedes/vim-colors-pencil'
call plug#end()


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
" use unnamed to allow yank/paste from system-wide selection
set clipboard=unnamed
" allow for multiple unwritten buffers
set hidden
" command-line completion
set wildmenu
set wildmode=longest:full,full
" ignore some file types in completion list
set wildignore+=*.pdf,*.aux,*.blg,*.log,*.bbl,*.synctex,*.lof,*.lot,*.toc
" set shell to bash for Vundle
" (https://github.com/VundleVim/Vundle.vim/issues/312)
set shell=/bin/bash
" treat hypens/dashes as part of a word
"set iskeyword+=-
" don't set folds when opening files
set nofoldenable
" don't wrap long lines by default, very annoying to look at
set nowrap
" hit % on `if` to jump to `else`
runtime macros/matchit.vim
" leave a small buffer of lines at the top/bottom to preserve context
set scrolloff=5

" some diff options
set diffopt=filler,internal,algorithm:histogram,indent-heuristic

" space bar is a great map leader
let mapleader = "\<space>"

" enable filetype-dependent indenting
filetype plugin indent on

" enable syntax highlighting
syntax on

" nice colorscheme
"colorscheme paramount
set background=dark
colorscheme base16-snazzy

" visual navigation of wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" flying buffer changes
"nnoremap <leader>b :ls<CR>:b<space>

" mapping to build
nnoremap <leader>m :make<CR>

" highlight word nearest cursor without jumping to next match
" thanks to Antony on #vim freenode
nnoremap <leader>* :let @/='\<<c-r><c-w>\>'\|set hls<cr>

" use silver surfer for search
let g:ackprg = 'ag --nogroup --nocolor --column'

" juggling with quickfix entries
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" load 'stub' tex files as regular latex
let g:tex_flavor = "latex"


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
" text width preferences
autocmd FileType txt,text,rst,rest setlocal textwidth=80
autocmd FileType python setlocal textwidth=88
autocmd FileType c setlocal textwidth=88
" highlight texwidth column
set colorcolumn=+1
" turn on spelling
autocmd FileType text,tex,md,markdown,rst setlocal spell
" don't add a comment char when adding a line below/above a comment line
autocmd FileType * setlocal formatoptions-=o
"autocmd FileType markdown setlocal wrap

"hi clear SpellBad
"hi SpellBad cterm=underline

" change bad capitalization to underline
"hi clear SpellCap
"hi SpellCap cterm=underline


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


"""""""""""
" linting "
"""""""""""

let g:ale_linters = {
    \ 'python': ['pycodestyle'],
    \ 'c': ['ccls'],
    \ }
let g:ale_python_pycodestyle_options = '--ignore=E501,E226'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0



"""""""""""""""""""""""""""
" fix trailing whitespace "
"""""""""""""""""""""""""""

" highlight trailing whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight default ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufRead,BufNew * match ExtraWhitespace /\\\@<![\u3000[:space:]]\+$/

function! FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\\\@<!\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)


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
endif


"""""""""""""
" fzf stuff "
"""""""""""""

try
    " fuzzy find files
    nnoremap <leader>f :Files<cr>
    " fuzzy ag search
    nnoremap <leader>g :Ag<cr>
    " open a split with current buffers, use number to switch
    nnoremap <leader>b :Buffers<cr>

    let g:fzf_layout = { 'down': '12' }
    let g:fzf_preview_window = ['up:40%', 'ctrl-/']
endtry


""""""""""""""""""""""""""""""""""""
" miscellaneous commmands/mappings "
""""""""""""""""""""""""""""""""""""

" hex read/write
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

" show the syntax group under the cursor
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfunction

function! Syn(lnum, col)
    let l:id = synID(a:lnum, a:col, 1)
    let l:idt = l:id->synIDtrans()
    echo "hi<" . l:id->synIDattr("name") . ">"
        \ "lo<" . l:idt->synIDattr("name") . ">"
        \ "fg:" . l:idt->synIDattr("fg#")
endfunction
nnoremap <F3> :call Syn(line('.'),col('.')) <CR>
