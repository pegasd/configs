"""
"  .vimrc
""
" indent.txt
" usr_05.txt, usr_41.txt, usr_28.txt
" vim(1)
""""

" General
set nocp					" turn off vi compatibility and behave leet ((-
set nobk					" turn off back ups
set nowb					" turn off back ups
set clipboard=unnamed		" copy to system clipboard
filet on					" turn on filetype recognition
filet indent on				" filetype-based indentation

" Browsing
set bs=indent,eol,start		" where to use backspace
set ek						" allow arrow keys in insert mode
set is						" do incremental searching
set hi=500					" history levels
set mat=7					" tenths of a second to show matching brackets
set mps=(:),[:],{:},<:>		" matching characters
set noeb					" no beeping
set nonu					" don't print line numbers
set novb					" don't flash the screen
set report=0				" don't display file change reports
set sm						" show matching brackets
set scs						" smart case search options
set tf						" refresh the screen more often
set ul=500					" undo levels
set wc=<Tab>				" expansion key

" Character encoding
set enc=utf-8				" vim
set fenc=utf-8				" new file
set fencs=utf-8,cp1251,koi8-r,latin1 " editing an existing file
set tenc=utf-8				" terminal

" Indentation
"set cin						" c indenting
"set cinw={,case,public,private,protected " extra indent after these keywords
"set cink=0{,0},0),:,!^F,o,O,*<CR> " keys that re-indent in the insert mode
"set cino=:s,l1,t0,+5,c0,C1,/2,(0,u1,U1,w1 " indenting options
set noet				" don't expand tabs to spaces
set tabstop=4			" tab is displayed as this many spaces
set shiftwidth=4		" spaces to use for each step of auto-indent
set smarttab			" indents according to shift width

" Status line
set ls=2			" always display status line
set sc				" display incomplete commands
set smd				" show current mode
set ru				" show the cursor position at all times
set stl=[%n]\ -=PegaS=-\ %F\ \ Type=%Y\ \ %r\ %1*%m%*%w%=%(Line:\ %l%)\ Column:\ %5(%c%V/%{strlen(getline(line('.')))}%)\ Byte:\ %O\h\ %4(%)%p%%

" .viminfo file
set vi='100,<500,:10000,@10000,/10000,s1024,f1,h,r/tmp,n~/.history/viminfo

set nospell			" turn spelling off
set sps=double		" use 'fast', then 'best' method of suggesting
set spl=ru			" use Russian dictionary
set spl=en_us		" use English dictionary

" Syntax highlighting only if supported
if &t_Co > 2 || has("gui_running")
  let mysyntaxfile='~/.vim/syntax.vim'
  syn enable
  set nohls
endif

" Functions
fu! CheckFileEncoding()
  if &modified && &fileencoding != ''
    exec 'e! ++enc=' . &fileencoding
  endif
endf

" Key mappings
map <silent> ,on :set nu!<CR>
map ,op		:set paste!<CR>

map <silent> ,os :set spell!<CR>
map ,le		:set spl=en_us<CR>
map ,lr		:set spl=ru<CR>

" Hello / Goodbye
au VimEnter * echo "Welcome back, PegaS!"
au VimLeave * echo "Later! (-"

" text
au FileType text set fdm=manual spell
au BufWinEnter *.txt call CheckFileEncoding()

" bash/sh
au BufRead,BufNewFile *.sh setfiletype sh
au BufRead,BufNewFile *.bash setfiletype sh
au FileType sh set ts=2 sw=2 sts=2 et
au FileType sh syn on

" python
au BufRead,BufNewFile *.py setfiletype python
au FileType python set ts=4 sw=4 sts=4 et
au FileType python syn on
