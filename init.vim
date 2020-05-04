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

source ~/.config/nvim/colors.vim

call plug#begin('~/.local/share/nvim/plugged')

Plug 'wadackel/vim-dogrun'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hotoo/jsgf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml', 'html'] }

call plug#end()

command! -bang -nargs=*  All
  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --no-ignore-vcs --glob "!{*/node_modules/*,*/dist/*,.git/*,yarn.lock,*/.cache/*,*/.next/*,*/.DS_Store/*}"', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi --reverse' }))

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
inoremap jk <ESC>
noremap <silent> <c-p> :All<CR>
noremap <silent> <tab> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

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

"prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md Prettier

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" autocmd FileType typescript :call GoYCM()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript

"hide fzf status line
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

"colors
colorscheme dogrun
hi Normal  guibg=NONE ctermbg=NONE
hi Visual  guifg=NONE guibg=#FFFFFF gui=none
hi Search  cterm=NONE ctermfg=white ctermbg=darkblue
hi illuminatedWord cterm=underline gui=underline

