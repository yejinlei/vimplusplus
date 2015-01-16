function! FileSearch()
python << EOF1
# coding=gbk
import os, vim, codecs
try:
    string = vim.eval('inputdialog("Search in File")')
    vim.command(r'lv /' + string + r'/ %')
    vim.command('lw')
except Exception, e:
    print Exception, e
EOF1
endfunction

function! ProSearch()
python << EOF2
# coding=gbk
import os, vim, codecs
try:
    string = vim.eval('inputdialog("Search in Pro")')
    vim.command(r'vim /'+ string + r'/j **/*.txt **/*.c **/*.cpp **/*.h **/*.py **/*.vim')
    vim.command('cw')
except Exception, e:
    print Exception, e
EOF2
endfunction
