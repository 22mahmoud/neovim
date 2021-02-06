" better navigation between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" better Yank behavior
nnoremap Y y$

" Disable arrow keys
imap <up>     <nop>
imap <down>   <nop>
imap <left>   <nop>
imap <right>  <nop>

" better indentation
xnoremap <  <gv
xnoremap >  >gv

" better command mode navigation
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
