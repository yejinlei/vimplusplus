"-----------------------------------------------------------"
"                       基本配置                            "
"-----------------------------------------------------------"
"  配置文件
let mapleader = "-"					                    "map前缀,用于替换后续<Leader>
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<cr>	    "快速编辑配置文件
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr>	    "快速生效配置文件

set shortmess=atI 					                    "禁止欢迎界面
set nocompatible                                      	"禁用 Vi 兼容模式
filetype off                                          	"禁用文件类型侦测
colorscheme evening               			            "配色方案

" 编码设置
set encoding=utf-8                                    	"设置gvim内部编码
set fileencoding=utf-8                                	"设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     	"设置支持打开的文件的编码
set fileformat=unix                                   	"设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          	"给出文件的<EOL>格式类型
if has("gui_running")
    set guifont=Courier_New:h10                         "文本字体
endif

" 键盘设置
set number                                            	"显示行号
set smartindent                                       	"启用智能对齐方式
set expandtab                                         	"将Tab键转换为空格
set tabstop=4                                         	"设置Tab键的宽度
set shiftwidth=4                                      	"换行时自动缩进4个空格
set smarttab                                          	"指定按一次backspace就删除shiftwidth宽度的空格
set backspace=2                                         "设置退格键可用

" 鼠标设置
set mouse=a                                             "启用鼠标

" 状态栏
set laststatus=2                                      	"启用状态栏信息
