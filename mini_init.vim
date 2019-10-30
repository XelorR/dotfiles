" dependensies: ripgrep, python, yapf (everything is optional)

" for programming
syntax enable
set foldmethod=indent
set number

" theme
set termguicolors
set background=dark
colorscheme desert

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
let maplocalleader = "\\"
let mapleader = "\<Space>"

" --- Leader ---------------------------------------

" b - buffer management
nnoremap <leader>b :ls<CR>:b<Space>
map <leader><tab> :b!#<Return>
map <leader>e :browse old!<CR>
map <leader>w :w<Return>

" f - code formatting - yapf required
nnoremap <leader>fb :%!python -m yapf --style "google"<CR>
vnoremap <leader>ff :'<,'>!python -m yapf --style "google"<CR>
vnoremap <leader>fp :'<,'>!python -m yapf<CR>

" m - macro
" run macro in visual selecthion
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

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
nmap <Leader>j :call GotoJump()<CR>

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

" python terminal
if executable("ipython3")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython3<CR><C-w><C-w>
  nnoremap <leader>x :cd %:h<CR>?#.\?%%<CR>"+yN''<C-w><C-w>a
  tnoremap <leader>x %paste -q
elseif executable("ipython")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython<CR><C-w><C-w>
  nnoremap <leader>x :cd %:h<CR>?#.\?%%<CR>"+yN''<C-w><C-w>a
  tnoremap <leader>x %paste -q
elseif executable("python3")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python3<CR><C-w><C-w>
  nnoremap <leader>x :cd %:h<CR>?#.\?%%<CR>"+yN''<C-w><C-w>a
else
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python<CR><C-w><C-w>
  nnoremap <leader>x :cd %:h<CR>?#.\?%%<CR>"+yN''<C-w><C-w>a
endif

" --- Alt ------------------------------------------

" buffers
" movements
imap <A-k> <C-[>:bprev!<Return>
imap <A-j> <C-[>:bnext!<Return>
map <A-k> :bprev!<Return>
map <A-j> :bnext!<Return>
tnoremap <A-k> <C-\><C-n>:bprev!<Return>
tnoremap <A-j> <C-\><C-n>:bnext!<Return>
" force close any buffer
nnoremap <A-w> :bdelete!<Return>
tnoremap <A-w> <C-\><C-n>:bdelete!<Return>
inoremap <A-w> <C-[>:bdelete!<Return>

" --- Control --------------------------------------

" buffers
" movements
imap <C-PageUp> <C-[>:bprev!<Return>
imap <C-PageDown> <C-[>:bnext!<Return>
map <C-PageUp> :bprev!<Return>
map <C-PageDown> :bnext!<Return>
tnoremap <C-PageUp> <C-\><C-n>:bprev!<Return>
tnoremap <C-PageDown> <C-\><C-n>:bnext!<Return>

" --- Mixed ----------------------------------------

" cd to current file
map <leader>cd :cd %:p:h<cr>

" yank and paste using system clipboard
noremap <leader>y "+y
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>p "+p

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
map <leader>qq :q!<CR>

" just type :w!! to save the file, even if you did not run Vim with sudo.
cmap w!! w !sudo tee % >/dev/null

