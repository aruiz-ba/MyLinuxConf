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


" Bindings to autocomplete
autocmd FileType tex inoremap ;s \section{}<Esc>i
autocmd FileType tex inoremap ;l <Esc> :-1read $HOME/.vim/.skeletonlist.tex<CR>jf}i
autocmd FileType tex inoremap ;i <Esc> :-1read $HOME/.vim/.skeletonimg.tex<CR>f}i
autocmd FileType c nnoremap ,main :-1read $HOME/.vim/.skeletonmain.c<CR>2jli
nnoremap ,tex :-1read $HOME/.vim/.skeletontex.tex<CR>4jf}i


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
call plug#end()
