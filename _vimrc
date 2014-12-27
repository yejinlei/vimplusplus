"-----------------------------------------------------------"
"                       侦测特性                            "
"-----------------------------------------------------------"
if has("autocmd")
    let g:hasautocmd=1                                   "支持自动命令
else
    let g:hasautocmd=0
endif

if has("win32") || has("win64")
    let g:haswin=1                                      "windows操作系统
else
    let g:haswin=0
endif

if has("gui_running")
    let g:hasgui=1                                      "支持gui界面
else
    let g:hasgui=0
endif

if g:hasgui && g:haswin
    let g:hasbro=1                                      "支持对话框打开文件
else
    let g:hasbro=0
endif

if has("cmdline_compl")
    let g:hascmdline_compl=1                            "支持命令行补全
else
    let g:hascmdline_compl=0
endif

if has("extra_search")
    let g:hasextra_search=1                             "支持搜索扩展特性
else
    let g:hasextra_search=0
endif

if has("syntax")
    let g:hassyntax=1                                   "支持语法高亮
else
    let g:hassyntax=0
endif

if has("multi_byte")                                    "支持多字节编码，比如中文
    let g:hasmulti_byte=1
else
    let g:hasmulti_byte=0
endif

"-----------------------------------------------------------"
"                       基本配置                            "
"-----------------------------------------------------------"
" 配置文件
let mapleader = "-"                                     "map前缀,用于替换后续<Leader>
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<cr>       "快速编辑配置文件
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr>       "快速生效配置文件
set nocompatible                                        "禁用 VI 兼容模式

" 界面设置
set shortmess=atI                                       "禁止欢迎界面
set ch=2                                                "命令行高度
colorscheme evening                                     "默认配色方案
let g:colorschemeno = 0
function! ChangeColorscheme()                           "配色方案函数
    let g:colorschemeno = !g:colorschemeno
    if g:colorschemeno == 1
       colorscheme zellner
    else
       colorscheme evening
    endif
endfunction
nnoremap <silent> <F10> :call ChangeColorscheme()<cr>
if g:haswin && g:hasgui
    source $VIMRUNTIME\delmenu.vim                      "解决菜单乱码
    source $VIMRUNTIME\menu.vim
    language messages zh_CN.chinese                     "解决consle输出乱码
endif
if g:hasgui
    set guioptions-=m                                   "菜单栏，ctrl+<F11>显示/隐藏
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

" 窗口和标签
winpos 150 100                                           "指定窗口出现的位置
set lines=38 columns=120                                 "指定窗口大小
let g:hasmaxwin=0
function! ChangeWin()
   if  g:hasmaxwin == 0
      set updatetime=100
      au CursorHold * simalt ~x                          "全屏显示
      set updatetime=4000
   else
      au! CursorHold *
      winpos 150 100 
      set lines=38 columns=120
   endif
   let g:hasmaxwin = !g:hasmaxwin
endfunction
nnoremap <silent> <c-F12> :call ChangeWin()<cr>
nnoremap <F5> :only<cr>                                 "关闭其他窗口
nnoremap <c-Down>  :resize +3<CR>                       "调整窗口大小
nnoremap <c-Up>    :resize -3<CR>
nnoremap <c-Left>  :vertical resize -3<CR>
nnoremap <c-Right> :vertical resize +3<CR>
nnoremap <M-Down>  :tabnew%<cr>                         "将当前内容在新标签中打开
nnoremap <M-Up>    :tabedit<cr>                         "打开空白新标签
nnoremap <M-Left>  :tabclose<cr>                        "关闭当前标签
nnoremap <M-Right> :tabmove                             "移动标签

" 编码设置
if g:hasmulti_byte
    set encoding=chinese                                "设置gvim内部编码
    set fileencoding=utf-8                              "设置当前文件编码
    set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1,chinese  "设置支持打开的文件的编码
endif
set fileformat=dos                                      "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                            "给出文件的<EOL>格式类型
if g:hasgui                                             "gui_running图形界面
    set guifont=Courier_New:h10                         "文本字体
    set cursorline                                      "突出当前行
    "hi cursorline guibg=#333333                        "反显光标当前行颜色
endif

" 文本设置
filetype off                                            "禁用文件类型侦测
set autoread                                            "当文件在外部被修改，自动更新该文件
set number                                              "显示行号
set smartindent                                         "启用智能对齐方式
set expandtab                                           "将Tab键转换为空格
set tabstop=4                                           "设置Tab键的宽度
set shiftwidth=4                                        "换行时自动缩进4个空格
set smarttab                                            "指定按一次backspace就删除shiftwidth宽度的空格
set backspace=2                                         "设置退格键可用
if g:hassyntax
    syntax on
endif
if g:haswin
    source $VIMRUNTIME\mswin.vim                        "支持windows ctrl+c/v/x
    behave mswin
endif

" 搜索设置
set ignorecase                                          "搜索模式里忽略大小写
set smartcase                                           "智能搜索
if g:hasextra_search
    set hlsearch                                        "高亮搜索
    set incsearch                                       "实时搜索
    nnoremap hl :set hlsearch!<cr>
endif
nnoremap <F3> :lv /<c-r>=expand("<cword>")<cr>/ %<cr> :lw<cr> "当前文件下搜索，光标下单词
nnoremap <F4> :vim /\<<c-r>=expand("<cword>")<cr>\>/j **/*.txt **/*.c **/*.cpp **/*.h **/*.py **/*.vim<cr> :cw<cr> "当前目录下搜索，光标下单词

" 鼠标设置
set mouse=a                                             "启用鼠标

" 状态栏
set laststatus=2                                        "启用状态栏信息

" 键盘调整
imap jk <Esc>                                           "插入模式下,jk取代<Esc>键，原键失效
imap <c-k> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
nnoremap <c-j><c-j> zt
nnoremap <c-k><c-k> zb
nnoremap <c-m><c-m> zz

"-----------------------------------------------------------"
"                       Vundle插件区                        "
"-----------------------------------------------------------"
" $VIM目录下，执行git clone git@github.com:gmarik/Vundle.vim vimfiles/bundle/vundle
if !g:haswin                                            "vundle加到运行时路径
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
" 状态栏插件
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'
