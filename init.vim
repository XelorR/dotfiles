" === Core ideas ===================================

" it should work on:
"         PC (tested on GNU/Linux: Manjaro)
"         WC (tested on Windows 10)
"         my android phone (via termux)
"
" it should work as fast as possible
"
" it should primarly use leader key combinations
"         with SPC as leader key
"         grouping commands by letters
"         as in SpaceMacs
"
" you should be able to use it as terminal too
"         and it should work with most popular terms
"
" it should be easy to modify
"
" it should be convenient for Sublime Text users
"         multiple cursor support (with ctrl+n here)
"         buffer switch (with ctrl+pgup/ctrl+pgdown)
"         fuzzy file/text search (CtrlP, fzf, rg)
"         buffer close (with alt+w in this config)
"         split windows right and below
"         save sessions
"         same binding for side bar toggle

" --- Why NeoVim -----------------------------------

" why not Vim?
"         Vim does not contain terminal
"         Lack of cyrillic support in termux version
"
" why not Sublime Text?
"         poor modal editing support in all plugins
"         'ActualVim' plugin is unstable
"         proprietary, asks for license
"
" why not SpaceMacs?
"         SpaceMacs is huge
"         it should always run as service to be
"                 able to start fast
"
" why not Emacs?
"         lack of text editor
"
" why not IDE?
"         most of it require more that 0.5s to start

" === Dependencies =================================

" VimPlug - for import plugins
" yapf - code formatting
" python - to run yapf
" fzf, ripgrep - fuzzy search
" git

" === Imports ======================================

" importing modules via VimPlug
if has("win32") || has("win16")
  call plug#begin('C:/vimplugins')
else
  call plug#begin('~/.local/share/nvim/plugged')
endif
Plug 'zxqfl/tabnine-vim' " completion engine
" Plug 'python-mode/python-mode' " completion engine
Plug 'terryma/vim-multiple-cursors' " Ctrl+n for multicursour editing
Plug 'easymotion/vim-easymotion' " cursor quick movements
Plug 'ayu-theme/ayu-vim' " theme
Plug 'airblade/vim-gitgutter' " git row markers
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-commentary' " type gcc to comment
Plug 'tpope/vim-surround' " cs, ds, ys for surroundings
Plug 'tpope/vim-repeat' " use dot for surroundings
Plug 'Yggdroot/indentLine' " visualize indents with lines
Plug 'vim-airline/vim-airline' " informative bar
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file and mru searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " better fuzzy searcher
Plug 'machakann/vim-highlightedyank' " highlit copied selection
Plug 'xolox/vim-session' " managing sessions
Plug 'xolox/vim-misc' " dependency for sessions
Plug 'ludovicchabant/vim-gutentags' " ctags auto management
Plug 'scrooloose/nerdtree' " sidebar
Plug 'sjl/gundo.vim' " undo tree
call plug#end()

" === Lettings-Settings ============================

" Session config
set sessionoptions=buffers,folds,winsize
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 5
let g:session_autosave_silent = 1
let g:session_default_to_last = 1

" splits windows in more habitual manner
set splitright
set splitbelow

" line numbers - normal and relative
set nu
" set rnu

" Increment file search binding
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

" Theme
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" IndentLine {{
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" " }}

" Keep terminal session alive even if not displayed
augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" folding for python
set foldmethod=indent

" J behaviour
set nojoinspaces

" === Key bindings =================================

" defining leader key
let maplocalleader = "\\"
let mapleader = "\<Space>"

" --- Leader ---------------------------------------

" b - buffer management
map <leader>bp :bprev!<Return>
map <leader>bn :bnext!<Return>
map <leader>bd :bdelete!<Return>
map <leader><tab> :b!#<Return>
map <leader>w :w<Return>
nnoremap <leader>bu :GundoToggle<CR>

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
noremap <leader>mm @q

" n - navigation
" navigate to file in folder and history
    noremap <leader>nn :CtrlPMixed<CR>
" navigate to files in current folder
    noremap <leader>nf :Files<CR>
