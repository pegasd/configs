"""
"  .vimrc
"""

" General
set nobk
set wb
set clipboard=unnamed
set bs=indent,eol,start
set ek
set is
set hi=500
set mat=7
set mps=(:),[:],{:},<:>
set noeb
set nonu
set novb
set report=0
set sm
set scs
set tf
set ul=500
set wc=<Tab>
set list lcs=tab:→\·,trail:·,nbsp:¬
set vi='100,<500,:10000,@10000,/10000,s1024,f1,h,r/tmp,n~/.history/viminfo

" Encoding
set enc=utf-8
set fenc=utf-8
set tenc=utf-8
set fencs=utf-8,cp1251,koi8-r,latin1

" Indentation
set et
set ts=4
set sw=4
set sts=4
set sta
set lbr

" Status line
set ls=2
set sc
set smd
set ru
set stl=[%n]\ -=PegaS=-\ %F\ \ Format=%{&ff}\ Type=%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)\ Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ Byte:\ %O\h\ %4(%)%p%%

" Spelling
set nospell
set sps=double
set spl=ru
set spl=en_us

" Syntax highlighting
let mysyntaxfile='~/.vim/syntax.vim'
syn enable
set nohls

" RU <-> Dvorak
set langmap=й',у.,кp,еy,нf,гg,шc,щr,зl,х/,ъ=,фa,ыo,вe,аu,пi,рd,оh,лt,дn,э-,чq,сj,мk,иx,тb,ьm,бw,юv,ё`,Я:,ГG

" Key mappings
map ,le             :set spl=en_us<CR>
map ,lr             :set spl=ru<CR>
map <silent> ,os    :set spell!<CR>
map <silent> ,on    :set nu!<CR>
map <silent> ,or    :set rnu!<CR>
map <silent> ,op    :set paste!<CR>

" Hello / Goodbye
au VimEnter * echo "Welcome back, PegaS!"
au VimLeave * echo "Peace! \/"

" txt
au FileType text set fdm=manual spell
" sh || bash
au BufRead,BufNewFile *.sh,*.bash setfiletype sh
au FileType sh set ts=2 sw=2 sts=2 et
au FileType sh syn on
" zsh
au BufRead,BufNewFile *.zsh,~/.zsh/* setfiletype zsh
au FileType zsh set ts=2 sw=2 sts=2 et
" python
au BufRead,BufNewFile *.py setfiletype python
au FileType python set ts=4 sw=4 sts=4 et
au FileType python syn on
" ruby || eruby || puppet
au BufNewFile,BufRead *.pp setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType eruby setl sw=2 sts=2 et
" markdown
au BufRead,BufNewFile *.md setfiletype markdown
