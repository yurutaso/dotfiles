".vimrc

set nocompatible

"=============================================================
" NeoBundle
"=============================================================

set runtimepath+=~/.vim/bundle/neobundle.vim/

"required
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

"required
filetype plugin indent on

"任意
NeoBundleCheck

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'tpope/vim-surround'


"=============================================================
" MY SETTINGS
"=============================================================
"language
set encoding=utf-8
set fileencodings=ucs-bom,cp932,sjis,euc-jp,utf-8

" highlight 
if &t_Co > 2 || has("gui_running")
	set t_Co=256
  syntax on
  set hlsearch
endif
set background=dark
"colorscheme solarized
colorscheme hybrid

" show cursorline 
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=236
highlight CursorColumn term=none cterm=none ctermfg=none ctermbg=236
set cursorline
set cursorcolumn
set number

"fold
set foldcolumn=4
" indent
set smartindent
set autoindent
set nocindent

" backup
set noundofile
set noswapfile
"set nobackup

" tab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" window style
set showcmd
set cmdheight=2
set notitle
set ruler
set splitbelow
set splitright

" text style 
set nowrap
set showmatch

" key
set backspace=indent,eol,start
set history=50

" search, autocomplete
set incsearch
set ignorecase
set wildmenu
set wildmode=full

" mouse
set mouse=a
"-------------------------------------------------------------
" MAPPING
"-------------------------------------------------------------
" cursor move
nnoremap j gj
nnoremap k gk
" window size
nnoremap <silent> <S-Left> :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up> :5wincmd +<CR>
nnoremap <silent> <S-Down> :5wincmd -<CR>

" search
nnoremap g; g;zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <C-n> :noh<CR>
" Clang complete
nnoremap // I//
nnoremap ss A;
inoremap <C-s> A;

" input <Space> <Enter> in normal mode
nnoremap <Space> i<Space><ESC><Right>
nnoremap <Enter> i<CR><ESC>

" insert modeでのカーソル移動
"<C-j>はVimLatexの<++>移動と競合するため、 ~/.vim/plugin/imaps.vimの490行付近を<C-F>に変更
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
"括弧、クォートの補完
"もう少しうまいことやりたい
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap () ()
inoremap ( ()<Left>
inoremap {} {}
inoremap { {}<Left>
inoremap [] []
inoremap [ []<Left>
inoremap <> <><Left>
"inoremap <> <>
"inoremap < <><Left>
inoremap "" ""
inoremap " ""<Left>
inoremap '' ''
inoremap ' ''<Left>
inoremap `` ``
inoremap ` ``<Left>
inoremap __ ____<Left><Left>
"========================================
" Plugin
"========================================

"----------------------------------------
" Vim-LaTeX
"----------------------------------------

filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_CompileRule_ps = '/usr/texbin/dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_dvi = 'platex  --interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
let g:Tex_MakeIndexFlavor = '/usr/texbin/mendex -U $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_ViewRule_pdf = '/usr/bin/open -a Preview.app'

"-------------------------------------------------------------
" Unite
"-------------------------------------------------------------

" let g:unite_winwidth = 40


"-------------------------------------------------------------
" vimfiler
"-------------------------------------------------------------

" let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1

