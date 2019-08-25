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
"         side bar (SPC b b)

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

" neovim
" VimPlug - for import plugins
" nodejs, yarn
" fzf, ripgrep - fuzzy search
" git
" python3
" python3 -m pip install --user --upgrade neovim jedi yapf python-language-server[all] pyls
" :CocInstall coc-python

" === Imports ======================================

" importing modules via VimPlug
if has("win32") || has("win16")
  call plug#begin('C:/vimplugins')
  " for deoplete
  " let g:python3_host_prog = '/full/path/to/neovim3/bin/python'
else
  call plug#begin('~/.local/share/nvim/plugged')
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'} " completion engine
Plug 'ervandew/supertab' " use tab for completions
" Plug 'zxqfl/tabnine-vim' " completion engine
" Plug 'python-mode/python-mode' " completion engine
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion engine
" Plug 'deoplete-plugins/deoplete-jedi' "completion source
Plug 'terryma/vim-multiple-cursors' " Ctrl+n for multicursour editing
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'tpope/vim-commentary' " type gcc to comment
Plug 'tpope/vim-surround' " cs, ds, ys for surroundings
Plug 'tpope/vim-repeat' " use dot for surroundings
Plug 'morhetz/gruvbox' " theme
" Plug 'sickill/vim-monokai' " theme
Plug 'Yggdroot/indentLine' " visualize indents with lines
Plug 'vim-airline/vim-airline' " informative bar
Plug 'airblade/vim-gitgutter' " git row markers
Plug 'machakann/vim-highlightedyank' " highlit copied selection
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file and mru searcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " better fuzzy searcher
Plug 'easymotion/vim-easymotion' " cursor quick movements
Plug 'scrooloose/nerdtree' " sidebar
Plug 'nelstrom/vim-visual-star-search' " search all in v mode by pressing *
Plug 'severin-lemaignan/vim-minimap' " code map on the right
Plug 'Konfekt/FastFold'
Plug 'junegunn/goyo.vim' " disrtuction free mode
Plug 'junegunn/limelight.vim' " highlight only current paragraph
call plug#end()

" === Lettings-Settings ============================

" for completion
" let g:deoplete#enable_at_startup = 1
set tags='' " i don't actually use tags, rg is moe convenient for in-file search
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

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
syntax enable
set termguicolors     " enable true colors support
let g:backcolor="dark"
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="medium"
colorscheme gruvbox

" IndentLine {{
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
" " }}

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" folding for python
set foldmethod=indent

" J behaviour
set nojoinspaces

" Keep terminal session alive even if not displayed
augroup custom_term
    autocmd!
    autocmd TermOpen * setlocal bufhidden=hide
augroup END

" Don’t update screen during macro and script execution
set lazyredraw

" encryption mode (:X to encrypt)
" set cryptmethod=blowfish2

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
" navigate via rg - search text in all files in current folder
    noremap <leader>nr :Rg<CR>
" navigate by recently visited files
    noremap <leader>ne :bro ol!<CR>
    noremap <leader>nm :CtrlPMRUFiles<CR>
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
  if (g:backcolor == "dark")
    let g:backcolor="light" 
    set background=light
    " colorscheme gruvbox
  else
    let g:backcolor="dark" 
    set background=dark
    " colorscheme monokai
  endif
endfunction

noremap <leader>tg :call Theme_toggle()<CR>

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

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" force exit
map <leader>qq :q!<CR>

" just type :w!! to save the file, even if you did not run Vim with sudo.
cmap w!! w !sudo tee % >/dev/null

