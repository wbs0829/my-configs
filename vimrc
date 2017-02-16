"########################################
" Author: Boshi Wang
" Email: wbs.y829@gmail.com
"########################################

"==========general==========

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" tab
set shiftwidth=4  " >> <<
set shiftround
set tabstop=4     " tab in file
set softtabstop=4 " tab inserted
set smarttab
set expandtab " [C+V]+[Tab] for true tab

" indent
set smartindent
set autoindent

" highlight
syntax on

"set showmatch

" line number
set number
set relativenumber

" mouse
set mouse=a

" dictionary
"set keywordprg=sdcv
set keywordprg=K "K是一个自定义程序

" vim encoding
set encoding=utf-8

" backspace key
set backspace=indent,eol,start

" command line completion
set wildmenu

" status line
set showcmd
set laststatus=2
" airline plugin replaces status line, so following settings are unnecessary
"set ruler
"set showmode
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set shortmess=atI "status line short message for ...(use default)

" fold
set foldenable
set foldmethod=manual

" cursor
"set cul
"set cuc
set scrolloff=3

" cscope
" gtags replaces cscope, so following settings are unnecessary
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

"==========keymap==========

let g:mapleader = ';'

" buffer
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bd :bdelete<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bl :blast<CR>
nmap <leader>bs :buffers<CR>

" tab
nmap <leader>tt :tabnew<CR>
" gt
nmap <leader>tn :tabnext<CR>
" gT
nmap <leader>tp :tabprevious<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>tf :tabfirst<CR>
nmap <leader>tl :tablast<CR>
nmap <leader>ts :tabs<CR>

" yank and paste
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P

" close and write
nmap <leader>z :q<CR>
nmap <leader>Z :q!<CR>
nmap <leader>w :w<CR>
nmap <leader>W :w !sudo tee % > /dev/null<CR>
nmap <leader>Q :qa<CR>

" tricks
nmap <leader>/ :let @/=""<CR>
nmap <leader>. :<UP><CR>
nmap <leader>q <CTRL-w>z

" hex edit
nmap <leader>Sh :%!xxd<CR>
nmap <leader>SH :%!xxd -r<CR>

" binary
nmap <leader>Sb :set binary<CR>:set noeol<CR>
nmap <leader>SB :set nobinary<CR>:set eol<CR>

" paste mode
set pastetoggle=<leader>sp

imap <leader>ji <><LEFT>
imap <leader>ao {}<LEFT><CR><ESC>O

" search
vmap <leader>s y/<C-R>"<CR>

" cscope
nmap <leader>gs :cs find s <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand('<cword>')<CR><CR>
nmap <leader>ge :cs find e <C-R>=expand('<cword>')<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand('<cfile>')<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand('<cfile>')<CR>$<CR>
nmap <leader>gd :cs find d <C-R>=expand('<cword>')<CR><CR>

"==========script configuration==========
"
" [vim-plug]
" description: a plugin managing vim plugins
call plug#begin('~/.vim/plugged')
"-----color scheme-----
Plug 'tomasr/molokai' " sublime color scheme
"-----general-----
Plug 'mbbill/fencview' " file encode
Plug 'asins/vimcdoc' " vim Chinese documentations
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim' " color parentheses
Plug 'Raimondi/delimitMate' " auto complete parentheses
Plug 'vim-scripts/The-NERD-tree' " file explorer
Plug 'Lokaltog/vim-easymotion' " ehance cursor motion
Plug 'vim-airline/vim-airline' " ehance status line
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature' " ehance bookmark
Plug 'sjl/gundo.vim' " ehance undolist
Plug 'mbbill/undotree' " ehance undolist
Plug 'tpope/vim-obsession' " enhance mksession
Plug 'mileszs/ack.vim' " ehance grep
Plug 'kien/ctrlp.vim' " fuzzy search
Plug 'Shougo/unite.vim' " an extensible interface for searching and displaying lists
Plug 'szw/vim-ctrlspace'
Plug 'scrooloose/nerdcommenter' " comment and uncomment
Plug 'terryma/vim-multiple-cursors' " edit at multiple positions at the same time
Plug 'terryma/vim-expand-region' " expand a visual selection region
Plug 'vim-scripts/fcitx.vim' " auto switch fcitx state when leaving/entering insert mode
Plug 'Shougo/vimproc.vim', { 'do' : 'make' } " asynchronous execution library
"Plug 'Shougo/vimshell.vim' " a shell in vim
"-----for programming-----
Plug 'nathanaelkane/vim-indent-guides' " color indent
Plug 'Valloric/YouCompleteMe' " auto-complete
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } " ycm configuration generator
Plug 'SirVer/ultisnips' " manages snippets
Plug 'honza/vim-snippets' " some code snippet templates
Plug 'scrooloose/syntastic' " syntax check
Plug 'majutsushi/tagbar' " tag list
Plug 'vim-scripts/TaskList.vim' " todo list
Plug 'junegunn/vim-easy-align' " aligh codes
Plug 'thinca/vim-quickrun' " execute codes
Plug 'dyng/ctrlsf.vim' " display search results with context
Plug 'thinca/vim-localrc' " load vim configuration at the local directory
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'sheerun/vim-polyglot'
" C
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp'] } " switch source and header
Plug 'aceofall/gtags.vim', { 'for': ['c', 'cpp'] } " gtags instead of cscope
" web
Plug 'tpope/vim-surround', { 'for': 'html' } " deal with pairs of surroundings like html tags
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

