"########################################
" Author: Amber Wang
" Email: wbs.y829@gmail.com
"########################################

" []: 脚本
" (): 类型：插件、主题等
" {}: 依赖

" 通用设置
let g:mapleader = ';'

" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

" tab
set shiftwidth=4  ">> <<
set shiftround
set tabstop=4     "tab in file
set softtabstop=4 "tab inserted
set smarttab
set expandtab "[C+V]+[Tab] for true tab

" 缩进
set smartindent
set autoindent

" 高亮
syntax on

"set showmatch

" 行号
set number
set relativenumber

" 鼠标
set mouse=a

" 词典
"set keywordprg=sdcv
set keywordprg=K "K是一个自定义程序

" vim编码
set encoding=utf-8

" 退格键
set backspace=indent,eol,start

set wildmenu

set showcmd
set laststatus=2
" airline替代了状态行
"set ruler
"set showmode
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set shortmess=atI "status line short message for ...(use default)

" 代码折叠
set foldenable
set foldmethod=manual

"set cul
"set cuc
set scrolloff=3

" 用gtags插件，不需要cscope
"if has("cscope")
    "set csprg=/bin/cscope
    "set csto=0
    "set cst
    "set nocsverb
    "add any database in current directory
    "if filereadable('cscope.out')
        "cs add cscope.out
    "elseif $CSCOPE_DB != ''
        "cs add $CSCOPE_DB
    "endif
    "set csverb
"endif

" 键绑定
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

nmap <leader>Sh :%!xxd<CR>
nmap <leader>SH :%!xxd -r<CR>

nmap <leader>Sb :set binary<CR>:set noeol<CR>
nmap <leader>SB :set nobinary<CR>:set eol<CR>
"paste mode
set pastetoggle=<leader>sp

imap <leader>ji <><LEFT>
imap <leader>ao {}<LEFT><CR><ESC>O

vmap <leader>s y/<C-R>"<CR>

nmap <leader>gs :cs find s <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand('<cword>')<CR><CR>
nmap <leader>ge :cs find e <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand('<cfile>')<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand('<cfile>')<CR>$<CR>
nmap <leader>gd :cs find d <C-R>=expand('<cword>')<CR><CR>

" [vim-plug](plugin)
" 插件管理插件
call plug#begin('~/.vim/plugged')
" 主题
Plug 'tomasr/molokai' " sublime color scheme
" 通用
Plug 'mbbill/fencview' " file encode
Plug 'asins/vimcdoc' " vim Chinese documentations
Plug 'kien/rainbow_parentheses.vim' " color parentheses
Plug 'Raimondi/delimitMate' " auto complete parentheses
Plug 'vim-scripts/The-NERD-tree' " file explorer
Plug 'Lokaltog/vim-easymotion' " ehance cursor motion
Plug 'vim-airline/vim-airline' " ehance status line
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature' " ehance bookmark
Plug 'sjl/gundo.vim' " ehance undolist
Plug 'tpope/vim-obsession' " enhance mksession
Plug 'mileszs/ack.vim' " ehance grep
Plug 'kien/ctrlp.vim' " fuzzy search
Plug 'Shougo/unite.vim' " an extensible interface for searching and displaying lists
Plug 'szw/vim-ctrlspace' " 
Plug 'scrooloose/nerdcommenter' " comment and uncomment
Plug 'terryma/vim-multiple-cursors' " edit at multiple positions at the same time
Plug 'terryma/vim-expand-region' " expand a visual selection region
Plug 'vim-scripts/fcitx.vim' " auto switch fcitx state when leaving/re-entering insert mode
Plug 'Shougo/vimproc.vim', { 'do' : 'make' } " asynchronous execution library
"Plug 'Shougo/vimshell.vim' " a shell in vim
" 编程通用
Plug 'nathanaelkane/vim-indent-guides' " color indent 
Plug 'Valloric/YouCompleteMe' " auto-complete
Plug 'SirVer/ultisnips' " manage snippets
Plug 'honza/vim-snippets' " some code snippet templates
Plug 'scrooloose/syntastic' " syntax check
Plug 'majutsushi/tagbar' " tag list
Plug 'vim-scripts/TaskList.vim' " todo list
Plug 'junegunn/vim-easy-align' " aligh codes
Plug 'thinca/vim-quickrun' " execute codes
Plug 'dyng/ctrlsf.vim' " display search results with context
Plug 'thinca/vim-localrc' " load vim configuration at the local directory
" C
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] } " switch source and header
Plug 'aceofall/gtags.vim', { 'for': ['c', 'cpp'] } " gtags instead of cscope
" web
Plug 'tpope/vim-surround', { 'for': 'html' } " deal with pairs of surroundings like parentheses and html tags
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' } " for rust
" tmux
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' } " for tmux
" tex
Plug 'lervag/vimtex', { 'for': ['tex', 'bib', 'sty'] } " for tex
" man
"Plug 'jez/vim-superman'
call plug#end()
" [vim-plug]$

