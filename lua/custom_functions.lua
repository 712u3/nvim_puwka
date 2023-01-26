vim.api.nvim_exec([[                                                                                                         
function! CloseAllBuffersButCurrentSoft()                                                                                    
  let curr = bufnr("%")                                                                                                      
  let last = bufnr("$")                                                                                                      
  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif                                                            
  if curr < last | silent! execute (curr+1).",".last."bd" | endif                                                            
endfunction  

function! CloseAllBuffersButCurrentHard()                                                                                    
  let curr = bufnr("%")                                                                                                      
  let last = bufnr("$")                                                                                                      
  if curr > 1    | silent! execute "1,".(curr-1)."bd!"     | endif                                                           
  if curr < last | silent! execute (curr+1).",".last."bd!" | endif                                                           
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nnoremap <silent> <buffer> <C-l> <cmd>vertical res +5<CR>
endfunction

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore %:p:h
    endif
endfunction                                                                                                       
]], false)
