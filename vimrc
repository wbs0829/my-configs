"########################################
" File: .vimrc
" Author: Amber Wang
" Version: 2.0
" Email: wbs.y829@gmail.com
" Date: 2016-09-20
"########################################

" []: script
" (): type
" {}: dependence

" plugin configures
let s:vim_manager='vundle'

if filereadable("/etc/arch-release")
    let s:manager='pacman'
else
    let s:manager=s:vim_manager
endif

let s:manager_info={
\   'pacman': {
\       'method': 'shell',
\       'template': 'pacman -Qi _package_'
\   },
\   'vundle': {
\       'method': 'vim',
\       'template': 'Bundle "_package_"'
\   }
\}

let s:plugin_info={
\   'vundle': {
\       'vundle': 'gmarik/vundle',
\       'pacman': ['vundle', 'vundle-git']
\   },
\   'a': {
\       'vundle': 'a.vim',
\       'pacman': ['vim-a']
\   },
\   'fencview': {
\       'vundle': 'mbbill/fencview'
\   },
\   'nerdtree': {
\       'vundle': 'vim-scripts/The-NERD-tree',
\       'pacman': ['vim-nerdtree']
\   },
\   'vimcdoc': {
\       'vundle': 'asins/vimcdoc'
\   },
\   'YouCompleteMe': {
\       'vundle': 'Valloric/YouCompleteMe',
\       'pacman': ['vim-youcompleteme-core-git', 'vim-youcompleteme-git']
\   },
\   'rainbow_parentheses': {
\       'vundle': 'kien/rainbow_parentheses.vim'
\   },
\   'molokai': {
\       'vundle': 'tomasr/molokai',
\       'pacman': ['vim-molokai', 'vim-molokai-git']
\   },
\   'ctrlp': {
\       'vundle': 'kien/ctrlp.vim',
\       'pacman': ['vim-ctrlp']
\   },
\   'indent-guides': {
\       'vundle': 'nathanaelkane/vim-indent-guides',
\       'pacman': ['vim-indent-guides']
\   },
\   'easymotion': {
\       'vundle': 'Lokaltog/vim-easymotion',
\       'pacman': ['vim-easymotion', 'vim-easymotion-git']
\   },
\   'nerdcommenter': {
\       'vundle': 'scrooloose/nerdcommenter',
\       'pacman': ['vim-nerdcommenter']
\   },
\   'delimitMate': {
\       'vundle': 'Raimondi/delimitMate',
\       'pacman': ['vim-delimitmate']
\   },
\   'surround': {
\       'vundle': 'tpope/vim-surround',
\       'pacman': ['vim-surround']
\   },
\   'ultisnips': {
\       'vundle': 'SirVer/ultisnips',
\       'pacman': ['vim-ultisnips']
\   },
\   'multiple-cursors': {
\       'vundle': 'terryma/vim-multiple-cursors'
\   },
\   'syntastic': {
\       'vundle': 'scrooloose/syntastic',
\       'pacman': ['vim-syntastic', 'vim-syntastic-git', 'vim-syntastic-sync-git']
\   },
\   'airline': {
\       'vundle': 'bling/vim-airline',
\       'pacman': ['vim-airline', 'vim-airline-git']
\   },
\   'tagbar': {
\       'vundle': 'majutsushi/tagbar',
\       'pacman': ['vim-tagbar']
\   },
\   'tasklist': {
\       'vundle': 'vim-scripts/TaskList.vim',
\       'pacman': ['vim-taglist']
\   },
\   'easy-align': {
\       'vundle': 'junegunn/vim-easy-align'
\   },
\   'signature': {
\       'vundle': 'kshenoy/vim-signature'
\   },
\   'quickrun': {
\       'vundle': 'thinca/vim-quickrun'
\   },
\   'expand-region': {
\       'vundle': 'terryma/vim-expand-region'
\   },
\   'ctrlsf': {
\       'vundle': 'dyng/ctrlsf.vim'
\   },
\   'gundo': {
\       'vundle': 'sjl/gundo.vim',
\       'pacman': ['vim-gundo']
\   },
\   'ctrlspace': {
\       'vundle': 'szw/vim-ctrlspace'
\   },
\   'rust': {
\       'vundle': 'rust-lang/rust.vim',
\       'pacman': ['vim-rust-git']
\   },
\   'racer': {
\       'vundle': 'phildawes/racer'
\   },
\   'fcitx': {
\       'vundle': 'vim-scripts/fcitx.vim',
\       'pacman': ['vim-fcitx']
\   },
\   'tmux': {
\       'vundle': 'tmux-plugins/vim-tmux'
\   },
\   'obsession': {
\       'vundle': 'tpope/vim-obsession'
\   },
\   'gtags': {
\       'vundle': 'aceofall/gtags.vim'
\   },
\   'localrc': {
\       'vundle': 'thinca/vim-localrc'
\   }
\}

" global setting
let g:mapleader = ';'

