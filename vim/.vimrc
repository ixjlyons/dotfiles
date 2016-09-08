"""""""""""""""""
" vundle config "
"""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'reedes/vim-pencil'
Plugin 'chriskempson/base16-vim'
Plugin 'bronson/vim-trailing-whitespace'
call vundle#end()


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
" ignore case in searches
set ignorecase
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


"""""""""""""""""""
" vim-latex stuff "
"""""""""""""""""""

" general recommended settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" compiler and viewer settings
let g:Tex_CompileRule_pdf = 'pdflatex --shell-escape --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf = 'xdg-open 2> /dev/null'
let g:Tex_UseMakefile = 0
let g:Tex_BIBINPUTS = '/home/kenny/texmf/bibtex/bib'


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
