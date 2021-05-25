" set runtimepath+=~/.vim,~/.vim/after
" set packpath+=~/.vim
" source ~/.vimrc

" auto-install vim-plug (easier pluginmanager)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif

"GLOBAL INSTALLs
"" TypeScript (dont have to)
"" lehre (for jsdoc)
""      .nvim/plugged/vim-jsdoc -> run "make install"
"" sudo apt-get install ripgrep

" Basic highlight
syntax on

" load all packages
packloadall

" autocmd FileType * setlocal formatoptions-=c formatoptions-=r

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

set undodir=~/.config/nvim/undodir
set undofile

" mark 80 character line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" relative number sidebar
set number relativenumber
" set number
set nu rnu

" scroll down 8 chars from borders
set scrolloff=8

" wait time between commands
set timeoutlen=300

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
" Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'

" Plug 'sainnhe/sonokai'
Plug 'arzg/vim-colors-xcode'

Plug 'tpope/vim-commentary' " Special comments
Plug 'tpope/vim-fugitive' " Git integration
Plug 'preservim/nerdtree' " filetree
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " linter
Plug 'jbgutierrez/vim-better-comments' " colored comments

Plug 'ekalinin/Dockerfile.vim'
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

Plug 'neoclide/jsonc.vim' " json handle

" MARKDOWN
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" JSDOC
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

Plug 'Yggdroot/indentLine' " Show indent levels

" attempt at a global searcher
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'APZelos/blamer.nvim'

call plug#end()

let g:blamer_enabled = 1

au BufReadPost *.ezt set syntax=html

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

" ! tab settings
set tabstop=4 softtabstop=4
set autoindent
set shiftwidth=4
set expandtab
set smartindent
auto BufReadPost	*.xx	retab! \t

" AIRLINE Bar -------------------------------------------------------
" sudo apt-get install fonts-powerline
set guifont=DejaVu\ Sans:s12

let g:airline_theme='deus'
" air-line
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
" let g:airline_section_b = '%{strftime("%H:%M")}'
" -------------------------------------------------------

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

let g:prettier#quickfix_enabled = 0
let g:prettier#config#tab_width = 'auto'

let g:prettier#config#use_tabs = 'false'
let g:prettier#partial_format=1

" ! set colorscheme
colorscheme xcodedark
set background=dark

highlight Normal ctermbg=NONE ctermbg=NONE
" highlight NonText ctermbg=NONE ctermbg=NONE

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

nnoremap <leader>b :NERDTree <bar>:vertical resize 35<CR>
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

noremap <leader>tn :tabnew<cr>
noremap <leader>tt :tab terminal<cr>
noremap <leader>` :bo term<cr>
tnoremap <Esc> <C-\><C-n>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>

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
  \ 'coc-phpls',
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

" Format function
nmap <leader>jd :JsDoc<cr>

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

hi diffAdded cterm=bold ctermbg=10
hi diffRemoved cterm=bold ctermbg=09

hi diffFile cterm=NONE ctermfg=DarkBlue
hi gitcommitDiff cterm=NONE ctermfg=DarkBlue
hi diffIndexLine cterm=NONE ctermfg=DarkBlue
hi diffLine cterm=NONE ctermfg=DarkBlue

set laststatus=2
set t_Co=256

set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" Find files using telescope command line
" https://www.youtube.com/watch?v=Es76v7WAqMg&t=10s
" nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <silent> <C-p> :Telescope find_files<CR>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <C-f> :Telescope live_grep<CR>
nnoremap <leader>tb <cmd>Telescope buffers<CR>

" paste what was last YANKED
" vnoremap p "0p

"" GOLANG
filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Auto build and test in go files
augroup auto_go
	autocmd!
	autocmd BufWritePost *.go :GoBuild
	autocmd BufWritePost *_test.go :GoTest
augroup end

