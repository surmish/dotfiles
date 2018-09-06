filetype off                  " required

call plug#begin()

Plug 'tpope/vim-surround'      " Manipulate parenthesis :help surround
Plug 'tpope/vim-commentary'    " Comment out lines      :help commentary
Plug 'tpope/vim-unimpaired'

Plug 'w0rp/ale'                " Asynchronous Lint Engine

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' " Status line            :help airline
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/LeaderF'        " fuzzy file explorer written in Python

" On-demand loading
Plug 'majutsushi/tagbar'  , { 'on': 'TagbarToggle' }    " Show Tag list.         :help tagbar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " Filesystem explorer    :help NERDtree

" autocomplete plugins
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --system-libclang --clang-completer'}  " code completion engine for Vim

Plug 'ervandew/supertab'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Enable for racket/list development
" Plug 'amdt/vim-niji'           "parenthesis in color
" Plug 'vim-scripts/paredit.vim' "parenthesis in pairs for Lisp/Scheme
" Plug 'wlangstroth/vim-racket'  " vim bundle for Racket

call plug#end()

" ./configure --enable-multibyte --enable-python3interp=yes --enable-perlinterp=yes --enable-cscope
" make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
" sudo make install

" Return to normal mode from insert mode by pressing j twice quickly
imap jj <ESC>

" Show line numbers
set number

" Yank and Paste lines from/to vim to/from external editors
nnoremap <C-y> "*y
vnoremap <C-y> "*y
nnoremap <C-p> "*gP
vnoremap <C-p> "*gP

" allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start

" highlight searches
set  hlsearch
nmap sh <ESC>:set hlsearch!<CR>

" live search while typing, cursor returns to original position on no match or pressing ESC
set incsearch

" ignorecase while searching
set  ignorecase
nmap ci <ESC>:set ignorecase!<CR>

" Resize vertically split windows
nmap > <ESC><C-w>>
nmap < <ESC><C-w><
" Resize horizontally split windows
nmap - <ESC><C-w>-
nmap + <ESC><C-w>+

" Write the changes
nmap <C-m> <ESC>:w!<CR>
" Exit if file not modified
nmap <C-n> <ESC>:q<CR>
" Force exit irrespective of changes
nmap <C-l> <ESC>:q!<CR>

" navigate to end or start of line in normal mode
map <C-e> <end>
map <C-a> <home>

" scroll to next/previous page in normal mode
nmap f <C-f>
nmap b <C-b>

" do not wrap around long lines
set  nowrap
nmap <C-h> <ESC>:set wrap!<CR>

" Keep cursor in the center of the vim window
set  scrolloff=200

map  <C-j>        :! clang-tidy -fix -checks=* %<CR>
imap <C-j> <C-o>  :! clang-tidy -fix -checks=*<CR>
map  <C-K>        :py3file /usr/share/clang/clang-format.py<cr>
imap <C-K> <C-o>  :py3file /usr/share/clang/clang-format.py<cr>

" highlight entire current file
nmap va ggvG$
nmap ya ggvG$y

" left/right to step through buffers 
nmap <left>   :bp<cr>
nmap <right>  :bn<cr>

" Use spaces instead of tab
set expandtab
set tabstop=2
set shiftwidth=2

" Display the tags in your program
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>

"autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt
if has("autocmd")
    au BufReadPost *.scm,*.rkt,*.tktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif

" air-line
let g:airline_powerline_fonts   = 1

" skip check added for reducing python{x,3} module load time in neovim
let g:python3_host_prog       = '/usr/bin/python3'
let g:python3_host_skip_check = 1

" YouCompleteMe defaults
let g:SuperTabDefaultCompletionType     = '<C-n>'
let g:ycm_key_list_select_completion    = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion  = ['<C-p>', '<Up>']
let g:ycm_confirm_extra_conf = 0
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger        = "<tab>"
let g:UltiSnipsJumpForwardTrigger   = "<tab>"
let g:UltiSnipsJumpBackwardTrigger  = "<s-tab>"

" au FileType systemverilog let g:ale_linters = {'systemverilog' : ['verilator'],}
" let g:ale_verilog_verilator_options = '-sv --default-language "1800-2011"'
au FileType systemverilog let g:ale_linters = {'systemverilog' : ['iverilog'],}
let g:ale_verilog_iverilog_options = '-g 2012'

set cursorline
set cursorcolumn
" The '^[' is a single character. You enter it by pressing Ctrl+v and then ESC.
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set background=dark
" set background=light
" let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="light"
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
set termguicolors
