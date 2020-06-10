call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'     " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'   " Comment out lines      :help commentary
" Plug 'tmsvg/pear-tree'        " Vim auto-pair plugin.

" Navigate through inner words
Plug 'bkad/camelcasemotion'
" CamelCase motion mappings {{{
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
" }}}

" Move blocks of code instead of deleting/pasting
Plug 'matze/vim-move'
" vim-move key binding {{{
let g:move_key_modifier = 'C'
" }}}

" On-demand loading
" The undo history visualizer for VIM 
Plug 'mbbill/undotree',   { 'on': 'UndotreeToggle' }  " Show Undo tree. :help undotree-intro

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }    " Show Tag list.  :help tagbar

" Show function context
Plug 'wellle/context.vim'

" A light and configurable statusline/tabline plugin for Vim
" Plug 'itchyny/lightline.vim'
" Airline tabline theme
Plug 'vim-airline/vim-airline'         " Status line :help airline
Plug 'vim-airline/vim-airline-themes'

" air-line {{{
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
" let g:airline_theme="base16"
" let g:airline_theme="molokai"
" let g:airline_theme="papercolor"
" }}}

" gdb integration - debugging
Plug 'puremourning/vimspector'

" easy way to search and navigate the current file
Plug 'easymotion/vim-easymotion'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'haya14busa/vim-easyoperator-phrase'

" Retro groove color scheme for Vim
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" {{{
" FZF popup window settings
nnoremap <silent> <C-p> :FZF<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" Border color
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo' } }
" Border style
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false } }
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

" Code completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc Extensions {{{
let g:coc_global_extensions = [
      \'coc-dictionary',
      \'coc-marketplace',
      \'coc-syntax',
      \'coc-tag',
      \'coc-utils',
      \'coc-highlight',
      \'coc-python',
      \'coc-ultisnips',
      \'coc-explorer',
      \'coc-snippets',
      \'coc-clangd'
      \]
" }}}
" Coc settings {{{
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

" aligning tables in code E.g. glip=, 3gli(,
Plug 'tommcdo/vim-lion'

call plug#end()

filetype indent plugin on
syntax on
set mouse=a
set autoindent
set lazyredraw
set ttyfast

set nomodeline

set nocompatible
runtime macros/matchit.vim

" Display the UndoTree in your program
nnoremap <F5> :UndotreeToggle<CR>
" Display the tags in your program
nnoremap <F8> :TagbarToggle<CR>

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

" Allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start
" Use spaces instead of tab
set expandtab
" Specify tab size
set tabstop=2
" Indent size
set shiftwidth=2

" Use ';' as the leader key
let mapleader="\<Space>"

" Enter normal mode from insert or visual mode
inoremap jj <ESC>
" Write the changes
nnoremap <leader><C-m> :w!<CR>
" Exit if file not modified
nnoremap <leader><C-n> :q<CR>
" Force exit irrespective of changes
nnoremap <leader><C-l> :q!<CR>
" Close current buffer 
nnoremap <leader><C-d> :bd<CR>

" Display line numbers by default
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

set  scrolloff=200
" Keep cursor in the center of the vim window
nnoremap <leader>so :let &scrolloff = 200 - &scrolloff<CR>

" do not wrap around long lines
set  nowrap
" Toggle wrap around long lines
nmap <leader><C-h> <ESC>:set wrap!<CR>
" Show break chars for wrapped lines
" set showbreak=...

" highlight entire current file
nnoremap <leader>va ggvG$
" yank all lines of the file and return to current position
nnoremap <leader>ya maggvG$y'a

" highlight searches
set  hlsearch
" Toggle search highlightinh
nmap <leader>sh <ESC>:set hlsearch!<CR>
" live search while typing, cursor returns to original position on no match or pressing ESC
set incsearch

" ignore case while searching
set ignorecase
" Toggle ignorecase while searching
nmap <leader>ic <ESC>:set ignorecase!<CR>

" left/right to step through buffers 
nnoremap <leader><tab>   :bnext<CR>
nnoremap <leader><S-tab> :bprevious<CR>

" Move to the beginning and end of line using 'Ctrl a' and 'Ctrl e'
nnoremap <leader><C-a> 0
nnoremap <leader><C-e> $

" Move forward 1 page
nnoremap <leader>f <C-f>
nnoremap <leader>b <C-b>

" Move to next tag
nmap <leader>t <ESC>:tn<CR>
" Move to previous tag
nmap <leader>p <ESC>:tp<CR>

" Look for tags file in parent directories until its found
" set tags=./tags;,tags;
let g:tagbar_width = 40

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
endif

autocmd FileType c,cpp map <buffer> = <Plug>(operator-clang-format)

" Show lightline even if one pane is open
set laststatus=2

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'

" Dark/Light vim background
set background=dark
" set background=light

colorscheme gruvbox

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

" Highlight current row and column background
set cursorline
set cursorcolumn
