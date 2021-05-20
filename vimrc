" vim:fdm=marker
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'     " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'   " Comment out lines      :help commentary
"" Plug 'tmsvg/pear-tree'        " Vim auto-pair plugin.

Plug 'wlangstroth/vim-racket'

" On-demand loading
" The undo history visualizer for VIM  {{{
Plug 'mbbill/undotree',   { 'on': 'UndotreeToggle' }  " Show Undo tree. :help undotree-intro
nnoremap <F5> :UndotreeToggle<CR>
" }}}

" LSP alternative for preservim {{{
Plug 'liuchengxu/vista.vim'
nnoremap <F8> :Vista!!<CR>
 let g:vista#executives = ['coc', 'ctags', 'vim_lsc', 'vim_lsp']
 let g:vista#extensions = ['markdown', 'rst']
 let g:vista#finders = ['fzf']
 let g:vista#renderer#ctags = 'line'
 let g:vista#renderer#enable_icon = 1
 let g:vista_blink = [2, 100]
 let g:vista_close_on_jump = 0
 let g:vista_cursor_delay = 100
 let g:vista_default_executive = 'ctags'
 let g:vista_disable_statusline = 0
 let g:vista_echo_cursor = 1
 let g:vista_echo_cursor_strategy = 'floating_win'
 let g:vista_executive_for = {}
 let g:vista_find_absolute_nearest_method_or_function = 0
 let g:vista_find_nearest_method_or_function_delay = 300
 let g:vista_fold_toggle_icons = ['▼', '▶']
 let g:vista_fzf_preview = ['right:50%']
 let g:vista_icon_indent = ['└ ', '│ ']
 let g:vista_ignore_kinds = []
 let g:vista_no_mappings = 0
 let g:vista_sidebar_position = 'vertical botright'
 let g:vista_sidebar_width = 40
 let g:vista_stay_on_open = 0
 let g:vista_top_level_blink = [2, 100]
 let g:vista_update_on_text_changed = 0
 let g:vista_update_on_text_changed_delay = 500
" }}}

" " Vim plugin that displays tags in a window, ordered by scope {{{
" Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }    " Show Tag list.  :help tagbar
" nnoremap <F8> :TagbarToggle<CR>
" " Look for tags file in parent directories until its found
" " set tags=./tags;,tags;
" let g:tagbar_width = 40
" let g:tagbar_ctags_bin = "$HOME/usr/local/bin/ctags"
" " }}}

" set tags=$VIM_TAG_FILE
set tags=$VIM_TAG_FILE2
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
" let g:airline_theme="base16_chalk"
" let g:airline_theme="molokai"
" let g:airline_theme="papercolor"
" let g:airline_theme="light"
let g:airline_theme="onedark"
" }}}

" " easy way to search and navigate the current file
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

" Retro groove color scheme for Vim {{{
Plug 'sainnhe/gruvbox-material'
" }}}

if has('nvim')
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
endif

" Fuzzy file finder {{{
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-l> :Buffers<CR>
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

" Dim inactive windows
Plug 'blueyed/vim-diminactive'

" lens.vim {{{
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
let g:lens#disabled_filetypes = ['fzf']
let g:lens#width_resize_min = 20
let g:lens#width_resize_max = 80
let g:lens#height_resize_min = 5
let g:lens#height_resize_max = 35
nnoremap <F6> :let g:lens#disabled = 1 - g:lens#disabled<CR>
" }}}

Plug 'markonm/traces.vim'

Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName = $USER

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

" Snippet insertion engine and collection
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-j>"

if has('vim')
  Plug 'jackguo380/vim-lsp-cxx-highlight'
endif

Plug 'scrooloose/nerdcommenter'

" Directory diff in vim
Plug 'will133/vim-dirdiff'

" Perforce integration
Plug 'nfvs/vim-perforce'

Plug 'rhysd/vim-clang-format'

" Plug 'wfxr/minimap.vim'

" Execute python code in Jupyter notebook
" Plug 'jupyter-vim/jupyter-vim'

" directory browser {{{
" Disable netrw (file explorer) plugins
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
if has('nvim')
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  nnoremap <F7> :CHADopen<CR>
  Plug 'psliwka/vim-smoothie'
else
  Plug 'preservim/nerdtree'
  nnoremap <F7> :NERDTreeToggle<CR>
endif
" }}}

Plug 'ryanoasis/vim-devicons'

Plug 'bignimbus/you-are-here.vim'

" Plug 'mhinz/vim-startify'
Plug 'edkolev/tmuxline.vim'

call plug#end()

filetype indent plugin on
set mouse+=a
if has('vim')
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

" Use ' ' as the leader key
let mapleader="\<Space>"

" Write the changes
nnoremap <leader>w :update!<CR>
" Exit if file not modified
nnoremap <leader>q :q<CR>
" Force exit irrespective of changes
nnoremap <leader>Q :q!<CR>
" Close current buffer 
nnoremap <leader>x :x<CR>

" disable command history
map q: <Nop>
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

nnoremap <leader>so :let &scrolloff = 18 - &scrolloff<CR>

" do not wrap around long lines
set  nowrap
" Toggle wrap around long lines
nmap <leader><C-h> <ESC>:set wrap!<CR>

" visually select the entire buffer
nnoremap <leader>va ggvG$
" yank all lines of the file and return to current position
nnoremap <leader>ya maggvG$y'a

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
  autocmd BufNewFile,BufRead *.C set filetype=cpp
  autocmd BufNewFile,BufRead *.vs,*.sv,*.v,*.vh set filetype=verilog
  autocmd BufNewFile,BufRead *.tm,*.pcx,*.setup,*.inc set filetype=tcl
  autocmd BufNewFile,BufRead *.setup.urmish set filetype=tcl
  autocmd BufNewFile,BufRead *.make set filetype=make
  autocmd BufReadPost *.lisp,*.scm,*.rkt,*.tktl set filetype=racket
  autocmd BufReadPost *.gdbinit.urmish set filetype=gdb
  autocmd filetype racket set lisp
  autocmd filetype racket set autoindent
  autocmd filetype racket,lisp,scheme setlocal equalprg=scmindent.rkt
  autocmd FileType c,cpp map <buffer> = <Plug>(operator-clang-format)
  " Activation based on file type
  autocmd FileType c,cpp,tcl,lisp,clojure,scheme RainbowParentheses
endif

" Use gs to toggle whitespace ignore in vimdiff
if &diff
  map <leader>gs :call IwhiteToggle()<CR>
  function! IwhiteToggle()
    if &diffopt =~ 'iwhite'
      set diffopt-=iwhite
    else
      set diffopt+=iwhite
    endif
  endfunction
endif

" You-are-here settings {{{
nnoremap <silent> <leader>here :call you_are_here#Toggle()<CR>
nnoremap <silent> <leader>upd  :call you_are_here#Update()<CR>
" }}}

" Highlight cursor row and column background in current window
augroup Cursor
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

imap <C-f> <plug>(fzf-complete-file)
imap <C-p> <plug>(fzf-complete-path)

" Enter date
nnoremap <leader>edate i <C-r>=strftime('%F')<CR><ESC>

if has('nvim')
  syntax off
  autocmd FileType vim,tcl,gdb syntax on
endif

" Colorscheme settings {{{
if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:gruvbox_material_background='medium'
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material
highlight CursorLine    ctermbg=236 guibg=#444444 cterm=none gui=none
highlight CursorColumn  ctermbg=236 guibg=#444444
highlight CursorLineNr  cterm=none  gui=none 
" }}}
