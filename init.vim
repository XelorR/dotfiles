" dependensies: vimplug, git, fzf, ripgrep, python, yapf

if has("win32") || has("win16")
  call plug#begin('C:/vimplugins')
else
  call plug#begin('~/.local/share/nvim/plugged')
endif
Plug 'vim-airline/vim-airline' " informative bar
Plug 'morhetz/gruvbox' " theme
Plug 'tomasr/molokai' " theme
Plug 'machakann/vim-highlightedyank' " highlit copied selection
Plug 'ervandew/supertab' " use tab for completions
Plug 'Konfekt/FastFold'
Plug 'easymotion/vim-easymotion' " cursor quick movements
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-commentary' " type gcc to comment
Plug 'tpope/vim-surround' " cs, ds, ys for surroundings
Plug 'tpope/vim-repeat' " use dot for surroundings
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file and mru searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " better fuzzy searcher
Plug 'nelstrom/vim-visual-star-search' " search all in v mode by pressing *
call plug#end()

" for programming
syntax enable
set foldmethod=indent
set number
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" theme
set termguicolors
set background=dark
colorscheme molokai
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" splits windows in more habitual manner
set splitright
set splitbelow

" Increment file search
" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'

" Using ripgrep for CtrlP
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
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
map <leader>bp :bprev!<Return>
map <leader>bn :bnext!<Return>
map <leader>bd :bdelete!<Return>
map <leader>bb :NERDTreeToggle<CR>
map <leader><tab> :b!#<Return>
map <leader>e :browse old!<CR>
map <leader>w :w<Return>

" f - code formatting
nnoremap <leader>fb :%!python -m yapf --style "google"<CR>
vnoremap <leader>ff :'<,'>!python -m yapf --style "google"<CR>
vnoremap <leader>fp :'<,'>!python -m yapf<CR>

" g - git
map <leader>gcc :Gcommit<CR>
map <leader>gca :Gcommit -a<CR>
map <leader>gs :Gstatus<CR>}2j
map <leader>go :Gpull<CR>
map <leader>gp :Gpush<CR>

" m - macro
" run macro in visual selecthion
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" n - navigation
noremap <leader>nn :CtrlPMixed<CR>
noremap <leader>nf :Files<CR>
noremap <leader>nr :Rg<CR>
noremap <leader>ne :bro ol!<CR>
noremap <leader>nm :CtrlPMRUFiles<CR>
noremap <leader>nl :Lines<CR>
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
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
  nnoremap <leader>- :vsplit term://cmd<CR>a
  nnoremap <leader>tt :e term://cmd<CR>a
  nnoremap <A-t> :e term://cmd<CR>a
elseif executable("fish")
  nnoremap <leader>' :vsplit term://fish<CR>a
  nnoremap <leader>- :vsplit term://fish<CR>a
  nnoremap <leader>tt :e term://fish<CR>a
  nnoremap <A-t> :e term://fish<CR>a
elseif executable("zsh")
  nnoremap <leader>' :vsplit term://zsh<CR>a
  nnoremap <leader>- :vsplit term://zsh<CR>a
  nnoremap <leader>tt :e term://zsh<CR>a
  nnoremap <A-t> :e term://zsh<CR>a
elseif executable("bash")
  nnoremap <leader>' :vsplit term://bash<CR>a
  nnoremap <leader>- :vsplit term://bash<CR>a
  nnoremap <leader>tt :e term://bash<CR>a
  nnoremap <A-t> :e term://bash<CR>a
else
  nnoremap <leader>' :vsplit term://sh<CR>a
  nnoremap <leader>- :vsplit term://sh<CR>a
  nnoremap <leader>tt :e term://sh<CR>a
  nnoremap <A-t> :e term://sh<CR>a
endif

" python terminal
if executable("ipython3")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython3<CR><C-w><C-w>
  vnoremap <C-CR> "+y<C-w><C-w>a%paste<C-\><C-n><C-w><C-w>
elseif executable("ipython")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://ipython<CR><C-w><C-w>
  vnoremap <C-CR> "+y<C-w><C-w>a%paste<C-\><C-n><C-w><C-w>
elseif executable("python3")
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python3<CR><C-w><C-w>
else
  nnoremap <leader>r :cd %:h<CR>:vsplit term://python<CR><C-w><C-w>
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
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" force exit
map <leader>qq :q!<CR>

" just type :w!! to save the file, even if you did not run Vim with sudo.
cmap w!! w !sudo tee % >/dev/null

