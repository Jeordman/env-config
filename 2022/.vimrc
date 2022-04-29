" auto-install vim-plug (easier pluginmanager)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

" Basic highlight
filetype plugin on
syntax on

" load all packages
packloadall

" no flashing of terminal
"
set noerrorbells
set visualbell
set t_vb=

" dont wrap lines
set nowrap

" search casing
set ignorecase
set smartcase

" search in middle of typeing
set incsearch

" mark 80 character line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" relative number sidebar
set nu rnu

" scroll down 8 chars from borders
set scrolloff=8

" wait time between commands
set timeoutlen=300

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary' " Special comments
Plug 'tpope/vim-fugitive' " Git integration
Plug 'preservim/nerdtree' " filetree

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'jbgutierrez/vim-better-comments' " colored comments
Plug 'ekalinin/Dockerfile.vim' " Style dockerfiles
" langs
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver' " TS autocomplete
Plug 'mg979/vim-visual-multi' " type on multiple lines at once
Plug 'tpope/vim-surround' " insert chars around
" Plug 'airblade/vim-gitgutter' " show file edits in gutter
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" Colored git location / current edit mode
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'Yggdroot/indentLine' " Show indent levels

Plug 'StanAngeloff/php.vim'
call plug#end()

"color theme
set background=dark
let g:vscode_style = "dark"
colorscheme vscode

"! tab
set tabstop=4 softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
set smartindent
auto BufReadPost	*.xx	retab! \t
" AIRLINE Bar
set guifont=DejaVu\ Sans:s12
let g:airline_theme='deus'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
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

" Prettier autoformatting
let g:prettier#quickfix_enabled = 0
let g:prettier#config#tab_width = 'auto'
let g:prettier#config#use_tabs = 'false'
let g:prettier#partial_format=1

let g:javascript_plugin_jsdoc = 1 " enable jsdoc

let mapleader = " " " set leader key
" set mouse/cursor type
set nocompatible
set mouse=a
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " block
" window commands
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

" open nerdtree at far left
nnoremap <leader>b :NERDTree <bar>:vertical resize 35<CR>
nnoremap <leader>u :UndotreeShow<CR>

" tab changing
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

noremap <leader>tn :tabnew<cr>
noremap <leader>tt :tab terminal<cr>
noremap <leader>` :bo term<cr>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

" Buffer management
map qn :bn<cr>
map qp :bp<cr>
map qd :bd<cr>

" coc languages config
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-phpls',
  \ 'coc-html',
  \ 'coc-svelte',
  \ 'coc-docker',
  \ 'coc-sh',
  \ 'coc-yaml',
  \ ]

" Use K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" formatting on button press
xnoremap <leader>f :PrettierFragment<cr>
nmap <leader>f :Prettier<cr>

" manage github
nmap <leader>gs :G<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gf :diffget //3<cr>
nmap <leader>gj :diffget //2<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>gpu :Git push -u origin HEAD<cr>

" auto run jsdoc on function
nmap <leader>jd :JsDoc<cr>

" remove whitespace from files
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

" manual color settings for better comments
hi QuestionBetterComments ctermfg=blue ctermbg=black
hi ErrorBetterComments ctermfg=red ctermbg=black
hi HighlightBetterComments ctermfg=Magenta ctermbg=black
hi StrikeoutBetterComments ctermfg=Yellow ctermbg=black
hi TodoBetterComments ctermfg=red ctermbg=LightGray

" manual git colors
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
"
"" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

let g:vim_json_conceal=0
let NERDTreeShowHidden=1
let b:coc_pairs_disabled = 0
