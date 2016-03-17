" nmap <buffer> <Leader>r :!love .<CR>
" nmap <buffer> <Leader>R :!./run.sh<CR>

nmap <buffer> <localleader>c :vnew \| 0read ! moonc -p #<CR>:set nomod ft=tempbuf.lua<CR>
nmap <buffer> <localleader>C :!moonc %<CR>