" [a.vim]
nmap <leader>a :A<CR>
" [a.vim]$

" [FencView](plugin)(file)
" [FencView]$

" [The-NERD-tree](plugin)(file)
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" 在只剩下该插件窗口的情况下关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" [The-NERD-tree]$

" [vimcdoc](doc)
" 帮助文档语言
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
"let g:ycm_show_diagnostics_ui = 0
" [YouCompleteMe]$

" [RainbowParentheses](plugin)(color)
" 给配对的括号着色
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" [RainbowParentheses]$

" [vim-indent-guide](plugin)(show)
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 1
" some configs in colorscheme
" [vim-indent-guide]$

" 配色方案
" [molokai](colorscheme)
" [solarized](colorscheme)
" molokai: sublime 配色方案
if &t_Co > 255
    colorscheme molokai
    autocmd VimEnter * :hi IndentGuidesOdd  guibg=grey10 ctermbg=233
    autocmd VimEnter * :hi IndentGuidesEven guibg=grey15 ctermbg=236
    let g:indent_guides_auto_colors = 0
else
    colorscheme default
end

" [ctrlp](plugin)(file)
let g:ctrlp_map = '<leader>f'
let g:ctrlp_match_window_reversed = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
" [ctrlp]$

" [vim-easymotion](plugin)(efficiency)
nmap <Leader><C-f> <Plug>(easymotion-overwin-f)
nmap <Leader><C-d> <Plug>(easymotion-overwin-f2)
nmap <Leader><C-l> <Plug>(easymotion-overwin-line)
nmap <Leader><C-w> <Plug>(easymotion-overwin-w)
" [vim-easymotion]$

" [nerdcommenter](plugin)(efficiency)
" [nerdcommenter]$

" [delimitMate](plugin)(efficiency)
" [delimitMate]$

" [vim-surround](plugin)(efficiency)
" [vim-surround]$

" [ultisnips](plugin)(efficiency)
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" [ultisnips]$

" [vim-snippets](plugin){ultisnips}
" [vim-snippets]$

" [vim-multiple-cursors](plugin)(efficiency)
" [vim-multiple-cursors]$

" [syntastic](plugin)(syntax)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++1z '
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_balloons = 1

nmap <leader>ss :SyntasticToggleMode<CR>
" [syntastic]$

" [vim-airline](plugin)(show)
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '☯'

let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

let g:airline#extensions#ycm#enabled = 1
" [vim-airline]$

" [vim-airline-theme](plugin){vim-airline}
let g:airline_theme='ravenpower'
" [vim-airline-theme]$

"[tagbar](plugin)
nmap <leader>tb :TagbarToggle<CR>
"[tagbar]$

"[TaskList](plugin)
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
"[vim-expand-region]$

"[ctrlsf](plugin)(efficiency)
nmap <leader>sf :CtrlSFToggle<CR>
nmap <leader>F <Plug>CtrlSFPrompt
vmap <leader>F <Plug>CtrlSFVwordExec
"[ctrlsf]$

"[gundo](plugin)
nmap <leader>su :GundoToggle<CR>
"[gundo]$

"[vim-ctrlspace](plugin)
nmap <leader><space> :CtrlSpace<CR>
set hidden
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
"[vim-ctrlspace]$

"[fcitx.vim](plugin)
set ttimeoutlen=10
"[fcitx.vim]$

"[vim-tmux](plugin)
"[vim-tmux]$

"[vim-obsession](plugin)
nmap <leader>So :Obsession<CR>
nmap <leader>SO :Obsession!<CR>
"[vim-obsession]$

"[gtags.vim](plugin)
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
"[gtags.vim]$

"[vim-ack]{plugin}
let g:ackprg = 'ag --vimgrep'
"[vim-ack]$

" [vim-localrc](plugin)(project)
" [vim-localrc]$
