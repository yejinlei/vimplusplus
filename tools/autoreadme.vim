function! AutoReadme()
python << EOF
# coding=gbk
import vim, codecs, re, StringIO
try:
    p = re.compile(r'\.(.*)\.$')
    s = open(r'../_vimrc', 'r')
    d = open(r'../README.md', 'w+')
    d.truncate(0)
    d.seek(0)
    lines = s.readlines()
    for line in lines:
        m = p.search(line)
        if m is not None:
            d.write(m.group(1) + '\n')
    s.close()
    d.close()
except:
    print 'AutoReadme Error!'
EOF
endfunction
