set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-latex/vim-latex'
Plugin 'reedes/vim-pencil'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'bronson/vim-trailing-whitespace'
call vundle#end()

filetype plugin indent on

set backspace=indent,eol,start
set nobackup
set history=50
set noruler
set showcmd
set incsearch
set autoindent
set number
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

if has('mouse')
  set mouse=a
endif

syntax on
set hlsearch

colorscheme delek
hi Normal ctermbg=NONE

augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END

" visual navigation of wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" wraps lines while keeping words intact
set linebreak
set nofoldenable

:set cursorline

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

" turn off folding
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""


""""""""""""""""""""
" vim-pencil stuff "
""""""""""""""""""""

" some general options
let g:pencil#textwidth = 79 " wrap at 79 characters
let g:pencil#conceallevel = 0 " don't conceal characters
let g:pencil#mode_indicators = {'hard': '✐h', 'soft': '✎s', 'off': '✎',}
let g:pencil#autoformat_indicator = {'auto': 'a+', 'noauto': 'a-',}

" enable and disable autoformatting with `\p` (default is off)
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
let g:airline_section_x = '%{PencilMode()}%{PencilAutoformat()}'
let g:airline_theme = 'luna'


"""""""""""""""""""
" file type stuff "
"""""""""""""""""""

" give Makefiles tabs instead of spaces
autocmd FileType make setlocal noexpandtab

" syntax highlighting for files with weird extensions
au BufNewFile,BufRead *.al set filetype=
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.pde set filetype=c
