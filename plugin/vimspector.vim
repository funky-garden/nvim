nnoremap <leader>dd : call vimspector#Launch()<CR>
nnoremap <leader>dx :VimspectorReset <CR>


nnoremap <leader>dl :call vimspector#StepOver()<CR>
nnoremap <leader>dj :call vimspector#StepIn()<CR>
nnoremap <leader>dk :call vimspector#StepOut()<CR>
nnoremap <leader>db :call vimspector#ToggleBreakpoint()<CR>
