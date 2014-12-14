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
colorscheme evening                                     "配色方案
if g:haswin && g:hasgui
    source $VIMRUNTIME\delmenu.vim                      "解决菜单乱码
    source $VIMRUNTIME\menu.vim
    language messages zh_CN.chinese                     "解决consle输出乱码
endif
if g:hasgui
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
endi

" 编码设置
if g:hasmulti_byte
    set encoding=chinese                                    "设置gvim内部编码
    set fileencoding=utf-8                                  "设置当前文件编码
    set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1,chinese  "设置支持打开的文件的编码
endif
set fileformat=unix                                     "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                            "给出文件的<EOL>格式类型
if has("gui_running")                                   "gui_running图形界面
    set guifont=Courier_New:h10                         "文本字体
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

" 实时搜索及高亮
set ignorecase                                          "搜索模式里忽略大小写
set smartcase                                           "智能搜索
if g:hasextra_search
    set hlsearch                                        "高亮搜索
    set incsearch                                       "实时搜索
    nnoremap hl :set hlsearch!<cr>
endif

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
