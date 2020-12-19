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
Plug 'victorze/foo'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'commit': '4e72e5b~'}
Plug 'hotoo/jsgf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'alvan/vim-closetag'
Plug 'evanleck/vim-svelte'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'rbong/vim-flog'
Plug 'itchyny/vim-gitbranch'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'jremmen/vim-ripgrep'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-vdebug/vdebug'


call plug#end()

colorscheme dogrun
" colorscheme nightfly
hi Normal  guibg=NONE ctermbg=NONE
hi Visual  guifg=none guibg=#4F517D gui=none
hi Search  guifg=#000000 guibg=#DCA000
hi illuminatedWord cterm=underline gui=underline
source ~/.config/nvim/fzf-settings.vim

" colors
source ~/.config/nvim/colors.vim
" source ~/.config/nvim/hypercolors.vim
" source ~/.config/nvim/nightflycolors.vim


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
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:svelte_indent_style = 1
let g:svelte_indent_script = 1
let g:svelte_preprocessors = ['typescript', 'postcss']
let g:svelte_preprocessor_tags = [
  \ { 'name': 'postcss', 'tag': 'style', 'as': 'scss' },
  \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' },
  \ ]

"prettier
" let g:prettier#autoformat = 0
" let g:prettier#config#config_precedence = 'file-override'
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.md,*.go Prettier
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" autocmd FileType typescript :call GoYCM()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')






:endif
