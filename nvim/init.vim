if exists('g:vscode')

set incsearch

else
syntax on
filetype plugin on

set number
set laststatus=2
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
set noswapfile
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set termguicolors
set undodir=~/.vim/undodir
set undofile
set rtp+=/usr/local/opt/fzf


call plug#begin('~/.local/share/nvim/plugged')

Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hotoo/jsgf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'alvan/vim-closetag'
Plug 'evanleck/vim-svelte'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'itchyny/vim-gitbranch'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'jremmen/vim-ripgrep'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

call plug#end()

colorscheme dogrun
hi Normal  guibg=NONE ctermbg=NONE
hi Visual  guifg=none guibg=#4F517D gui=none
hi Search  guifg=#000000 guibg=#DCA000
hi illuminatedWord cterm=underline gui=underline
source ~/.config/nvim/colors.vim
source ~/.config/nvim/fzf-settings.vim


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



inoremap jk <ESC>
vnoremap < <gv
vnoremap > >gv
nmap <C-right> :bnext<CR>
nmap <C-left> :bprev<CR>
noremap <silent> <c-p> :Files<CR>
noremap <silent> <c-f> :RG<CR>
noremap <silent> <tab> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



let mapleader= " "
let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$', '^.git$']
let NERDTreeQuitOnOpen=1
" Go
let g:go_fmt_command = "goimports"

let g:svelte_indent_style = 0

"prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md Prettier

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" autocmd FileType typescript :call GoYCM()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript




:endif
