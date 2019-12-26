call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'     " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'   " Comment out lines      :help commentary
" Plug 'tmsvg/pear-tree'        " Vim auto-pair plugin.

" On-demand loading
" The undo history visualizer for VIM 
Plug 'mbbill/undotree',     { 'on': 'UndotreeToggle' }  " Show Undo tree.     :help undotree-intro
" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'  , { 'on': 'TagbarToggle' }    " Show Tag list.      :help tagbar

" A light and configurable statusline/tabline plugin for Vim
" Plug 'itchyny/lightline.vim'
" Airline tabline theme
Plug 'vim-airline/vim-airline' " Status line            :help airline
Plug 'vim-airline/vim-airline-themes'
" Tag file manager
" Plug 'ludovicchabant/vim-gutentags'

" Retro groove color scheme for Vim
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'

" Fuzzy file finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'

" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'Shougo/denite.nvim'

" Asynchronous Linting Tool
" Plug 'dense-analysis/ale'

" autocomplete plugins
" Plug 'Valloric/YouCompleteMe'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --system-libclang --clang-completer'}  " code completion engine for Vim
" Plug 'Valloric/YouCompleteMe', { 'do': 'LD=/u/urmish/usr/local/bin/ld CXX=/depot/gcc-7.3.0/bin/g++ ./install.py --clang-completer --system-libclang'}  " code completion engine for Vim
" Plug 'Valloric/YouCompleteMe', { 'do': 'LD=/depot/binutils-2.30/bin/ld CXX=/depot/gcc-7.3.0/bin/g++ ./install.py --clangd-completer'}  " code completion engine for Vim

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-scripts/DoxygenToolkit.vim'

" Snippet insertion engine and collection
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Plug 'mhinz/vim-startify'

" Plug 'sainnhe/vim-color-desert-night'
" Plug 'sainnhe/vim-color-forest-night'
" Plug 'sainnhe/vim-color-vanilla-cake'
" Plug 'sainnhe/vim-color-grimoire'
" Plug 'sainnhe/vim-color-ice-age'

" Plug 'sheerun/vim-polyglot'
" Plug 'jeaye/color_coded'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'scrooloose/nerdcommenter'

" Directory diff in vim
Plug 'will133/vim-dirdiff'

" Perforce integration
Plug 'nfvs/vim-perforce'

Plug 'rhysd/vim-clang-format'

Plug 'kana/vim-operator-user'

" smooth page up/down
Plug 'psliwka/vim-smoothie'

" disable search highlighting when not needed
Plug 'romainl/vim-cool'

" aligning tables in code (e.g. glip=, 3gli(,
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

" Add your own mapping. For example:

" Allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start
" Use spaces instead of tab
set expandtab
" Specify tab size
set tabstop=2
" Indent size
set shiftwidth=2

" Use ';' as the leader key
let mapleader=";"

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
  else
    set signcolumn=yes
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
nnoremap <leader>bn :bnext<cr>
nnoremap <leader><tab> :bnext<CR>
nnoremap <leader>bp :bprevious<cr>
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
" set tags=/u/urmish/apbld/tags
set tags=/u/urmish/ndm_apbld/tags
" Specify path to executable for universal ctags to be used by Tagbar
let g:tagbar_width = 40
let g:tagbar_ctags_bin = '/u/urmish/usr/local/bin/ctags'

" noremap <leader><C-K> :py3f /u/urmish/usr/local/share/clang/clang-format.py<cr>
autocmd FileType c,cpp,objc map <buffer> = <Plug>(operator-clang-format)

if has("autocmd")
  autocmd BufNewFile,BufRead *.C set filetype=cpp
  autocmd BufNewFile,BufRead *.tm,*.pcx,*.setup set filetype=tcl
  autocmd BufNewFile,BufRead *.setup.urmish set filetype=tcl
  autocmd BufNewFile,BufRead *.make set filetype=make
  autocmd BufReadPost *.scm,*.rkt,*.tktl set filetype=racket
  autocmd filetype racket set lisp
  autocmd filetype racket set autoindent
  autocmd filetype racket,lisp,scheme setlocal equalprg=scmindent.rkt
endif

" Show lightline even if one pane is open
set laststatus=2

" air-line
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

" AirLine colorscheme
" let g:airline_theme="base16"
" let g:airline_theme="molokai"
let g:airline_theme="papercolor"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" let g:cpp_experimental_simple_template_highlight = 1 " Makes scrolling slower
let g:cpp_experimental__template_highlight = 1 " Faster with corner cases
let g:cpp_concepts_highlight = 1

let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='medium'

" Dark/Light vim background
set background=dark
" set background=light

set termguicolors
" colorscheme desert
colorscheme gruvbox
" colorscheme desert-night

" let g:UltiSnipsExpandTrigger="<C-j>"

" Disable highlight Denite file/rec results
" highlight default link deniteMatchedChar  None
" highlight default link deniteMatchedRange None

" Use gs to toggle whitespace ignore in vimdiff
if &diff
  " colorscheme gruvbox
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
" highlight cursorline cterm=NONE
" highlight cursorline cterm=NONE ctermbg=239
" highlight cursorcolumn ctermbg=249

" highlight Search ctermbg=red
" highlight Search ctermfg=white

let g:DoxygenToolkit_authorName = $USER

" nvim build
" /depot/cmake/cmake-3.9.0/bin/cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_BUILD_PREFIX=/u/urmish/usr/local -DLIBLUV_LIBRARY:FILEPATH=/u/urmish/usr/local/usr/local/lib/lua/luv.so -DLIBLUV_INCLUDE_DIR=/u/urmish/usr/local/usr/local/lib/lua -DLIBVTERM_LIBRARY:FILEPATH=/u/urmish/usr/local/usr/local/lib/libvterm.la -DLIBVTERM_INCLUDE_DIR=/u/urmish/usr/local/usr/local/lib ..
"
" coc settings
" source ~/.vim/ccls_settings.vim
