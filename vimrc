" vim:fdm=marker

" Use ' ' as the leader key
let mapleader="\<Space>"

" Write the changes
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'     " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'   " Comment out lines      :help commentary
"" Plug 'tmsvg/pear-tree'        " Vim auto-pair plugin.

Plug 'wlangstroth/vim-racket'

" Plug 'dstein64/vim-startuptime'

" On-demand loading
" The undo history visualizer for VIM  {{{
" Plug 'mbbill/undotree',   { 'on': 'UndotreeToggle' }  " Show Undo tree. :help undotree-intro
" nnoremap <F5> :UndotreeToggle<CR>
" }}}

" LSP alternative for preservim {{{
Plug 'liuchengxu/vista.vim'
nnoremap <F8> :Vista!!<CR>
let g:vista#finders = ['fzf']
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_fzf_preview = ['right:30%']
let g:vista_sidebar_width = 40
" }}}

set tags=$VIM_TAG_FILE
" set tags=$VIM_TAG_FILE2
nnoremap <leader>st :call SwitchTagsFile()<CR>

function! SwitchTagsFile()
  if &tags == $VIM_ALT_TAG_FILE
    set tags=$VIM_TAG_FILE
  else
    set tags=$VIM_ALT_TAG_FILE
  endif
  echo &tags
endfunction

" Plugin to provide additional text objects: E.g. change inside brackets and
" parenthesis
Plug 'wellle/targets.vim'

" Show function context {{{
Plug 'wellle/context.vim',   { 'on': 'ContextToggle' }  " Show context.
nnoremap <F4> :ContextToggle<CR>
" }}}

if !has('nvim')
" Airline status bar {{{
  Plug 'vim-airline/vim-airline'         " Status line :help airline
  Plug 'vim-airline/vim-airline-themes'

  " let g:airline_section_a=''
  " let g:airline_section_b='%-0.90{getcwd()}'
  let g:airline_section_b=''
  let g:airline_section_c='%t'
  " let g:airline_section_x=''
  let g:airline_section_y=''
  let g:airline_section_error=''
  let g:airline_section_warning=''
  let g:airline_powerline_fonts=1
  " remove separators for empty sections
  let g:airline_skip_empty_sections=1

  " Disable tagbar integration, enable vista integration
  " let g:airline#extensions#tagbar#flags   = 'f'
  " let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#vista#enabled = 1

  " let g:airline#extensions#tabline#show_splits      = 1 " enable/disable displaying open splits per tab (only when tabs are opened). >
  let g:airline#extensions#tabline#show_buffers     = 1 " enable/disable displaying buffers with a single tab
  let g:airline#extensions#tabline#tab_nr_type      = 1 " tab number
  let g:airline#extensions#tabline#buffer_idx_mode  = 1 " show buffer numbers
  let g:airline#extensions#tabline#enabled          = 1 " Enable the list of buffers
  let g:airline#extensions#tabline#fnamemod         = ':t' " Show just the filename

  let g:airline#extensions#wordcount#enabled = 0

  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

  " AirLine colorscheme
  " let g:airline_theme="ayu_dark"
  " let g:airline_theme="base16"
  " let g:airline_theme="base16_bright"
  let g:airline_theme="base16_chalk"
  " let g:airline_theme="molokai"
  " let g:airline_theme="papercolor"
  " let g:airline_theme="light"
  " let g:airline_theme="onedark"
  "
" }}}

" Retro groove color scheme for Vim {{{
  Plug 'sainnhe/gruvbox-material'
" }}}

" Dim inactive windows {{{
  Plug 'blueyed/vim-diminactive'
" }}}

" Plug 'markonm/traces.vim'

" Code completion engine {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = [
        \'coc-dictionary',
        \'coc-marketplace',
        \'coc-tag',
        \'coc-highlight',
        \'coc-pyright',
        \'coc-yank',
        \'coc-snippets',
        \'coc-json',
        \'coc-xml',
        \'coc-clangd'
        \]
  let g:coc_user_config = {
        \ "diagnostic.errorSign"  : '✘',
        \ "diagnostic.warningSign": '⚠',
        \ "diagnostic.infoSign"   : '',
        \ "diagnostic.hintSign"   : '➤',
        \ }
  " \ "diagnostic.signOffset" : 9999,
" }}}

" Snippet insertion engine and collection {{{
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<C-j>"
  " }}}

  Plug 'jackguo380/vim-lsp-cxx-highlight'

