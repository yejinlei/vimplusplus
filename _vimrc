".vim配置文件设计.
".------.

"..
".## 侦测特性.
".> * 是否支持自动命令.
if has("autocmd")
        let g:hasautocmd=1
else
        let g:hasautocmd=0
endif

".> * 是否windows操作系统.
if has("win32") || has("win64")
    let g:haswin=1
else
    let g:haswin=0
endif

".> * 是否支持gui界面.
if has("gui_running")
    let g:hasgui=1
else
    let g:hasgui=0
endif

".> * 是否支持对话框打开文件.
if g:hasgui && g:haswin
    let g:hasbro=1
else
    let g:hasbro=0
endif

".> * 是否支持命令行补全.
if has("cmdline_compl")
    let g:hascmdline_compl=1
else
    let g:hascmdline_compl=0
endif

".> * 是否支持搜索扩展特性.
if has("extra_search")
    let g:hasextra_search=1
else
    let g:hasextra_search=0
endif

".> * 是否支持语法高亮.
if has("syntax")
    let g:hassyntax=1
else
    let g:hassyntax=0
endif

".> * 是否支持多字节编码，比如中文.
if has("multi_byte")
    let g:hasmulti_byte=1
else
    let g:hasmulti_byte=0
endif


"..
".## 基本配置.
".### 配置文件.
".> * map前缀,用于替换后续<Leader>.
let mapleader = "-"

".> * 快速编辑配置文件.
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<cr>
".> * 快速生效配置文件.
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr>
".> * 禁用 VI 兼容模式.
set nocompatible

"..
".### 界面设置.
".> * 禁止欢迎界面.
set shortmess=atI
".> * 命令行高度.
set ch=2
".> * 默认配色方案.
colorscheme evening
let g:colorschemeno = 0
function! ChangeColorscheme()
    let g:colorschemeno = !g:colorschemeno
    if g:colorschemeno == 1
       colorscheme zellner
    else
       colorscheme evening
    endif
endfunction
".> * 改变配色方案.
nnoremap <silent> <F10> :call ChangeColorscheme()<cr>
if g:haswin && g:hasgui
    ".> * 解决菜单乱码.
    source $VIMRUNTIME\delmenu.vim
    source $VIMRUNTIME\menu.vim
    ".> * 解决consle输出乱码.
    language messages zh_CN.chinese
endif
if g:hasgui
    ".> * 菜单栏，ctrl+<F11>显示/隐藏.
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

"..
".### 窗口和标签.
".> * 指定窗口出现的位置.
winpos 150 100
".> * 指定窗口大小.
set lines=38 columns=120
let g:hasmaxwin=0
function! ChangeWin()
   if  g:hasmaxwin == 0
      set updatetime=100
      au CursorHold * simalt ~x
      set updatetime=4000
   else
      au! CursorHold *
      winpos 150 100 
      set lines=38 columns=120
   endif
   let g:hasmaxwin = !g:hasmaxwin
endfunction
".> * 原始/全屏显示.
nnoremap <silent> <c-F12> :call ChangeWin()<cr>
".> * 关闭其他窗口.
nnoremap <F5> :only<cr>
".> * 调整窗口.
nnoremap <c-Down>  :resize +3<CR>
nnoremap <c-Up>    :resize -3<CR>
nnoremap <c-Left>  :vertical resize -3<CR>
nnoremap <c-Right> :vertical resize +3<CR>
".> * 调整标签.
nnoremap <M-Down>  :tabnew%<cr>
nnoremap <M-Up>    :tabedit<cr>
nnoremap <M-Left>  :tabclose<cr>
nnoremap <M-Right> :tabmove

"..
".### 编码设置.
if g:hasmulti_byte
    ".> * 设置gvim内部编码.
    set encoding=chinese
    ".> * 设置当前文件编码.
    set fileencoding=utf-8
    ".> * 设置支持打开的文件的编码.
    set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1,chinese
endif
".> * 设置新文件的<EOL>格式.
set fileformat=dos
".> * 给出文件的<EOL>格式类型.
set fileformats=unix,dos,mac
if g:hasgui
    ".> * 文本字体.
    set guifont=Courier_New:h10
    ".> * 突出当前行.
    set cursorline
endif

"..
".### 文本设置.
".> * 禁用文件类型侦测.
filetype off
".> * 当文件在外部被修改，自动更新该文件.
set autoread
".> * 显示行号.
set number
".> * 启用智能对齐方式.
set smartindent
".> * 将Tab键转换为空格.
set expandtab
".> * 设置Tab键的宽度.
set tabstop=4
".> * 换行时自动缩进4个空格.
set shiftwidth=4
".> * 指定按一次backspace就删除shiftwidth宽度的空格.
set smarttab
".> * 设置退格键可用.
set backspace=2
if g:hassyntax
    syntax on
endif
if g:haswin
    ".> * 支持windows ctrl+c/v/x.
    source $VIMRUNTIME\mswin.vim
    behave mswin
endif

"..
".### 搜索设置.
".> * 搜索模式里忽略大小写.
set ignorecase
".> * 智能搜索.
set smartcase
if g:hasextra_search
    ".> * 高亮搜索.
    set hlsearch
    ".> * 实时搜索.
    set incsearch
    nnoremap hl :set hlsearch!<cr>
endif
".> * 当前文件下搜索，光标下单词.
nnoremap <F3> :lv /<c-r>=expand("<cword>")<cr>/ %<cr> :lw<cr>
".> * 当前目录下搜索，光标下单词.
nnoremap <F4> :vim /\<<c-r>=expand("<cword>")<cr>\>/j **/*.txt **/*.c **/*.cpp **/*.h **/*.py **/*.vim<cr> :cw<cr> 

"..
".### 鼠标设置.
".> * 启用鼠标.
set mouse=a

"..
".### 状态栏.
".> * 启用状态栏信息.
set laststatus=2

"..
".### 键盘调整.
".> * 插入模式下,jk取代<Esc>键.
inoremap jk <Esc>
".> * 插入模式下,ctrl+h/j/k/l取代方向键.
inoremap <c-k> <Up>
inoremap <c-j> <Down>
inoremap <c-h> <Left>
inoremap <c-l> <Right>
".> * 正常模式下,ctrl+j/k/m ctrl+j/k/m取代翻屏键.
nnoremap <c-j><c-j> zt
nnoremap <c-k><c-k> zb
nnoremap <c-m><c-m> zz


"..
".## Vundle插件区.
".> * $VIM目录下，执行git clone git@github.com:gmarik/Vundle.vim vimfiles/bundle/vundle.
".> * vundle加到运行时路径
if !g:haswin
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif
" vundle分为三类：
" 在Github vim-scripts 用户下的repos,只需要写出repos名称
" 在Github其他用户下的repos, 需要写出"用户名/repos名"
" 不在Github上的插件，需要写出git全路径

" Bundle命令：
" :BundleList          #已安装列表
" :BundleInstall(!)    #安装、升级
" :BundleSearch(!)     #搜索
" :BundleClean(!)      #删除
" 或者
" :Bundles             #GitHub上插件列表

" 必须,vundle本身
Bundle 'gmarik/vundle'
".> * 状态栏插件.
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

"..
".### 自定义工具.
if has('python')
    ".> * 自动生成README.md 
    source $VIM/tools/autoreadme.vim
    command! -complete=function -nargs=0 AutoReadme :call AutoReadme()
endif
