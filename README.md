vim配置文件设计
------

## 侦测特性
> * 是否支持自动命令
> * 是否windows操作系统
> * 是否支持gui界面
> * 是否支持对话框打开文件
> * 是否支持命令行补全
> * 是否支持搜索扩展特性
> * 是否支持语法高亮
> * 是否支持多字节编码，比如中文
> * 是否支持python接口
> * 是否支持自动切换目录

## 基本配置
### 配置文件
> * map前缀,用于替换后续<Leader>
> * 快速编辑配置文件
> * 快速生效配置文件
> * 禁用 VI 兼容模式

### 界面设置
> * 禁止欢迎界面
> * 命令行高度
> * 默认配色方案
> * 改变配色方案
> * 解决菜单乱码
> * 解决consle输出乱码
> * 菜单栏，ctrl+<F11>显示/隐藏

### 窗口和标签
> * 指定窗口出现的位置
> * 指定窗口大小
> * 原始/全屏显示
> * 关闭其他窗口
> * 调整窗口
> * 调整标签

### 编码设置
> * 设置gvim内部编码
> * 设置当前文件编码
> * 设置支持打开的文件的编码
> * 设置新文件的<EOL>格式
> * 给出文件的<EOL>格式类型
> * 文本字体
> * 突出当前行

### 目录设置
> * 自动切换目录

### 文本设置
> * 文件类型侦测
> * 当文件在外部被修改，自动更新该文件
> * 显示行号
> * 启用智能对齐方式
> * 将Tab键转换为空格
> * 设置Tab键的宽度
> * 换行时自动缩进4个空格
> * 指定按一次backspace就删除shiftwidth宽度的空格
> * 设置退格键可用
> * 支持windows ctrl+c/v/x

### 搜索设置
> * 搜索模式里忽略大小写
> * 智能搜索
> * 高亮搜索
> * 实时搜索
> * 当前文件下搜索，光标下单词
> * 当前目录下搜索，光标下单词
> * 搜索对话框,输入目标单词

### 鼠标设置
> * 启用鼠标

### 状态栏
> * 启用状态栏信息

### 键盘调整
> * 插入模式下,jk取代<Esc>键
> * 插入模式下,ctrl+h/j/k/l取代方向键
> * 正常模式下,ctrl+j/k/m ctrl+j/k/m取代翻屏键

## Vundle插件区
> * $VIM目录下，执行git clone git@github.com:gmarik/Vundle.vim vimfiles/bundle/vundle
> * 状态栏插件

### 自定义工具
> * 自动生成README.md
> * 集成everything命令行工具es
> * 目录记录工具
