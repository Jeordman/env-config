if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif


filetype plugin on
syntax on

packloadall

set noerrorbells
set visualbell
set t_vb=

set nowrap

set ignorecase
set smartcase

set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set nu rnu

set scrolloff=8

set timeoutlen=300

call plug#begin('~/.config/nvim/plugged')
Plug 'Mofiqul/vscode.nvim'
Plug 'tpope/vim-commentary' 
Plug 'tpope/vim-fugitive' 
Plug 'preservim/nerdtree' 

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'jbgutierrez/vim-better-comments' 
Plug 'ekalinin/Dockerfile.vim' 
Plug 'pangloss/vim-javascript'    
Plug 'leafgarland/typescript-vim' 
Plug 'mg979/vim-visual-multi' 
Plug 'tpope/vim-surround'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'Yggdroot/indentLine'

Plug 'StanAngeloff/php.vim'
call plug#end()

set background=dark
let g:vscode_style = "dark"
colorscheme vscode

set tabstop=4 softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
set smartindent
auto BufReadPost	*.xx	retab! \t
set guifont=DejaVu\ Sans:s12
let g:airline_theme='deus'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1

let g:prettier#quickfix_enabled = 0
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'false'
let g:prettier#partial_format=1

let g:javascript_plugin_jsdoc = 1

let mapleader = " " " set leader key
set nocompatible
set mouse=a
let &t_SI = "\<esc>[5 q"  
let &t_SR = "\<esc>[3 q"  
let &t_EI = "\<esc>[2 q"  
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>hh :wincmd H<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>jj :wincmd J<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>kk :wincmd K<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ll :wincmd L<CR>
nnoremap <leader>+ 10<C-w>+
nnoremap <leader>- 10<C-w>-
nnoremap <leader>< 10<C-w><
nnoremap <leader>> 10<C-w>>
nnoremap <leader>= <C-w>=

nnoremap <leader>b :NERDTree <bar>:vertical resize 35<CR>
nnoremap <leader>u :UndotreeShow<CR>

noremap <leader>tn :tabnew<cr>
noremap <leader>tt :tab terminal<cr>
noremap <leader>` :bo term<cr>

imap <C-BS> <C-W>

map qn :bn<cr>
map qp :bp<cr>
map qd :bd<cr>

xnoremap <leader>f :PrettierFragment<cr>
nmap <leader>f :Prettier<cr>

nmap <leader>gs :G<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gf :diffget //3<cr>
nmap <leader>gj :diffget //2<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gpu :Git push -u origin HEAD<cr>

nmap <leader>jd :JsDoc<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

map <leader>pp :call TogglePaste()<cr>

augroup JEORDMAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

hi QuestionBetterComments ctermfg=blue ctermbg=black
hi ErrorBetterComments ctermfg=red ctermbg=black
hi HighlightBetterComments ctermfg=Magenta ctermbg=black
hi StrikeoutBetterComments ctermfg=Yellow ctermbg=black
hi TodoBetterComments ctermfg=red ctermbg=LightGray

hi diffAdded cterm=bold ctermbg=10
hi diffRemoved cterm=bold ctermbg=09
hi diffFile cterm=NONE ctermfg=DarkBlue
hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
hi diffIndexLine cterm=NONE ctermfg=DarkBlue
hi diffLine cterm=NONE ctermfg=DarkBlue

set laststatus=2
set t_Co=256

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

augroup filetypedetect
    au BufReadPost *.php,*.phtml,*.html set syntax=php
    
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

let g:vim_json_conceal=0
let NERDTreeShowHidden=1