" Smooth scrolling plugin in vimscript
  Plug 'psliwka/vim-smoothie'

  " easy way to search and navigate the current file {{{
  " f,F,t,T smarter find/till char commands
  Plug 'rhysd/clever-f.vim'
  " }}}

  " Easy navigation around the burrent buffer.
  Plug 'easymotion/vim-easymotion'

  " incsearch {{{
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  " map z/ <Plug>(incsearch-fuzzy-/)
  " map z? <Plug>(incsearch-fuzzy-?)
  " map zg/ <Plug>(incsearch-fuzzy-stay)

  map z/ <Plug>(incsearch-fuzzyspell-/)
  map z? <Plug>(incsearch-fuzzyspell-?)
  map zg/ <Plug>(incsearch-fuzzyspell-stay)

  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'kana/vim-operator-user'
  Plug 'haya14busa/vim-operator-flashy'
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
  Plug 'haya14busa/vim-easyoperator-line'
  Plug 'haya14busa/vim-easyoperator-phrase'
  " }}}
endif

" Fuzzy file finder {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader><C-p> :Files<CR>
nnoremap <silent> <leader><C-l> :Buffers<CR>
" let g:fzf_layout = { 'down': "~60%" }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* AFind call fzf#vim#grep('rg $VIM_RG_ARGS '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep( 'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
let $FZF_DEFAULT_OPTS = $FZF_DEFAULT_OPTS . ' --no-reverse'
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
imap <c-x><c-w> <plug>(fzf-complete-word)
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
" inoremap <expr> <c-x><c-p> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" inoremap <expr> <c-x><c-w> fzf#vim#complete#word({'window': { 'width': 0.5, 'height': 0.8, 'xoffset': 1 }})
" Enter date
" }}}

" Rainbow plugin {{{
Plug 'junegunn/rainbow_parentheses.vim'
let g:rainbow#max_level = 16 
let g:rainbow#blacklist = [175]
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
highlight MatchParen cterm=bold
" }}}

" Align plugin {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}


Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName = $USER

Plug 'scrooloose/nerdcommenter'

" Directory diff in vim
Plug 'will133/vim-dirdiff'

" Perforce integration
Plug 'nfvs/vim-perforce'

Plug 'rhysd/vim-clang-format'
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : 2,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "BinPackArguments" : "false",
      \ "BinPackParameters" : "false",
      \ "Standard" : "C++11",
      \ "ColumnLimit": 120}

" Plug 'wfxr/minimap.vim'

" directory browser {{{
" Disable netrw (file explorer) plugins
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
if !has('nvim')
  Plug 'preservim/nerdtree'
  nnoremap <F7> :NERDTreeToggle<CR>
endif
" }}}

Plug 'ryanoasis/vim-devicons'

" Plug 'mhinz/vim-startify'
Plug 'edkolev/tmuxline.vim'

call plug#end()

filetype indent plugin on
set mouse+=a
if !has('nvim')
  set ttymouse=xterm2
endif
set autoindent
set lazyredraw
set ttyfast
set hidden
set nomodeline
set nocompatible
set foldmethod=syntax
set path+=**
set wildmenu

runtime macros/matchit.vim

set dictionary+=/usr/share/dict/words

" Allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start
" Use spaces instead of tab
set expandtab
" Specify tab size
set tabstop=2
" Indent size
set shiftwidth=2

nnoremap <leader>w :update!<CR>
" Exit if file not modified
nnoremap <leader>q :q<CR>
" Force exit irrespective of changes
nnoremap <leader>Q :q!<CR>
" Close current buffer 
nnoremap <leader>x :x<CR>

" disable Ex mode
noremap Q <Nop>

" moving around with jkl; {{{
" moving around the current buffer
nnoremap ; <Right>
nnoremap l <Up>
nnoremap k <Down>
nnoremap j <Left>
" move between windows
nmap <silent> <C-w>j :wincmd h<CR>
nmap <silent> <C-w>k :wincmd j<CR>
nmap <silent> <C-w>l :wincmd k<CR>
nmap <silent> <C-w>; :wincmd l<CR>
" move windows
nmap <silent> <C-w>J :wincmd H<CR>
nmap <silent> <C-w>K :wincmd J<CR>
nmap <silent> <C-w>L :wincmd K<CR>
nmap <silent> <C-w>: :wincmd L<CR>
" visual mode
xnoremap ; <Right>
xnoremap l <Up>
xnoremap k <Down>
xnoremap j <Left>
" operator pending
onoremap ; <Right>
onoremap l <Up>
onoremap k <Down>
onoremap j <Left>
" capitalized 
nnoremap K k
xnoremap K k
onoremap K k
" }}}

