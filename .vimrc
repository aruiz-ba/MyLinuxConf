packadd! dracula
syntax on
colorscheme dracula
set number
set mouse=a
set hlsearch

"colorscheme afterglow
"colorscheme candy
"Just mapping for shortcuts for nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" this lets you make shortcuts and maps
" In this case if filetype is tex I can make it automatically look for the
" word map
"autocmd FileType tex inoremap <space><space> <Esc> /map <Enter>
" In this other example it will automatically make a section
autocmd FileType tex inoremap ;s \section{}<Esc>i


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set spell (this activates a syntax corrector)
"set spelllang=en,es (for more than a language)

"this saves the info when its closed like opened files
set viminfo='10,<100,:100,%,n~/.vim/.viminfo

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/vim-scripts/TeX-PDF.git'
"Plug 'danilo-augusto/vim-afterglow'
"Plug 'xuhdev/vim-latex-live-preview'
"Plug 'pangloss/vim-javascript'
"Plug 'sheerun/vim-polyglot'
call plug#end()