" colorscheme
if &t_Co > 255
    colorscheme molokai
    " for the indent guide plugin
    autocmd VimEnter * :hi IndentGuidesOdd  guibg=grey10 ctermbg=233
    autocmd VimEnter * :hi IndentGuidesEven guibg=grey15 ctermbg=236
    let g:indent_guides_auto_colors = 0
else
    colorscheme default
end

" [a.vim]
nmap <leader>a :A<CR>
" [a.vim]$

" [FencView]
" [FencView]$

" [The-NERD-tree]
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" close vim when only nerdtree window exists
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" [The-NERD-tree]$

" [vimcdoc](doc)
set helplang=cn
" [vimcdoc]$

" [YouCompleteMe]
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_show_diagnostics_ui = 0

" for compatibility with ultisnips plugin
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" [YouCompleteMe]$

" [ycm-generator]
" [ycm-generator]$

" [RainbowParentheses]
autocmd VimEnter * RainbowParenthesesActivate
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" [RainbowParentheses]$

" [vim-indent-guide]
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 1
" some configs in colorscheme
" [vim-indent-guide]$

" [ctrlp]
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
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
" [ctrlp]$

" [vim-easymotion]
" default keymaps begin with <leader><leader>
nmap <Leader><C-f> <Plug>(easymotion-overwin-f)
nmap <Leader><C-d> <Plug>(easymotion-overwin-f2)
nmap <Leader><C-l> <Plug>(easymotion-overwin-line)
nmap <Leader><C-w> <Plug>(easymotion-overwin-w)
" [vim-easymotion]$

" [nerdcommenter]
" default keymaps begin with <leader>c
" [nerdcommenter]$

" [delimitMate]
" [delimitMate]$

" [vim-surround]
" default keymaps are so complex
" [vim-surround]$

" [ultisnips]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
" [ultisnips]$

" [vim-snippets]
" [vim-snippets]$

" [vim-multiple-cursors]
" default keymaps are <C-N> <C-P> <C-X> <Esc>
" [vim-multiple-cursors]$

" [syntastic]
nmap <leader>ss :SyntasticToggleMode<CR>
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
" [syntastic]$

" [vim-airline]
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert=1
let g:airline_left_sep=''
let g:airline_right_sep=''

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '☯'

let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

let g:airline#extensions#ycm#enabled = 1
" [vim-airline]$

" [vim-airline-theme]
let g:airline_theme='ravenpower'
" [vim-airline-theme]$

" [tagbar]
nmap <leader>tb :TagbarToggle<CR>
" [tagbar]$

" [TaskList]
nmap <leader>td <Plug>TaskList
" [TaskList]$

" [EasyAlign]
vmap <Enter> <Plug>(EasyAlign)
" [EasyAlign]$

" [vim-signature]
" default keymaps begin with m
" [vim-signature]$

" [vim-quickrun]
nmap <Leader>r <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config.cpp = {
            \ 'type': 'cpp/clang++',
            \ 'cmdopt': '-std=c++1z -I ~/include'
            \}
" [vim-quickrun]$

" [vim-expand-region]
" default keymaps + and _
" [vim-expand-region]$

" [ctrlsf]
nmap <leader>sf :CtrlSFToggle<CR>
nmap <leader>F <Plug>CtrlSFPrompt
vmap <leader>F <Plug>CtrlSFVwordExec
" [ctrlsf]$

" [gundo]
nmap <leader>su :GundoToggle<CR>
" [gundo]$

" [undotree]
nmap <leader>sU :UndotreeToggle<CR>
" [undotree]$

" [vim-ctrlspace]
nmap <leader><space> :CtrlSpace<CR>
set hidden
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
" [vim-ctrlspace]$

" [fcitx.vim]
set ttimeoutlen=10
" [fcitx.vim]$

" [vim-tmux]
" [vim-tmux]$

" [vim-obsession]
nmap <leader>So :Obsession<CR>
nmap <leader>SO :Obsession!<CR>
" [vim-obsession]$

" [gtags.vim]
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
" [gtags.vim]$

" [vim-ack]
let g:ackprg = 'ag --vimgrep'
" [vim-ack]$

" [vim-localrc]
" [vim-localrc]$
