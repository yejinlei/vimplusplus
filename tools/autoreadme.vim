function! AutoReadme()
python << EOF
# coding=gbk
import os, vim, codecs, re, StringIO
try:
    vimpath = vim.eval('$VIM')
    vimrcpath = os.path.join(vimpath, '_vimrc')
    readmepath = os.path.join(vimpath, 'README.md')
    p = re.compile(r'\"\.(.*)\.$')
    s = open(vimrcpath, 'r')
    d = open(readmepath, 'r+')
    d.truncate(0)
    d.seek(0)
    lines = s.readlines()
    for line in lines:
        m = p.search(line)
        if m is not None:
            d.write(m.group(1) + '\n')
    s.close()
    d.close()
except Exception, e:
    print Exception, e
EOF
endfunction
