" vim plugins sumarizes.

call plug#begin('~/.vim_plugins/plugged')
" Language
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'bronson/vim-trailing-whitespace'
Plug 'klen/python-mode'
Plug 'lervag/vimtex'

" markdown prereview setup
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown' " please take care for this plugin needs node.js and npm to support, @see details.
" guidance of details:
" 	git clone git://github.com/npm/npm.git
" 	cd npm
" 	make install
" 	sudo npm -g install instant-markdown-d
" 	then add vim-instant-markdown  plugin in this config

call plug#end()


" vim plugins configuration

" ### syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ### nerdtree
" this will open NERDTree automatically when vim starts up if no files were specified, say type vim . with local.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeShowHidden = 1 #NERD shortcut alt + i
map <F2> :NERDTreeToggle<CR>

" ### nerdcommenter
" guidance for the using:
" --------------------------------------------------
" 	5,cc	: comment 5 lines one by one
" 	5,cu	: uncomment 5 lines
" 	5,cm	: comment 5 lines one time
" 	,cA	: instert /* */ and enter insert mode
" ---------------------------------------------------
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ### nerdtree-git-plugin'
" vim script
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" ### tcomment


" ### vim-markdown
set shell=bash\ -i
" TODO...

" ### elzr/vim-json


" ### vim-trailing-whitespace'
Plug 'klen/python-mode'
Plug 'lervag/vimtex'

" ###
" ###
" ###
" ###
" ###
" ###
" ###
" ###
" ###
" ###
" ###
" ###