"########################################
" File: .vimrc
" Author: Amber Wang
" Version: 1.0
" Email: wbs.y829@gmail.com
" Date: 2013-12-25
"########################################

" []: script
" (): type
" {}: dependence
" 基本设置
let g:mapleader = ';'

"search
set hlsearch
set incsearch
set ignorecase
"tab
set shiftwidth=4  ">> <<
set shiftround
set tabstop=4     "tab in file
set softtabstop=4 "tab inserted
set smarttab
set expandtab "[C+V]+[Tab] for true tab

"hl
syntax on
set smartindent
set autoindent
set showmatch

"line number
set number
set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set nonumber relativenumber

"mouse
set mouse=a

"dict
"set keywordprg=sdcv
set keywordprg=K "K is a custom wrapper of sdcv with colors

"file encoding
set encoding=utf-8

set backspace=indent,eol,start

"status line
set wildmenu
set showcmd "It seems that this option is available only by masual setting
nmap <leader>sc :set showcmd<CR>
set ruler
set showmode
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2
"set shortmmess=atI "status line short message for ...(use default)
" for powerline
"set rtp+=$HOME/.local/lib/python3.4/site-packages/powerline/bindings/vim/

"fold
set foldenable
set foldmethod=manual

"set cul
"set cuc
set scrolloff=3

nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bl :blast<CR>
nmap <leader>bs :buffers<CR>

"tabnext gt
nmap <leader>tt :tabnew<CR>
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>tf :tabfirst<CR>
nmap <leader>tl :tablast<CR>
nmap <leader>ts :tabs<CR>

nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P

nmap <leader>z :q<CR>
nmap <leader>Z :q!<CR>
nmap <leader>w :w<CR>
nmap <leader>W :w !sudo tee % > /dev/null<CR>
nmap <leader>Q :qa<CR>

nmap <leader>/ :let @/=""<CR>
nmap <leader>. :<UP><CR>
nmap <leader>q <CTRL-w>z

imap <leader>ji <><LEFT>
imap <leader>ao {}<LEFT><CR><ESC>O

nmap <leader>h :%!xxd<CR>
nmap <leader>H :%!xxd -r<CR>

"paste mode
set pastetoggle=<leader>p "only for insert mode

"cscope
if has("cscope")
  set csprg=/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif

nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>

" [Vundle](plugin)
" 插件管理插件
" 插件设置应在此之后
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'a.vim'
Bundle 'mbbill/fencview'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'asins/vimcdoc'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tomasr/molokai'
Bundle 'kien/ctrlp.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'kshenoy/vim-signature'
Bundle 'thinca/vim-quickrun'
Bundle 'terryma/vim-expand-region'
Bundle 'dyng/ctrlsf.vim'
Bundle 'sjl/gundo.vim'
Bundle 'szw/vim-ctrlspace'
Bundle 'rust-lang/rust.vim'
Bundle 'phildawes/racer'
Bundle "vim-scripts/fcitx.vim"
Bundle "tmux-plugins/vim-tmux"

filetype plugin indent on     " required!

" [Vundle]$

" [a.vim](plugin)(efficiency)(file)
" 快速对应的.h和.c文件
nmap <leader>a :A<CR>
" [a.vim]$

" [FencView](plugin)(file)
" 文件编码设置
" [FencView]$
" [AutoFenc](plugin)(file)
" 文件编码设置
" [AutoFenc]$

" [The-NERD-tree](plugin)(file)
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" [The-NERD-tree]$

" [vimcdoc](doc)
" set help document language
set helplang=cn
" [vimcdoc]$

" [YouCompleteMe](plugin)(complete)
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"与ultisnips不冲突
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" [YouCompleteMe]$

" [RainbowParentheses](plugin)(color)
" 给配对的括号着色
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" [RainbowParentheses]$

" [molokai](colorscheme)
" sublime 配色方案
if &t_Co > 255
	colorscheme molokai
else
	colorscheme default
end
" [molokai]$

" [ctrlp](plugin)(file)
let g:ctrlp_map = '<leader>f'
let g:ctrlp_match_window_reversed = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_open_multiple_files = 'v'
" [ctrlp]$

" [vim-indent-guide](plugin)(show)
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

let g:indent_guides_auto_colors = 1
" (color) for {molokai}
"autocmd VimEnter * :hi IndentGuidesOdd  guibg=grey10 ctermbg=233
"autocmd VimEnter * :hi IndentGuidesEven guibg=grey15 ctermbg=234
" [vim-indent-guide]$

" [vim-easymotion](plugin)(efficiency)
"let g:EasyMotion_leader_key = '<Leader>'
" [vim-easymotion]$

" [nerdcommenter](plugin)(efficiency)
" [nerdcommenter]$

" [delimitMate](plugin)(efficiency)
" [delimitMate]$

" [vim-surround](plugin)(efficiency)
"let g:surround_no_mappingsg = 1
"Normal mode
"-----------
"ds  - delete a surrounding
"cs  - change a surrounding
"ys  - add a surrounding
"yS  - add a surrounding and place the surrounded text on a new line + indent it
"yss - add a surrounding to the whole line
"ySs - add a surrounding to the whole line, place it on a new line + indent it
"ySS - same as ySs
"
"Visual mode
"-----------
"S   - in visual mode, add a surrounding
"gS   - in visual mode, add a surrounding but place text on new line + indent it

"Insert mode
"-----------
"<CTRL-s> - in insert mode, add a surrounding
"<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
"<CTRL-g>s - same as <CTRL-s>
"<CTRL-g>S - same as <CTRL-s><CTRL-s>
" [vim-surround]$

" [ultisnips](plugin)(efficiency)
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","bundle/ultisnips/UltiSnips"]
" [ultisnips]$

" [vim-multiple-cursors](plugin)(efficiency)
"let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
" [vim-multiple-cursors]$

" [syntastic](plugin)(syntax)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++1z '
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
""whether to show balloons
let g:syntastic_enable_balloons = 1
" [syntastic]$

"[vim-airline](plugin)(show)
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline_theme='murmur'
"[vim-airline]$

"[tagbar](plugin)
nmap <leader>tb :TagbarToggle<CR>
"[tagbar]$

"[TaskList](plugin)
" TODO
nmap <leader>td <Plug>TaskList
"[TaskList]$

"[EasyAlign](plugin)(efficiency)
vmap <Enter> <Plug>(EasyAlign)
"[EasyAlign]$

"[vim-signature](plugin)(move)
"[vim-signature]$

"[vim-quickrun](plugin)(efficiency)
nmap <Leader>r <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config.cpp = {
            \ 'type': 'cpp/clang++',
            \ 'cmdopt': '-std=c++1z -I ~/include'
            \}
"[vim-quickrun]$

"[vim-expand-region](plugin)(efficiency)
nmap <leader>k <Plug>(expand_region_expand)
nmap <leader>j <Plug>(expand_region_shrink)
"[vim-expand-region]$

"[ctrlsf](plugin)(efficiency)
nmap <leader>sf :CtrlSF<CR>
"[ctrlsf]$

"[gundo](plugin)
nmap <leader>u :GundoToggle<CR>
"[gundo]$

"[vim-ctrlspace](plugin)
nmap <leader><space> :CtrlSpace<CR>
set hidden
"[vim-ctrlspace]$

"[racer](plugin)(efficiency)(autocomplete)
set hidden
let g:racer_cmd = "/home/amber/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="/home/amber/code/rust/rust/src"
"[racer]$

"[fcitx.vim](plugin)
set ttimeoutlen=10
"[fcitx.vim]$

"[vim-tmux](plugin)
"[vim-tmux]$
