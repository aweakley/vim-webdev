" For Pathogen <https://github.com/tpope/vim-pathogen> to load plugins
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" We don't care about vi compatibility.
set nocompatible

" Always show the status line (current buffer path is nice to have)
set laststatus=2

" We want to be able to backspace over anything and everything
set backspace=indent,eol,start  " more powerful backspacing

" Turn syntax-highlight on
syntax enable

" Nice colorscheme that doesn't break your eyes or your brain
" colorscheme mustang
set background=dark
colorscheme solarized

" Show matching brackets
set showmatch

" Show cursor position at all times
set ruler

" Make search case-insensitive unless an uppercase letter is added
set ignorecase smartcase

" Set terminal colour output
set t_Co=256

" Python-friendly settings
" http://stackoverflow.com/questions/1562336/tab-vs-space-preferences-in-vim
autocmd BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
 \ cinwords=if,elif,else,for,while,try,except,def,class,self

" HTML and JS friendly settings
autocmd BufRead *.html set ts=4 sw=4
autocmd BufRead *.js set ts=4 sts=4 sw=4 et

" For Javascript editing on the fly
nmap ,js :set ts=4 sts=4 sw=4 et syntax=javascript<CR><Esc>

" Documentation
" - ReStructured Text (Python/Django for Sphinx docs)
au FileType rst set ts=2 sts=2 sw=2 et syntax=rst

" Python autocomplete
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NERDTree
nmap <Leader>N :NERDTreeToggle<CR><Esc>

" gundo - visual undo tree
nmap <Leader>G :GundoToggle<CR><Esc>

" show search matches as-you-type
set incsearch
set hlsearch

" centre the screen to the currently highlighted search term
nmap n nzz
nmap N Nzz

" clear current search term
map <silent> <C-N> :let @/=""<CR>

" reselect visual block after indent/outdent
" http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" when vsp'litting open to the right of current buffer
set splitright
set splitbelow

" Set temp write directory for fugitive's temp files
set directory=,~/tmp,$TMP

" Show partial command sequence in status bar
set showcmd

" Disable Ex mode. Dvorak has its quirks 8-)
map Q <Nop>

" Quick show/hide line number
nmap <Leader>num :set number<CR><Esc>
nmap <Leader>nonum :set nonumber<CR><Esc>

" Quick paste mode
nmap <Leader>ps :set paste<CR><Esc>i
nmap <Leader>nops :set nopaste<CR><Esc>

" Set scroll bind for vimdiff or side-by-side editing
nmap <Leader>sb :set scrollbind<CR><C-w><C-w>:set scrollbind<CR><Esc>
nmap <Leader>nosb :set noscrollbind<CR><Esc>

nmap <Leader>js :set syntax=javascript<CR><Esc>

nnoremap <Leader>pa :let @+=expand("%:p")<CR>

nnoremap <Leader>here :cd %:p:h<CR>:pwd<CR>

" Optionally highlight >80 chars
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

nnoremap <Leader>sv :source ~/.vimrc<CR><Esc>

" Source .vimrc automatically once written
autocmd! bufwritepost ~/.vimrc source %

" Ok, pathogen has loaded everything so restore file settings
syntax on
filetype on
filetype plugin on

" pyflakes validation
let g:pyflakes_use_quickfix = 0

" PEP8 validation
let g:pep8_map = '<Leader>8'

" MacVim options
if has("gui_running")
    set guioptions=egmht
    set guifont=Monaco:h14
    set antialias
endif

set autoindent
