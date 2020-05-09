call plug#begin(stdpath('data') . '/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " :CocInstall coc-python coc-tsserver coc-eslint coc-json coc-css coc-vetur coc-rls

    Plug 'posva/vim-vue'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'lifepillar/vim-gruvbox8'

    Plug 'scrooloose/nerdcommenter'

    Plug 'scrooloose/nerdtree'

    Plug 'terryma/vim-multiple-cursors'
call plug#end()

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" So nvim works in any venv
let g:python3_host_prog = '/usr/bin/python3'

let g:airline_theme="distinguished"

filetype plugin indent on

syntax on
syntax sync fromstart

set regexpengine=1
set ruler
set number
set showcmd
set laststatus=0
set display=lastline,uhex
set scrolloff=3
set lazyredraw
set hlsearch
set showmatch
set matchtime=2
set report=0
set nomore

vnoremap < <gv
vnoremap > >gv

set incsearch
set backspace=indent,eol,start
set wildmenu
set wildignore+=.out,.o

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

au FileType javascript setl sw=2 sw=2 sts=2 et
au FileType vue setl sw=2 sw=2 sts=2 et

set shiftround
set autoindent
set smartindent

:set encoding=utf8
:set splitbelow
:set splitright

nmap <Space> i <Esc>r

nmap <A-1> :tabprevious<CR>
nmap <A-2> :tabnext<CR>
nmap ,t :tabnew<CR>

nnoremap <silent> <C-L> :nohls<CR>

noremap <C-N><C-N> :set invnumber<CR>

noremap <F1> :set nopaste<CR>
noremap <F2> :set paste<CR>
noremap <F5> :source ~/.config/nvim/init.vim<CR>

:highlight ExtraWhitespace ctermbg=red guibg=red
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/
:autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

let g:html_indent_tags = 'li\|p'

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

augroup neovim_terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * :set nonumber norelativenumber
augroup END

:tnoremap <Esc> <C-\><C-n>

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let mapleader="\<Space>"

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>gs :<C-u>CocList -I -N --top symbols<CR>

nnoremap <leader>n :NERDTreeToggle<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

colorscheme gruvbox8_hard

set timeoutlen=1000
set ttimeoutlen=50
