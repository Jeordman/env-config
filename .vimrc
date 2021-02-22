" Basic highlight
syntax on

" load all packages
packloadall

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=oa

" no flashing of terminal
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

" no vim .swap
set noswapfile
set nobackup

set undodir=~/.vim/undodir
set undofile

" mark 80 character line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" relative number sidebar
set number relativenumber
set nu rnu

" scroll down 8 chars from borders
set scrolloff=8

" wait time between commands
set timeoutlen=300

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'

" Plug 'sainnhe/sonokai'
Plug 'arzg/vim-colors-xcode'

Plug 'tpope/vim-commentary' " Special comments
Plug 'tpope/vim-fugitive' " Git integration
Plug 'preservim/nerdtree' " filetree
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " linter
Plug 'jbgutierrez/vim-better-comments' " colored comments

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc-tsserver' " TS autocomplete
Plug 'nelstrom/vim-visual-star-search'

Plug 'mg979/vim-visual-multi'

Plug 'tpope/vim-surround' " insert chars around

Plug 'mattn/emmet-vim' " code snippets

Plug 'airblade/vim-gitgutter' " show file edits in gutter

Plug 'frazrepo/vim-rainbow' " colorize bracket pairs

Plug 'severin-lemaignan/vim-minimap' " minimap on right of file

Plug 'ap/vim-css-color' " css color preview

" Colored git location / current edit mode
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'

Plug 'mileszs/ack.vim' " global searcher
call plug#end()

" ! tab settings
set tabstop=4 softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
set smartindent

" AIRLINE Bar -------------------------------------------------------
" sudo apt-get install fonts-powerline
set guifont=DejaVu\ Sans:s12

let g:airline_theme='deus'
" air-line
let g:airline_powerline_fonts = 1

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
" -------------------------------------------------------

" Ack ---------------------------------------------------
" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search
"  case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>= :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
" -------------------------------------------------------

let g:prettier#quickfix_enabled = 0
let g:prettier#config#tab_width = 'auto'

let g:prettier#config#use_tabs = 'auto'
let g:prettier#partial_format=1

" ! set colorscheme
colorscheme xcodedark
set background=dark

" ctrlp ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|packagist\|Zend'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_clear_cache_on_exit = 0

let g:javascript_plugin_jsdoc = 1

" ! set leader
let mapleader = " "

" set mouse/cursor type
set nocompatible
set mouse=a
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " block

" turn on rainbow colorizer
let g:rainbow_active = 1

" change minimap_highlight color
let g:minimap_highlight='coclistbgblue'

set clipboard=unnamed

nnoremap <leader>mm :MinimapToggle<CR>

" Copy to clipboard w/ ctrl+c
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

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

nnoremap <leader>b :NERDTree <bar> :vertical resize 35<CR>
nnoremap <leader>u :UndotreeShow<CR>

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

noremap <leader>tt :tab terminal<cr>
noremap <leader>` :bo term<cr>
tnoremap <Esc> <C-\><C-n>

" Buffer management
map qn :bn<cr>
map qp :bp<cr>
map qd :bd<cr>

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" Use K to show documentation in preview window
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

xnoremap <leader>f :PrettierFragment<cr>
nmap <leader>f :Prettier<cr>

nmap <leader>gs :G<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gf :diffget //3<cr>
nmap <leader>gj :diffget //2<cr>

noremap <leader>up :m .-2<cr>
noremap <leader>dn :m .+1<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction

map <leader>p :call TogglePaste()<cr>

augroup JEORDMAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

hi QuestionBetterComments ctermfg=blue ctermbg=black
hi ErrorBetterComments ctermfg=red ctermbg=black
hi HighlightBetterComments ctermfg=Magenta ctermbg=black
hi StrikeoutBetterComments ctermfg=Yellow ctermbg=black
hi TodoBetterComments ctermfg=red ctermbg=LightGray

highlight Normal ctermbg=none
highlight NonText ctermbg=none

hi diffAdded cterm=bold ctermbg=10
hi diffRemoved cterm=bold ctermbg=09

hi diffFile cterm=NONE ctermfg=DarkBlue
hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
hi diffIndexLine cterm=NONE ctermfg=DarkBlue
hi diffLine cterm=NONE ctermfg=DarkBlue

set laststatus=2
set t_Co=256
