" dependensies: ripgrep, python, yapf (everything is optional)

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile *.txt set noexpandtab
au BufRead,BufNewFile *.ini set noexpandtab
au BufRead,BufNewFile *.cfg set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

" look and feel
set termguicolors
set background=dark
colorscheme desert
syntax enable
set foldmethod=indent
set number

" splits windows in more habitual manner
set splitright
set splitbelow

" if you have ripgrep, use it instead of default command
if executable('rg')
  set grepprg=rg\ --color=never
endif

" Ignore some paths while fuzzy-searching
set wildignore+=*/.git/*,*/tmp/*,*.swp

" Keep terminal session alive even if not displayed
augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END


" === Key bindings =================================

" defining leader key
let mapleader = "\<Space>"

" --- Leader ---------------------------------------

" b - buffer management
nnoremap <leader>b :ls<CR>:b<Space>
noremap <leader>e :browse old!<CR>
noremap <leader>w :w<Return>

" m - macro
" run macro in visual selecthion
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" quick run macro from q
nnoremap <leader>2 @q

" navigate by jump history
function! GotoJump()
  jumps
  let j = input("Select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
nnoremap <Leader>j :call GotoJump()<CR>

" t - terminal
if executable("powershell")
  nnoremap <leader>' :vsplit term://powershell<CR>a
  nnoremap <leader>- :split term://powershell<CR>a
  nnoremap <leader>tt :e term://powershell<CR>a
  nnoremap <A-t> :e term://powershell<CR>a
elseif executable("cmd")
  nnoremap <leader>' :vsplit term://cmd<CR>a
  nnoremap <leader>- :split term://cmd<CR>a
  nnoremap <leader>tt :e term://cmd<CR>a
  nnoremap <A-t> :e term://cmd<CR>a
elseif executable("fish")
  nnoremap <leader>' :vsplit term://fish<CR>a
  nnoremap <leader>- :split term://fish<CR>a
  nnoremap <leader>tt :e term://fish<CR>a
  nnoremap <A-t> :e term://fish<CR>a
elseif executable("zsh")
  nnoremap <leader>' :vsplit term://zsh<CR>a
  nnoremap <leader>- :split term://zsh<CR>a
  nnoremap <leader>tt :e term://zsh<CR>a
  nnoremap <A-t> :e term://zsh<CR>a
elseif executable("bash")
  nnoremap <leader>' :vsplit term://bash<CR>a
  nnoremap <leader>- :split term://bash<CR>a
  nnoremap <leader>tt :e term://bash<CR>a
  nnoremap <A-t> :e term://bash<CR>a
else
  nnoremap <leader>' :vsplit term://sh<CR>a
  nnoremap <leader>- :split term://sh<CR>a
  nnoremap <leader>tt :e term://sh<CR>a
  nnoremap <A-t> :e term://sh<CR>a
endif

" python hotkeys
if executable("ipython3")
" python terminal start
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython3<CR><C-w><C-w>
  nnoremap <leader>gg :e term://ipython3<CR>a
  nnoremap <A-g> :e term://ipython3<CR>a
" f - code formatting - yapf required
  nnoremap <leader>fb :%!python3 -m yapf --style "google"<CR>
  vnoremap <leader>ff :'<,'>!python3 -m yapf --style "google"<CR>
  vnoremap <leader>fp :'<,'>!python3 -m yapf<CR>
elseif executable("ipython")
" python terminal start
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython<CR><C-w><C-w>
  nnoremap <leader>gg :e term://ipython<CR>a
  nnoremap <A-g> :e term://ipython<CR>a
" f - code formatting - yapf required
  nnoremap <leader>fb :%!python -m yapf --style "google"<CR>
  vnoremap <leader>ff :'<,'>!python -m yapf --style "google"<CR>
  vnoremap <leader>fp :'<,'>!python -m yapf<CR>
elseif executable("python3")
" python terminal start
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python3<CR><C-w><C-w>
  nnoremap <leader>gg :e term://python3<CR>a
  nnoremap <A-g> :e term://python3<CR>a
" f - code formatting - yapf required
  nnoremap <leader>fb :%!python3 -m yapf --style "google"<CR>
  vnoremap <leader>ff :'<,'>!python3 -m yapf --style "google"<CR>
  vnoremap <leader>fp :'<,'>!python3 -m yapf<CR>
else
" python terminal start
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python<CR><C-w><C-w>
  nnoremap <leader>gg :e term://python<CR>a
  nnoremap <A-g> :e term://python<CR>a
" f - code formatting - yapf required
  nnoremap <leader>fb :%!python -m yapf --style "google"<CR>
  vnoremap <leader>ff :'<,'>!python -m yapf --style "google"<CR>
  vnoremap <leader>fp :'<,'>!python -m yapf<CR>
endif

" --- Alt ------------------------------------------

" buffers
" movements
inoremap <A-k> <C-[>:bprev!<Return>
inoremap <A-j> <C-[>:bnext!<Return>
noremap <A-k> :bprev!<Return>
noremap <A-j> :bnext!<Return>
tnoremap <A-k> <C-\><C-n>:bprev!<Return>
tnoremap <A-j> <C-\><C-n>:bnext!<Return>
" force close any buffer
nnoremap <A-w> :bdelete!<Return>
tnoremap <A-w> <C-\><C-n>:bdelete!<Return>
inoremap <A-w> <C-[>:bdelete!<Return>
" switch windows
nnoremap <A-n> <C-w><C-w>
tnoremap <A-n> <C-\><C-n><C-w><C-w>
inoremap <A-n> <C-[><C-w><C-w>
nnoremap <leader><tab> <C-w><C-w>
tnoremap <leader><tab> <C-\><C-n><C-w><C-w>
inoremap <leader><tab> <C-[><C-w><C-w>
" switch rows
noremap <A-Up> ddkP
noremap <A-Down> ddp
inoremap <A-Up> <C-[>ddkPa
inoremap <A-Down> <C-[>ddpa

" --- Control --------------------------------------

" buffers
" movements
inoremap <C-PageUp> <C-[>:bprev!<Return>
inoremap <C-PageDown> <C-[>:bnext!<Return>
noremap <C-PageUp> :bprev!<Return>
noremap <C-PageDown> :bnext!<Return>
tnoremap <C-PageUp> <C-\><C-n>:bprev!<Return>
tnoremap <C-PageDown> <C-\><C-n>:bnext!<Return>
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>

" --- Mixed ----------------------------------------

" cd to current file
noremap <leader>cd :cd %:p:h<cr>

" yank and paste using system clipboard
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" exit to normal mode from insert with 'jj' and 'esc'
inoremap jj <c-[>
tnoremap jj <c-\><c-n>
tnoremap <esc> <c-\><c-n>

" reset highlight on screen refresh
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>:colorscheme desert<CR>

" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" force exit
noremap <leader>qq :q!<CR>

" just type :w!! to save the file, even if you did not run Vim with sudo.
cmap w!! w !sudo tee % >/dev/null


" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html

" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
if maparg('<leader>*', 'n') == ''
  nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

