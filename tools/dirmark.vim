function! MarkList()
python << EOF
# coding=gbk
import os, vim, codecs
try:
    dirmarkpath = os.path.join(vim.eval('$VIM'), r'tools\dirmark')
    vim.command('vsplit ' + dirmarkpath)
except Exception, e:
    print Exception, e
EOF
endfunction

function! DirGoto()
python << EOF2
# coding=gbk
import os, vim, codecs
try:
    dstdir = vim.eval('input("goto:")')
    print dstdir
    vim.command('e ' + dstdir)
except Exception, e:
    print Exception, e
EOF2
endfunction

function! MarkSave(...)
python << EOF3
# coding=gbk
import os, vim, codecs
try:
    alias = vim.eval('input("save:")')
    if alias == '':
        print 'error'
        raise Exception

    dirmarkpath = os.path.join(vim.eval('$VIM'), r'tools\dirmark')
    with open(dirmarkpath, 'a') as f:
        f.write(vim.eval('expand("%:p:h")') + ' ' + alias + ' \n')
except Exception, e:
    print Exception, e
EOF3
endfunction

function! MarkDel()
python << EOF3
# coding=gbk
import os, vim, codecs
try:
    d = os.path.join(vim.eval('$VIM'), r'tools\dirmark')
    id = vim.eval('input("Del:")')
    with open(dirmarkpath, 'r+') as f:
        lines = f.readlines()
        f.truncate(0)
        f.seek(0)
        if id == r'*':
            pass
        else:
            for line in lines:
                alias = line.split(' ')[1]
                if alias != id:
                    f.write(line)
except Exception, e:
    print Exception, e
EOF3
endfunctio

function! DirCur()
    let cwd = getcwd()
    return cwd
endfunction
