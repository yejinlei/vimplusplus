function! ES(keyword, ...)
python << EOF
# coding=gbk
import os, vim, codecs
try:
    keyword = vim.eval('a:keyword')
    varnum = vim.eval('a:0')
    if int(varnum) >= 1:
        mydir = vim.eval('a:1')
    else:
        mydir = vim.eval('expand("%:p:h")') 
    toolspath = os.path.join(vim.eval('$VIM'), 'tools')
    es = os.path.join(toolspath, 'es.exe')
    tmppath = os.path.join(toolspath, 'tmp')
    res = os.popen(es + ' ' + keyword + ' ' + mydir)
    tmp = open(tmppath, 'w+')
    tmp.truncate(0)
    tmp.seek(0)
    tmp.writelines(res)
    tmp.close()
    vim.command('vsplit ' + tmppath)
except Exception, e:
    print Exception, e
EOF
endfunction
