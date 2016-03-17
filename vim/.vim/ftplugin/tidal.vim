xnoremap <buffer> <localleader>s  <Plug>TidalRegionSend

nmap <buffer> <localleader>c  <Plug>TidalConfig
nmap <buffer> <localleader>ss <Plug>TidalParagraphSend
nmap <buffer> <localleader>l  <Plug>TidalLineSend
nmap <buffer> <localleader>hh :TidalHush<cr>

let b:tidal_config = {"socket_name": "default", "target_pane": ":"}

let i = 1
while i <= 9
  execute 'nnoremap <buffer> <localleader>h'.i.'  :TidalSilence '.i.'<cr>'
  execute 'nnoremap <buffer> <localleader>s'.i.' :TidalPlay '.i.'<cr>'
  let i += 1
endwhile