" search
set hlsearch
set incsearch
set ignorecase
" tab
set shiftwidth=4  ">> <<
set shiftround
set tabstop=4     "tab in file
set softtabstop=4 "tab inserted
set smarttab
set expandtab "[C+V]+[Tab] for true tab

" hl
syntax on
set smartindent
set autoindent
set showmatch

" line number
set number
set relativenumber
"autocmd InsertEnter * :set norelativenumber number
"autocmd InsertLeave * :set nonumber relativenumber

" mouse
set mouse=a

" dict
"set keywordprg=sdcv
set keywordprg=K "K is a custom wrapper of sdcv with colors

" file encoding
set encoding=utf-8

set backspace=indent,eol,start

" status line
set wildmenu
set showcmd "It seems that this option is available only by masual setting
nmap <leader>sc :set showcmd<CR>
set laststatus=2
if !has_key(s:plugin_info, 'airline')
    set ruler
    set showmode
    set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
    set shortmess=atI "status line short message for ...(use default)
endif

" fold
set foldenable
set foldmethod=manual

"set cul
"set cuc
set scrolloff=3

" keymap
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

nmap <leader>sh :%!xxd<CR>
nmap <leader>sH :%!xxd -r<CR>

nmap <leader>sb :set binary<CR>:set noeol<CR>
nmap <leader>sB :set nobinary<CR>:set eol<CR>
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

if !has_key(s:plugin_info, 'gtags')
    if has("cscope")
        set csprg=/bin/cscope
        set csto=0
        set cst
        set nocsverb
        add any database in current directory
        if filereadable('cscope.out')
            cs add cscope.out
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
    endif
endif

function! s:get_manager(plug)
    let l:plug_info=s:plugin_info[a:plug]
    if has_key(l:plug_info, s:manager)
        if s:manager_info[s:manager].method=='shell'
            for pkg in l:plug_info[s:manager]
                let cmd=substitute(s:manager_info[s:manager].template, '\<_package_\>', pkg, '')
                call system(cmd)
                if !v:shell_error
                    break
                endif
            endfor
            if !v:shell_error
                return s:manager
            endif
        endif
    endif
    return s:vim_manager
endfunction

" [Vundle](plugin)
" 插件管理插件
" 插件设置应在此之后
set nocompatible              " be iMproved
filetype off                  " required!
if s:get_manager('vundle')=='vundle'
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" 让vundle管理未被系统包管理器管理的插件
for plug in keys(s:plugin_info)
    let mgr=s:get_manager(plug)
    if s:manager_info[mgr].method=='vim'
        let cmd=substitute(s:manager_info[mgr].template, '\<_package_\>', s:plugin_info[plug][mgr], '')
        execute(cmd)
    endif
endfor

filetype plugin indent on     " required!

" [Vundle]$

" [a.vim](plugin)(efficiency)(file)
" 快速对应的.h和.c文件
nmap <leader>a :A<CR>
" [a.vim]$

" [FencView](plugin)(file)
" 文件编码设置
" [FencView]$

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
"let g:ycm_show_diagnostics_ui = 0
" [YouCompleteMe]$

" [RainbowParentheses](plugin)(color)
" 给配对的括号着色
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" [RainbowParentheses]$

" 配色方案
" [molokai](colorscheme)
" [solarized](colorscheme)
" molokai: sublime 配色方案
if &t_Co > 255
	colorscheme molokai
else
	colorscheme default
end

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
let g:UltiSnipsSnippetsDir=["~/.vim/ultisnips"]
" [ultisnips]$

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
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
""whether to show balloons
let g:syntastic_enable_balloons = 1

nmap <leader>ss :SyntasticToggleMode<CR>
" [syntastic]$

"[vim-airline](plugin)(show)
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline_detect_iminsert=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
"let g:airline_theme='murmur'
"[vim-airline]$

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
nmap <leader>sf :CtrlSFToggle
nmap <leader>F <Plug>CtrlSFPrompt
vmap <leader>F <Plug>CtrlSFVwordExec
"[ctrlsf]$

"[gundo](plugin)
nmap <leader>su :GundoToggle<CR>
"[gundo]$

"[vim-ctrlspace](plugin)
nmap <leader><space> :CtrlSpace<CR>
set hidden
"[vim-ctrlspace]$

"[racer](plugin)(efficiency)(autocomplete)
set hidden
let g:racer_cmd = "~/.vim/bundle/racer/target/release/racer"
let $RUST_SRC_PATH="~/code/rust/rust/src"
"[racer]$

"[fcitx.vim](plugin)
set ttimeoutlen=10
"[fcitx.vim]$

"[vim-tmux](plugin)
"[vim-tmux]$

"[vim-obsession](plugin)
" vim-airline support TODO
"[vim-obsession]$

"[gtags.vim](plugin)
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
"[gtags.vim]$

let s:specific_config = $PWD . '/.specific.vim'
if filereadable(s:specific_config)
    exec "source ". s:specific_config
endif
