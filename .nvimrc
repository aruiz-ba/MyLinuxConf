syntax on
set number
set mouse=a
set hlsearch
set ignorecase "ignore upper/lower case when searching
set rnu "set relative line numbers

"""""""""""""""""""""""""""""""""""""""""""""""
"Just mapping for shortcuts for nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
"Just mapping for shortcuts for fzf
"""""""""""""""""""""""""""""""""""""""""""""""
map <C-f> :Files .<CR>


""""""""""""""""""""""""""
"maping for terminal
""""""""""""""""""""""""""
cabbrev bterm bo term
map <C-t> :bterm<CR>
map <C-T> :hide<CR>
map <C-c> :!pdflatex ./*.tex<enter><enter>

""""""""""""""""""""""""""
"Bindings for templates
""""""""""""""""""""""""""
autocmd FileType tex inoremap ;s \section{}<Esc>i
autocmd FileType tex inoremap ;l <Esc> :-1read $HOME/.vim/.skeletonlist.tex<CR>jf}i
autocmd FileType tex inoremap ;i <Esc> :-1read $HOME/.vim/.skeletonimg.tex<CR>f}i
autocmd FileType c nnoremap ,main :-1read $HOME/.vim/.skeletonmain.c<CR>2jli
autocmd FileType c nnoremap ,m :term make<CR><CR><CR>
nnoremap ,tex :-1read $HOME/.vim/.skeletontex.tex<CR>4jf}i

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" set spell (this activates a syntax corrector)
"set spell spelllang=en,es (for more than a language)

"this saves the info when its closed like opened files
set viminfo='10,<100,:100,%,n~/.vim/.viminfo



if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'scrooloose/nerdtree'

"Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""""
"latex plugins
"""""""""""""""""""""""""""
"Plug 'conornewton/vim-latex-preview'

"""""""""""""""""""""""""""
"react plugins
"""""""""""""""""""""""""""
"Plug 'mxw/vim-jsx'
"Plug 'pangloss/vim-javascript'

"""""""""""""""""""""""""""
"colorschemes
"""""""""""""""""""""""""""
Plug 'srcery-colors/srcery-vim'
Plug 'Rigellute/rigel'
Plug 'savq/melange'
"""""""""""""""""""""""""""
"tools
"""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme rigel
