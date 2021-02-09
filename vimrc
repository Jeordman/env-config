sic highlighting
syntax on

" no sound effects
" set noerrorbells
" set visualbell
" set t_vb=
"
" " tab settings
" set tabstop=4 softtabstop=4
"
" " < > shift lines over characters
" set shiftwidth=4
"
" " set tab to space
" set expandtab
"
" " tries to guess appropriate indentation
" set smartindent
"
" " dont word wrap
" set nowrap
"
" " case sensitive search
" set smartcase
"
" " no vim .swap
" set noswapfile
"
" set nobackup
"
" " need to create this when on a new computer
" set undodir=~/.vim/undodir
"
" set undofile
"
" " get results of search while typing
" set incsearch
"
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
"
" " turn hybrid line numbers on
" set number relativenumber
" set nu rnu
"
" " ALL PLUGS GO IN BETWEEN HERE
" call plug#begin('~/.vim/plugged')
"
" Plug 'jremmen/vim-ripgrep'
" Plug 'leafgarland/typescript-vim'
" Plug 'https://github.com/kien/ctrlp.vim'
" Plug 'mbbill/undotree'
" " Autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" " --------- COLOR SCHEMES ---------------
" " og color
" " Plug 'morhetz/gruvbox'
" "
" " Pitch black
" " Plug 'pgavlin/pulumi.vim'
"
" " Light Theme (Easy on the eyes)
" Plug 'https://github.com/sainnhe/sonokai'
" " --------- COLOR SCHEMES ---------------
"
" call plug#end()
" " END OF ALL PLUGS
"
" colorscheme sonokai
" set background=dark
"
" " ignore node modules
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"
" " enable js syntax highlighting
" " need to run --> git clone https://github.com/pangloss/vim-javascript.git
" " ~/.vim/pack/vim-javascript/start/vim-javascript
" let g:javascript_plugin_jsdoc = 1
"
" let mapleader = " "
"
" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
" nnoremap <leader>b :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" nnoremap <leader>u :UndotreeShow<CR>
" " Go to tab by number
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
" noremap <leader>6 6gt
" noremap <leader>7 7gt
" noremap <leader>8 8gt
" noremap <leader>9 9gt
" noremap <leader>0 :tablast<cr>
" " Open terminal in new tab
" noremap <leader>tt :tab terminal<cr>
" " Open bottom terminal
" noremap <leader>` :bo term<cr>
" "Allow esc to enter vim in term
" tnoremap <Esc> <C-\><C-n>
"
" " COC
" nmap <leader>gd <Plug>(coc-definitions)
" nmap <leader>gr <Plug>(coc-references)
