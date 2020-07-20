" vim:fdm=marker
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'     " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'   " Comment out lines      :help commentary
" Plug 'tmsvg/pear-tree'        " Vim auto-pair plugin.

" On-demand loading
" The undo history visualizer for VIM  {{{
Plug 'mbbill/undotree',   { 'on': 'UndotreeToggle' }  " Show Undo tree. :help undotree-intro
nnoremap <F5> :UndotreeToggle<CR>
" }}}

" Vim plugin that displays tags in a window, ordered by scope {{{
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }    " Show Tag list.  :help tagbar
nnoremap <F8> :TagbarToggle<CR>
" Look for tags file in parent directories until its found
" set tags=./tags;,tags;
let g:tagbar_width = 40
let g:tagbar_ctags_bin = "$HOME/usr/local/bin/ctags"

set tags=$VIM_TAG_FILE
nnoremap <leader>st :call SwitchTagsFile()<CR>

function! SwitchTagsFile()
  if &tags == $VIM_ALT_TAG_FILE
    set tags=$VIM_TAG_FILE
  else
    set tags=$VIM_ALT_TAG_FILE
  endif
  echo &tags
endfunction
" }}}

" Show function context
Plug 'wellle/context.vim'

" Airline status bar {{{
Plug 'vim-airline/vim-airline'         " Status line :help airline
Plug 'vim-airline/vim-airline-themes'

let g:airline_section_a=''
" let g:airline_section_b='%-0.90{getcwd()}'
let g:airline_section_b=''
let g:airline_section_y=''
let g:airline_section_x=''
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_powerline_fonts=1
" remove separators for empty sections
let g:airline_skip_empty_sections=1

let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

" Enable the list of buffers

let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" AirLine colorscheme
let g:airline_theme="base16"
" let g:airline_theme="molokai"
" let g:airline_theme="papercolor"
" let g:airline_theme="light"
" }}}

" easy way to search and navigate the current file
Plug 'easymotion/vim-easymotion'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
" incsearch settings {{{
" map z/ <Plug>(incsearch-fuzzy-/)
" map z? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)

map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)
" }}}

Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'

" Retro groove color scheme for Vim
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox' 

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" {{{
" FZF popup window settings
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-l> :Buffers<CR>
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
" }}}
 
" Dim inactive windows
Plug 'blueyed/vim-diminactive'

" Resize windows
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
" lens.vim {{{
let g:lens#disabled_filetypes = ['fzf']
let g:lens#width_resize_min = 20
let g:lens#width_resize_max = 80
let g:lens#height_resize_min = 5
let g:lens#height_resize_max = 35
" }}}

Plug 'markonm/traces.vim'
Plug 'vim/killersheep'

Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName = $USER

" Code completion engine {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \'coc-dictionary',
      \'coc-marketplace',
      \'coc-syntax',
      \'coc-tag',
      \'coc-utils',
      \'coc-highlight',
      \'coc-python',
      \'coc-explorer',
      \'coc-snippets',
      \'coc-clangd'
      \]
let g:coc_user_config = {
    \ "clangd.semanticHighlighting": "true",
    \ "diagnostic.errorSign": '⚠',
    \ "diagnostic.warningSign": '⚐',
    \ "diagnostic.infoSign": '⚐',
    \ "diagnostic.hintSign": '⚐',
    \ "diagnostic.signOffset": 9999,
    \ "coc.preferences.enableFloatHighlight": "v:false",
  \ }
" }}}

" Snippet insertion engine and collection
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-j>"

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'scrooloose/nerdcommenter'

" Directory diff in vim
Plug 'will133/vim-dirdiff'

" Perforce integration
Plug 'nfvs/vim-perforce'

Plug 'rhysd/vim-clang-format'

Plug 'kana/vim-operator-user'

" smooth page up/down
Plug 'psliwka/vim-smoothie'

" Execute python code in Jupyter notebook
Plug 'jupyter-vim/jupyter-vim'

call plug#end()

filetype indent plugin on
syntax on
set mouse+=a
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

" moving around with jkl; {{{
nnoremap ; <Right>
nnoremap l <Up>
nnoremap k <Down>
nnoremap j <Left>
nmap <silent> <C-w>j :wincmd h<CR>
nmap <silent> <C-w>k :wincmd j<CR>
nmap <silent> <C-w>l :wincmd k<CR>
nmap <silent> <C-w>; :wincmd l<CR>
nmap <silent> <C-w>J :wincmd H<CR>
nmap <silent> <C-w>K :wincmd J<CR>
nmap <silent> <C-w>L :wincmd K<CR>
nmap <silent> <C-w>: :wincmd L<CR>
xnoremap ; <Right>
xnoremap l <Up>
xnoremap k <Down>
xnoremap j <Left>
" }}}


" netrw plugin settings {{{
" Disable netrw (file explorer) plugins
" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" Enable netrw (file explorer) plugins
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

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
    silent Lexplore
  endif
endfunction
nnoremap <silent><F7> :call ToggleNetrw()<CR>
" }}}

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
nnoremap <leader>w :w!<CR>
" Exit if file not modified
nnoremap <leader>q :q<CR>
" Force exit irrespective of changes
nnoremap <leader>Q :q!<CR>
" Close current buffer 
nnoremap <leader>x :x<CR>

" Display line numbers by default {{{
set number
" nnoremap <leader>nu :set nonumber!<CR>
nnoremap <leader>nu :call ToggleNumbersAndSignColumns()<CR>

function! ToggleNumbersAndSignColumns()
  set nonumber!
  if &signcolumn == 'yes'
    set signcolumn=no
  elseif &signcolumn == 'no'
    set signcolumn=yes
  else
    set signcolumn=no
  endif
endfunction
" }}}

" Keep cursor in the center of the vim window {{{
" set  scrolloff=200
" move cursor freely
set  scrolloff=0
nnoremap <leader>so :let &scrolloff = 18 - &scrolloff<CR>
" }}}

" do not wrap around long lines
set  nowrap
" Toggle wrap around long lines
nmap <leader><C-h> <ESC>:set wrap!<CR>

" highlight entire current file
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
  autocmd BufReadPost *.scm,*.rkt,*.tktl set filetype=racket
  autocmd filetype racket set lisp
  autocmd filetype racket set autoindent
  autocmd filetype racket,lisp,scheme setlocal equalprg=scmindent.rkt
  autocmd FileType c,cpp map <buffer> = <Plug>(operator-clang-format)
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

" easymotion settings {{{
" Move to char
nmap <Leader><Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" Move to word
nmap  <Leader><Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
" }}}

" Gruvbox settings {{{
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'

" Dark/Light vim background
set background=dark
" set background=light

colorscheme gruvbox
" }}}

" Highlight current row and column background
set cursorline
set cursorcolumn
