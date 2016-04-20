" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible
"
"Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
"Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git@github.com:vim-scripts/taglist.vim.git'
Plugin 'git@github.com:aur-archive/vim-pydiction.git'
Plugin 'rstacruz/sparkup', {'rtp':'vim/'}
Plugin 'ascenator/L9', {'name':'newL9'}

"python
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Pydiction'
Plugin 'c.vim'

"javascript
Plugin 'JavaScript-syntax'
Plugin 'jQuery'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'
Plugin 'ZenCoding.vim'
Plugin 'css_color.vim'
Plugin 'hallettj/jslint.vim'
call vundle#end()


let python_highlight_all=1
set clipboard=unnamed

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set mouse=v

set nu
filetype on
set background=dark
colorscheme desert
"启用鼠标
set mouse=a
"搜索匹配高亮显示
set hls


"自动补全
filetype plugin indent on
set completeopt=longest,menu

"自动补全时候使用裁断式匹配列表
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete

"允许退格键和tab操作
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=2
"set textwidth=79
"输入命令自动显示出来
set showcmd
set history=1000
set noswapfile

set autoindent
set tabstop=4
"括号配对
set showmatch
set ruler
set laststatus=2

"根据文件类型决定缩进
filetype indent on
autocmd filetype make set noexpandtab
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'

"设置编码自动识别
set fileencodings=utf-8,gbk
set ambiwidth=double
set wildmenu wildmode=list:full

"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese,gbk

set wildignorecase
nmap sc <ESC> :cd %:p:h <CR>
"inoremap jj <ESC>
imap <C-c>  <ESC>






" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


set tags=/home/wayne/iot_mxchip/tags
set tags+=/home/wayne/.virtualenvs/mxchip/lib/python2.7/tags


set path=/etc/vim
set path+=.
set path+=/home/wayne/iot_mxchip/**


set wildignorecase
nmap sc <ESC> :cd %:p:h <CR>
"inoremap jj <ESC>
imap <C-c>  <ESC>

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: wayne") 
        call append(line(".")+2, "\# mail: @163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    elseif &filetype == 'python' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\#-*- coding:utf-8 -*-") 
        call append(line(".")+1, "\# File Name: ".expand("%")) 
        call append(line(".")+2, "\#########################################################################") 
        call append(line(".")+3, "\#!/bin/python") 
        call append(line(".")+4, "") 
    else 
        call setline(1, "\*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: wayne") 
        call append(line(".")+2, "    > Mail: @163.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


nmap gc <ESC>:cd %:p:h<CR>

command Mxchip :call Mxchip()

function! Mxchip()
	:cd /home/wayne/mxchip/iot_mxchip
endfunction

"括号自动补齐
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

""map <F5> :call CompileRunGcc()<CR>
command Compile :call CompileRunGcc()
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    if has("win32")
        echo "------"
        echo expand()
        exec "! \%<.exe"
    elseif has("linux") 
        echo "------"
        exec "! ./%<"
    else  
        echo "---***---"
        exec "! ./%<"
    endif
endfunc

