function! s:SwitchToSpecFile(current_file_path)
  let path = substitute(a:current_file_path, '/lib/', '/spec/', '')
  let alternate_file_path = substitute(path, '.rb$', '_spec.rb', '')
  execute 'edit ' . alternate_file_path
endfunction

function! s:SwitchToSourceFile(current_file_path)
  let path = substitute(a:current_file_path, '/spec/', '/lib/', '')
  let alternate_file_path = substitute(path, '_spec.rb$', '.rb', '')
  execute 'edit ' . alternate_file_path
endfunction

function! alternate#SwitchToFile()
  let current_file_path = expand('%:p')
  if strlen(matchstr(current_file_path, '_spec.rb$'))
    call <SID>SwitchToSourceFile(current_file_path)
  else
    call <SID>SwitchToSpecFile(current_file_path)
  endif
endfunction