" navigate to line in current view
    map <Leader>l <Plug>(easymotion-bd-jk)
    nmap <Leader>l <Plug>(easymotion-overwin-line)
" navigate to line in opened buffers
    noremap <leader>nl :Lines<CR>
" navigate via rg - cearch text in all files in current folder
    noremap <leader>nr :Rg<CR>
" navigate by tags specified in tags files
    noremap <leader>nt :CtrlPTag<CR>
" navigate by recently visited files
    noremap <leader>ne :bro ol!<CR>
    noremap <leader>nm :CtrlPMRUFiles
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
" navigate by jump history
nmap <Leader>j :call GotoJump()<CR>

" s - search (?)
" reserved for easymotion

" t - terminal
if executable("powershell")
  map <leader>' :vsplit term://powershell<CR>a
  map <leader>- :split term://powershell<CR>a
  map <leader>tt :e term://powershell<CR>a
  map <A-t> :e term://powershell<CR>a
elseif executable("cmd")
  map <leader>' :vsplit term://cmd<CR>a
  map <leader>- :vsplit term://cmd<CR>a
  map <leader>tt :e term://cmd<CR>a
  map <A-t> :e term://cmd<CR>a
elseif executable("fish")
  map <leader>' :vsplit term://fish<CR>a
  map <leader>- :vsplit term://fish<CR>a
  map <leader>tt :e term://fish<CR>a
  map <A-t> :e term://fish<CR>a
elseif executable("zsh")
  map <leader>' :vsplit term://zsh<CR>a
  map <leader>- :vsplit term://zsh<CR>a
  map <leader>tt :e term://zsh<CR>a
  map <A-t> :e term://zsh<CR>a
elseif executable("bash")
  map <leader>' :vsplit term://bash<CR>a
  map <leader>- :vsplit term://bash<CR>a
  map <leader>tt :e term://bash<CR>a
  map <A-t> :e term://bash<CR>a
else
  map <leader>' :vsplit term://sh<CR>a
  map <leader>- :vsplit term://sh<CR>a
  map <leader>tt :e term://sh<CR>a
  map <A-t> :e term://sh<CR>a
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
nnoremap <A-u> :GundoToggle<CR>

" --- Control --------------------------------------

" buffers
" movements
imap <C-PageUp> <C-[>:bprev!<Return>
imap <C-PageDown> <C-[>:bnext!<Return>
map <C-PageUp> :bprev!<Return>
map <C-PageDown> :bnext!<Return>
tnoremap <C-PageUp> <C-\><C-n>:bprev!<Return>
tnoremap <C-PageDown> <C-\><C-n>:bnext!<Return>

" search results (vimgrep results)
map <C-S-PageUp> :cprev!<Return>
map <C-S-PageDown> :cnext!<Return>

" git
map <C-A-up> :Gpush<CR>
map <C-A-down> :Gpull<CR>

" <C-w> - windows management - reserved

" --- Mixed ----------------------------------------

" theme switch maping
function! Theme_toggle()
  if (g:ayucolor == "dark")
    let g:ayucolor="light" 
    colorscheme ayu
  else
    let g:ayucolor="dark" 
    colorscheme ayu
  endif
endfunction

noremap <leader>tg :call Theme_toggle()<CR>
noremap <leader>td :let ayucolor="dark" \| colorscheme ayu<CR>
noremap <leader>tm :let ayucolor="mirage" \| colorscheme ayu<CR>
noremap <leader>tl :let ayucolor="light" \| colorscheme ayu<CR>

" cd to current file
map <leader>cd :cd %:p:h<cr>

" yank and paste using system clipboard
noremap <leader>y "+y
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>p "+p

" exit to normal mode from insert with 'jj' and 'esc'
inoremap jj <c-[>
tnoremap jj <c-\><c-n>
tnoremap <esc> <c-\><c-n>

" toggle nerdtree - same hotkey as in st3
nnoremap <c-k><c-b> :nerdtreetoggle<cr>

" reset highlight on screen refresh
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" force exit
map <leader>qq :q!<CR>

" just type :w!! to save the file, even if you did not run Vim with sudo.
cmap w!! w !sudo tee % >/dev/null

