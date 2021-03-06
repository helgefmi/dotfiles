set shell=/bin/zsh
let mapleader="\<Space>"
set nocompatible

call plug#begin(stdpath('data') . '/plugged')
    " CocInstall coc-python coc-tsserver coc-eslint coc-json coc-css coc-vetur coc-rls coc-html coc-ccls
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'morhetz/gruvbox'

    Plug 'scrooloose/nerdcommenter'

    Plug 'scrooloose/nerdtree'

    Plug 'terryma/vim-multiple-cursors'

    Plug 'andymass/vim-matchup'

    Plug 'kana/vim-altr'

    " custom language support
    Plug 'posva/vim-vue'
    Plug 'cespare/vim-toml'
    Plug 'stephpy/vim-yaml'
    Plug 'rust-lang/rust.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'plasticboy/vim-markdown'
call plug#end()

nmap <leader>a <Plug>(altr-forward)

" format rust code on save
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" give more space for displaying messages.
set cmdheight=2

" having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" don't pass messages to |ins-completion-menu|.
set shortmess+=c

" always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" wrapping options
set textwidth=120
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" permanent undo
set undodir=~/.vimdid
set undofile

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use ctrl+k and ctrl+j to navigate diagnostics
nmap <C-k> <Plug>(coc-diagnostic-prev)
nmap <C-j> <Plug>(coc-diagnostic-next)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" so nvim works in any venv
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

set encoding=utf8
set splitbelow
set splitright

set listchars=nbsp:¬,extends:»,precedes:«,trail:•

noremap <F5> :source ~/.config/nvim/init.vim<CR>

" more python friendly nerdcomments
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" insert one character at given position
nmap <Space> i <Esc>r

" my preferred way of managing buffers
nmap <A-1> :tabprevious<CR>
nmap <A-2> :tabnext<CR>
nmap ,t :tabnew<CR>

" clear highlights after a searh
nnoremap <silent> <C-L> :nohls<CR>

" toggle line numbers
noremap <C-N><C-N> :set invnumber<CR>

" go back to the last position in the file after opening it
 :au BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

" not sure if this one is needed
let g:html_indent_tags = 'li\|p'

augroup neovim_terminal
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermOpen * :set nonumber norelativenumber
augroup END

tnoremap <Esc> <C-\><C-n>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" coc stuff
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <silent> <leader>gs :<C-u>CocList -I -N --top symbols<CR>

" nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" toggle paste mode
nnoremap <leader>1 :set nopaste<CR>
nnoremap <leader>2 :set paste<CR>

" disable annoying :help binding
map <F1> <Esc>
imap <F1> <Esc>

" copy/paste between my X clipboard and vim
noremap <leader>pp :read !xsel --clipboard --output<CR>
noremap <leader>pc :w !xsel -ib<CR><CR>

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation("float")<CR>
nnoremap <silent> L :call <SID>show_documentation("preview")<CR>
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation(arg)
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call coc#config("coc.preferences.hoverTarget", a:arg)
    call CocAction('doHover')
  endif
endfunction

" I hate waiting
set timeoutlen=500
set ttimeoutlen=50

" highlight trailing whitespaces
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkyellow guibg=darkyellow
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" clear trailing whitespaces
noremap <leader>ww :%s/\s\+$//g<CR>

" https://github.com/neoclide/coc-rls/issues/6
autocmd FileType rust let b:coc_root_patterns = ['Cargo.toml', '.git']

au BufNewFile,BufRead *.es6 set filetype=javascript

let g:coc_disable_startup_warning = 1

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
