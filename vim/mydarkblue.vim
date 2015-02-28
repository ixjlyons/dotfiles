" Vim color file
" Based on the built-in colorscheme, darkblue

set bg=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "mydarkblue"

hi Normal ctermfg=gray ctermbg=black
hi ErrorMsg ctermfg=black ctermbg=lightblue
hi Visual ctermfg=green ctermbg=black cterm=reverse
hi VisualNOS ctermfg=green ctermbg=black cterm=reverse,underline
hi Todo ctermfg=red ctermbg=darkblue
hi Search ctermfg=black ctermbg=blue cterm=underline term=underline
hi IncSearch ctermfg=gray ctermbg=black

hi SpecialKey ctermfg=darkcyan
hi Directory ctermfg=cyan
hi Title ctermfg=magenta cterm=bold
hi WarningMsg ctermfg=red
hi WildMenu ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg ctermfg=lightblue
hi MoreMsg ctermfg=darkgreen ctermfg=darkgreen
hi Question ctermfg=green cterm=none
hi NonText ctermfg=darkblue

hi StatusLine ctermfg=blue ctermbg=black term=bold cterm=bold
hi StatusLineNC ctermfg=blue ctermbg=black term=none cterm=none
hi VertSplit ctermfg=black ctermbg=gray term=none cterm=none

hi Folded ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr ctermfg=green ctermbg=black

"""""""""""""""""
" diff elements "
"""""""""""""""""
hi DiffAdd ctermbg=darkblue term=none cterm=none
hi DiffChange ctermbg=magenta cterm=none
hi DiffDelete ctermfg=blue ctermbg=cyan
hi DiffText cterm=bold ctermbg=green

hi Cursor ctermfg=black ctermbg=yellow
hi lCursor ctermfg=black ctermbg=white

"""""""""""""""""""
" syntax elements "
"""""""""""""""""""
hi Comment ctermfg=green ctermbg=black
hi Constant ctermfg=yellow cterm=none
hi Special ctermfg=red cterm=none
hi Identifier ctermfg=white cterm=bold
hi Statement ctermfg=blue cterm=bold
hi PreProc ctermfg=green cterm=bold
hi Type ctermfg=gray cterm=none
hi Underlined cterm=underline term=underline
hi Ignore ctermfg=bg

""""""""""""""""""
" spell checking "
""""""""""""""""""
hi SpellBad ctermfg=black ctermbg=red cterm=underline
hi SpellCap ctermfg=black ctermbg=yellow cterm=underline
hi SpellRare ctermfg=blue ctermbg=black cterm=underline
hi SpellLocal ctermfg=green ctermbg=black cterm=underline

""""""""""
" python "
""""""""""
"hi pythonStatement ctermfg=
"hi pythonConditional ctermfg=
"hi pythonRepeat ctermfg=
"hi python Operator ctermfg=
"hi pythonException ctermfg=
"hi pythonExceptions ctermfg=
"hi pythonInclude ctermfg=
"hi pythonTodo ctermfg=
"hi pythonFunction ctermfg=
"hi pythonDecorator ctermfg=
"hi pythonEscape ctermfg=
hi pythonBuiltin ctermfg=blue
hi pythonNumber ctermfg=yellow
hi pythonString ctermfg=red
