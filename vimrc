" basic highlighting
syntax on

" load all packages
packloadall

" no sound effects
set noerrorbells
set visualbell
set t_vb=

" dont word wrap
set nowrap

" case sensitive search
set ignorecase
set smartcase

" no vim .swap
set noswapfile

set nobackup

" need to create this when on a new computer
set undodir=~/.vim/undodir

set undofile

" get results of search while typing
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" scroll before reaching bottom
set scrolloff=8

" ALL PLUGS GO IN BETWEEN HERE
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'mbbill/undotree'
" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" --------- COLOR SCHEMES ---------------
" og color
" Plug 'morhetz/gruvbox'
"
" Pitch black
" Plug 'pgavlin/pulumi.vim'

" Light Theme (Easy on the eyes)
Plug 'https://github.com/sainnhe/sonokai'
" --------- COLOR SCHEMES ---------------

" Comment out code
" usage --> gcc -> line | gc (visual) -> comment
Plug 'https://github.com/tpope/vim-commentary'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Show current branch and other info on file
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" file manager
Plug 'https://github.com/preservim/nerdtree'

" formatter
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Better comments
Plug 'https://github.com/jbgutierrez/vim-better-comments'

" Vim syntax
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc-tsserver' " TS autocomplete

" Allow searching from visual
Plug 'nelstrom/vim-visual-star-search'

call plug#end()
" END OF ALL PLUGS

" -----------------------------------------
" Auto lint
"
" tab settings
set tabstop=4 softtabstop=4

" Indent to same level as prev indentation
set autoindent

" < > shift lines over characters
set shiftwidth=4

" set tab to space
set expandtab

" tries to guess appropriate indentation
set smartindent

" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = 'auto'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'auto'
" Partial format
let g:prettier#partial_format=1
" -----------------------------------------

colorscheme sonokai
set background=dark

" ctrlp ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|packagist\|Zend'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_clear_cache_on_exit = 0
" ctrlp ignore  END

" enable js syntax highlighting
" need to run --> git clone https://github.com/pangloss/vim-javascript.git
" ~/.vim/pack/vim-javascript/start/vim-javascript
let g:javascript_plugin_jsdoc = 1

" set leader key
let mapleader = " "

" airline look settings
let g:airline_left_sep='>'

set nocompatible
set mouse=a
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " block

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>hh :wincmd H<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>jj :wincmd J<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>kk :wincmd K<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ll :wincmd L<CR>

" Resize commands
nnoremap <leader>+ 10<C-w>+
nnoremap <leader>- 10<C-w>-
nnoremap <leader>< 10<C-w><
nnoremap <leader>> 10<C-w>>
nnoremap <leader>= <C-w>=

" Open file tree, resize
nnoremap <leader>b :NERDTree <bar> :vertical resize 35<CR>
nnoremap <leader>u :UndotreeShow<CR>

" Go to tab by number
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

" Open terminal in new tab
noremap <leader>tt :tab terminal<cr>
" Open bottom terminal
noremap <leader>` :bo term<cr>
"Allow esc to enter vim in term
tnoremap <Esc> <C-\><C-n>

" COC
let g:coc_global_extensions = [ 'coc-tsserver' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Prettier
xnoremap <leader>f :Prettier<cr>
nmap <leader>f :Prettier<cr>

" vim fugitive
nmap <leader>gs :G<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gf :diffget //3<cr>
nmap <leader>gj :diffget //2<cr>

" line movement
noremap <leader>up :m .-2<cr>
noremap <leader>dn :m .+1<cr>


" functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup JEORDMAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"" Special comment styling
hi QuestionBetterComments ctermfg=blue ctermbg=black
hi ErrorBetterComments ctermfg=red ctermbg=black
hi HighlightBetterComments ctermfg=Magenta ctermbg=black
hi StrikeoutBetterComments ctermfg=Yellow ctermbg=black
hi TodoBetterComments ctermfg=red ctermbg=LightGray
