if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set noruler
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"au FileType py set autoindent
"au Filetype py set smartindent

set number
set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin on

" C syntax highlighting for Arduino source files
au BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.pde set filetype=c

"give Makefiles tabs instead of spaces
autocmd FileType make setlocal noexpandtab

au BufNewFile,BufRead *.al set filetype=
au BufNewFile,BufRead *.launch set filetype=xml

set clipboard=unnamedplus

let g:rehash256=1
colorscheme mydarkblue
hi Normal ctermbg=NONE

" allows 'visual' navigation of wrapped lines
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" wraps lines while keeping words intact
set linebreak

set nofoldenable

"""""""""""""""""""
" vim-latex stuff "
"""""""""""""""""""
" general recommended settings
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" compiler and viewer settings
let g:Tex_CompileRule_pdf = 'pdflatex --synctex=-1 -src-specials -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_pdf = 'evince '

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
"let g:pencil#autoformat_blacklist = [
"        \ 'markdownCode',
"        \ 'markdownUrl',
"        \ 'markdownIdDeclaration',
"        \ 'markdownLinkDelimiter',
"        \ 'markdownHighlight[A-Za-z0-9]+',
"        \ 'mkdCode',
"        \ 'mkdIndentCode',
"        \ 'markdownFencedCodeBlock',
"        \ 'markdownInlineCode',
"        \ 'mmdTable[A-Za-z0-9]*',
"        \ 'txtCode',
"        \ 'texAbstract',
"        \ 'texBeginEndName',
"        \ 'texDelimiter',
"        \ 'texDocType',
"        \ 'texInputFile',
"        \ 'texMath',
"        \ 'texRefZone',
"        \ 'texSection$',
"        \ 'texStatement',
"        \ 'texTitle',
"        \ ]
"let g:pencil#autoformat_blacklist = [
"    \ 'texMath',
"    \ 'texDocZone',
"    \ ]

" enable and disable autoformatting with `\p` (default is off)
nnoremap <silent> <leader>p :ShiftPencil<cr>

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
    autocmd FileType tex call pencil#init({'wrap': 'hard', 'autoformat': 0})
    autocmd FileType rst,markdown call pencil#init({'wrap': 'hard'})
augroup END

set laststatus=2
if has('statusline')
    set statusline=%<%f " file name
    set statusline+=%= " right justify
    set statusline+=c%c\ %l/%L\ %P " current line / total lines
    set statusline+=\ %{PencilMode()}%{PencilAutoformat()}
endif

map <F10> :echo "hi<"
\ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

nmap <F9> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
