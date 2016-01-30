"""""""""""""""""""""
" basic configuration
"
syntax enable 	" use syntax highlighting
set tw=79 	" wrap text at 79 columns

" create backup files
set backup

" soft tabs, 2 spaces
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

" show line numbers
set number

" show row/column in status
set ruler

" highlight column 80
set colorcolumn=80

set wildignore+=**/node_modules/**,**/vendor/**,**/bower_components/**,*.ttf,*.woff,*.eot,*.png

""""""""""""""
" load plugins
"
call plug#begin('~/.vim/plugged')

" languages
Plug 'fatih/vim-go'
Plug 'neovimhaskell/haskell-vim'
Plug 'jalvesaq/Nvim-R'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nginx.vim'

" syntax awareness
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'

" nagivation
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'
Plug 'ctrlpvim/ctrlp.vim'

" git integration
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" editing
Plug 'godlygeek/tabular'
Plug 'jamessan/vim-gnupg'

call plug#end()

""""""""""""
" keybindings
"

" map <Esc> to enter vim mode in terminal panes
tnoremap <Esc> <C-\><C-n>

" <C-w>: Window operations
map <C-w>c :tabnew<CR>
map <C-w>n :tabnext<CR>
map <C-w>p :tabprev<CR>
map <C-w>\| :vsplit<CR>
map <C-w>- :split<CR>

" <C-b>: Buffer operations
map <C-b>n :bnext<CR>
map <C-b>p :bprev<CR>
map <C-b>c :enew<CR>

" <leader>init to edit config
map <leader>init :e ~/.config/nvim/init.vim<CR>

" <leader>q to close buffer
map <leader>q :Bdelete<CR>

" toggle file tree with Ctrl-L
map <C-l> :NERDTreeToggle<CR>

" clear search highlight with <leader>/
map <leader>c :noh<CR>

" toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <leader>r :call NumberToggle()<cr>

"""""""""""""""
" set variables
"

" terminal
let g:terminal_scrollback_buffer_size=100000


""""""""""""
" automation

" source vim config on write
autocmd! BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

" 72 column wrap for git commit messages
autocmd FileType gitcommit set tw=72

" use ruby for 'Vagrantfile'
autocmd BufReadPost Vagrantfile set syntax=ruby

" open tree on startup
autocmd vimenter * NERDTree

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" coffeescript: fold on indentation
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" coffeescript: 2-space soft tabs
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

""""""""""""""
" color scheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

highlight OverLength ctermbg=8 ctermfg=8
match OverLength /\%100v.\+/

""""""""
" syntax
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\.go$']