" Display line numbers by default {{{
set number relativenumber
nnoremap <leader>nu :set nonumber! relativenumber!<CR>
nnoremap <leader>si :call ToggleSignColumn()<CR>

function! ToggleSignColumn()
  if &signcolumn == 'no'
    set signcolumn=yes
  else
    set signcolumn=no
  endif
endfunction

augroup numbertoggle
  autocmd!
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber number
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  autocmd BufEnter,FocusGained * set relativenumber number
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
" }}}

let &scrolloff = 18
nnoremap <leader>so :let &scrolloff = 18 - &scrolloff<CR>

" do not wrap around long lines
set  nowrap
" Toggle wrap around long lines
nmap <leader><C-h> <ESC>:set wrap!<CR>

" visually select the entire buffer
nnoremap <leader>av ggvG$
" yank all lines of the file and return to current position
nnoremap <leader>ay maggvG$y'a
" yank into/paste from clipboard register
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" disable help via F1 key
nmap <F1> <>

" Map enter in normal mode to :
nnoremap <expr> <CR> &buftype ==# 'nofile' ? "\<CR>" : ':'

" ignore = in filename completion
set isfname-==

" search settings {{{
" search highlighting
set  hlsearch
nmap <leader>sh <ESC>:set hlsearch!<CR>
" live search while typing, cursor returns to original position on no match or pressing ESC
set incsearch
" }}}

" ignore case while searching {{{
set ignorecase
" Toggle ignorecase while searching
nmap <leader>ic <ESC>:set ignorecase!<CR>
" }}}

" left/right to step through buffers 
nnoremap <leader><tab>   :bnext<CR>
nnoremap <leader><S-tab> :bprevious<CR>

" Move to next tag
nmap <leader>t <ESC>:tn<CR>
" Move to previous tag
nmap <leader>p <ESC>:tp<CR>

if has("autocmd")
  autocmd BufNewFile,BufRead *.pro set filetype=make
  autocmd BufNewFile,BufRead *.zsh set filetype=bash
  autocmd BufNewFile,BufRead *.C set filetype=cpp
  autocmd BufNewFile,BufRead *.vs,*.sv,*.v,*.vh set filetype=verilog
  autocmd BufNewFile,BufRead *.tm,*.pcx,*.setup,*.inc set filetype=tcl
  autocmd BufNewFile,BufRead *.setup.urmish set filetype=tcl
  autocmd BufNewFile,BufRead *.make set filetype=make
  autocmd BufReadPost *.lisp,*.scm,*.rkt,*.tktl set filetype=lisp
  autocmd BufReadPost *.gdbinit.urmish set filetype=gdb
  autocmd filetype racket set lisp
  autocmd filetype racket set autoindent
  autocmd filetype racket,lisp,scheme,commonlisp setlocal equalprg=scmindent
  autocmd FileType c,cpp map <buffer> = <Plug>(operator-clang-format)
  " Activation based on file type
  if !has("nvim")
    autocmd FileType c,cpp,lua,lisp,clojure,scheme,rust,python RainbowParentheses
  endif
endif

" Use gs to toggle whitespace ignore in vimdiff
if &diff
  syntax off
  map <leader>ds :call IwhiteToggle()<CR>
  function! IwhiteToggle()
    if &diffopt =~ 'iwhite'
      set diffopt-=iwhite
    else
      set diffopt+=iwhite
    endif
  endfunction
endif

" Highlight cursor row and column background in current window
augroup Cursor
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

nnoremap <leader>edate i <C-r>=strftime('%F')<CR><ESC>

" Colorscheme settings {{{
set background=dark
let g:gruvbox_material_background='medium'
let g:gruvbox_material_disable_italic_comment = 1
if !has('nvim')
  colorscheme gruvbox-material
endif
highlight CursorLine    ctermbg=236 guibg=#444444 cterm=none gui=none
highlight CursorColumn  ctermbg=236 guibg=#444444
highlight CursorLineNr  cterm=none  gui=none 
" }}}
