"""
"  .vimsyntax.vim
""
" syntax.txt
" :so $VIMRUNTIME/syntax/hitest.vim
"""
" 0 - black	(#000000)
" 1 - red	(#b00000)
" 2 - green	(#00b000)
" 3 - yellow	(#f0f000)
" 4 - blue	(#0000d0)
" 5 - purple	(#a000a0)
" 6 - cyan	(#3ac0c9)
" 7 - white	(#ffffff)
""

" Clear current settings
hi clear
if exists("syntax_on")
  syntax reset
endif

" Background type
set background=dark

" Define types
"  type			term			cterm		ctermfg		ctermbg		gui			guifg			guibg
hi Normal									ctermfg=7	ctermbg=0				guifg=#ffffff	guibg=#000000
hi Comment									ctermfg=6							guifg=#3ac0c9
hi Constant									ctermfg=3							guifg=#f0f000
hi Cursor									ctermfg=7	ctermbg=4				guifg=#000020	guibg=#ffaf38
hi Error		term=bold		cterm=bold	ctermfg=7	ctermbg=1	gui=bold	guifg=#ffffff
hi Folded		term=standout				ctermfg=4	ctermbg=7	gui=bold	guifg=#0000d0	guibg=#ffffff
hi FoldColumn	term=standout	cterm=bold	ctermfg=4	ctermbg=7	gui=bold	guifg=#0000d0	guibg=#ffffff
hi Identifier								ctermfg=2							guifg=#00b000
hi ModeMsg						cterm=bold	ctermfg=3	ctermbg=0				guifg=#000000	guibg=#f0f000
hi NonText		term=bold		cterm=bold	ctermfg=1							guifg=#b00000
hi PreProc						cterm=bold	ctermfg=7				gui=bold	guifg=#ffffff
hi Question									ctermfg=4	ctermbg=1				guifg=#0000d0	guibg=#b00000
hi Special									ctermfg=2							guifg=#00ff00
hi SpecialKey					cterm=bold	ctermfg=1				gui=bold	guifg=#b00000
hi Statement								ctermfg=5							guifg=#a000a0
hi StatusLine	term=bold		cterm=bold	ctermfg=3	ctermbg=4				guifg=#f0f000	guibg=#0000d0
hi StatusLineNC 				cterm=bold	ctermfg=3	ctermbg=0				guifg=#f0f000	guibg=#000000
hi Title									ctermfg=1	ctermbg=7				guifg=#b00000	guibg=#ffffff
hi Todo										ctermfg=0	ctermbg=1				guifg=#000000	guibg=#b00000
hi Type			term=bold		cterm=bold	ctermfg=2				gui=bold	guifg=#00b000
hi Visual						cterm=bold	ctermfg=4	ctermbg=7				guifg=#0000d0	guibg=#ffffff
if version >= 700
  hi SpellCap								ctermfg=7	ctermbg=1				guifg=#ffffff
  hi SpellBad								ctermfg=7	ctermbg=1				guifg=#ffffff
  hi SpellRare								ctermfg=7	ctermbg=1				guifg=#ffffff
  hi SpellRare								ctermfg=7	ctermbg=1				guifg=#ffffff
endif

" Define groups
hi link	Search		Visual
hi link	IncSearch	Visual
