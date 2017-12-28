" vim:ts=2:sw=2

" Use sh shell so that git works in the NerdTree buffer
set shell=sh
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:⨼
set list!
set ts=4
set sw=4
set expandtab
set hidden
set undodir=$HOME/.vim/undodir
set undolevels=1000
set undoreload=10000

" Setup plugins {{{
call plug#begin('~/.vim/plugged')
"
"
" syntax
Plug 'flowtype/vim-flow'
Plug 'ElmCast/elm-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'wavded/vim-stylus'
Plug 'moll/vim-node'
Plug 'neoclide/vim-jsx-improve'
Plug 'othree/yajs.vim'
" Plug 'mxw/vim-jsx'
" Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'dag/vim-fish'
Plug 'chr4/nginx.vim'
Plug 'rust-lang/rust.vim'
"
" colorschemes
Plug 'morhetz/gruvbox'
"
" system
Plug 'mbbill/undotree'
Plug 'tpope/vim-projectionist'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'valloric/MatchTagAlways', {'on_ft': ['html','javascript']} " tag highglighting for html/jsx
Plug 'airblade/vim-gitgutter' " Git markings in gutter
Plug 'tpope/vim-repeat' " Repeat plugin commands not just native
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
" Plug 'scrooloose/nerdtree' " Sidebar for file browsing
" Plug 'Xuyuanp/nerdtree-git-plugin' " Git symbols for above
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround' " Surrounds true -> (true)
Plug 'tomtom/tcomment_vim' " comment lines, blocks
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors' " Multiple cursors are great
Plug 'itchyny/vim-cursorword' " Underlines the word under cursor
Plug 'Valloric/YouCompleteMe'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
Plug 'jiangmiao/auto-pairs'
Plug 'kshenoy/vim-signature'
" Plug 'alvan/vim-closetag'
Plug 'chrisbra/Colorizer' " Highlight hex colors
Plug 'majutsushi/tagbar'
Plug 'janko-m/vim-test'
Plug 'blueyed/vim-diminactive'
Plug 't9md/vim-quickhl'
"
" fzf
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
"
" snippets
Plug 'epilande/vim-es2015-snippets'
" Plug 'epilande/vim-react-snippets'
Plug 'alexbyk/vim-ultisnips-js-testing'
Plug 'wmonk/vim-react-snippets'
Plug 'SirVer/ultisnips'

"
call plug#end()
" }}}

" System Settings {{{
filetype plugin indent on
set noshowmode
set noswapfile
filetype on
set number
"set wrap linebreak nolist
set virtualedit=
set wildmenu
set laststatus=2
set wildmode=full
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
set undolevels=1000
set undoreload=10000
set complete=.,w,b,u,t,k
let g:gitgutter_max_signs = 1000  " default value
" Keep undo history across sessions by storing it in a file
let vimDir="~/.vim"
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
" }}}

" System mappings {{{
let mapleader = "\<Space>" " I like space as my leader
"
" Quick way of saving a file
map <Leader>q :x<CR>
map <Leader>w :w<CR>
"
"
" Quickly exit insert mode and save
imap jk <Esc>:w<CR>
" Quickly exit insert mode
imap jk <Esc>
"
" Copy Paste
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
map / <Plug>(easymotion-sn)
"
" Disable arrow keys!
map <up> <nop>
map <down> <nop>

"
" Quick switching between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"
" No need for ex mode
nnoremap Q <nop>
"
" Navigate between display lines
" noremap  <silent> k gk
" noremap  <silent> j gj
"
" copy current files path to clipboard
nmap cp :let @+ = expand("%") <cr>
"
" ,f to format code, requires formatters: read the docs
noremap <leader>f :Autoformat<CR>
"
" Stop having to use shift to get into command mode
nnoremap ; :
"
" what is this?
inoremap <c-f> <c-x><c-f>
"
" what are these?
vnoremap y myy`y
vnoremap Y myY`y
"
" Multiple cursor key bindings
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
" let g:multi_cursor_prev_key='<C-p>'
"
" When using location list, back fourth between lines
nmap <Leader>n :lnext<CR>      " next error/warning
nmap <Leader>p :lprev<CR>      " previous error/warning
"
" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv
"
" Delete and stay in prev position
nnoremap <leader>d "_d
vnoremap <leader>d "_d
"
" Comment out line(s)
vnoremap <c-/> :TComment<cr>
"
" Escape always removes search hightlight
map <esc> :noh<cr>
tmap <esc> <c-\><c-n><esc><cr>
"
" Highlight git changes
nnoremap <leader>h :GitGutterLineHighlightsToggle<CR>
"}}}"

" Flow {{{
"
" Hint flow
autocmd FileType javascript nmap <buffer> <Leader>T : FlowType<CR>
let g:flow#autoclose = 1
"
" Got to definition
autocmd FileType javascript map <Leader>d : FlowJumpToDef<CR>
" }}}

" Themes, Commands, etc {{{
syntax enable
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
"
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif
"
set background=dark
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ALEErrorSign ctermbg=red guibg=red ctermfg=white
highlight ALEWarningSign ctermbg=58 guibg=#5f5f00 ctermfg=white
"}}}

" Fold, gets it's own section {{{
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif

autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
set foldlevel=99
" Space to toggle folds.
nnoremap <space><space> za
vnoremap <space><space> za
autocmd FileType vim,typescript,javascript setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType html setlocal fdl=99

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=999
autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType html setl foldmethod=expr
autocmd FileType html setl foldexpr=HTMLFolds()

autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}

" NERDTree {{{
"
" Auto open nerdtree if no file opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | FZF | endif
" map - :NERDTreeToggle<CR> " Toggle nerdtree
" map <C-x> :NERDTreeFind<CR> " Open current file in nerdtree
" autocmd StdinReadPre * let s:std_in=1
" let NERDTreeShowHidden=1
" let g:NERDTreeWinSize=45
" let g:NERDTreeAutoDeleteBuffer=1
" "
" " Git markings for nerdtree
" let g:NERDTreeIndicatorMapCustom = {
"       \ "Modified"  : "✹",
"       \ "Staged"    : "✚",
"       \ "Untracked" : "✭",
"       \ "Renamed"   : "➜",
"       \ "Unmerged"  : "═",
"       \ "Deleted"   : "✖",
"       \ "Dirty"     : "✗",
"       \ "Clean"     : "✔︎",
"       \ "Unknown"   : "?"
"       \ }
" "
" " Highlight filetypes in nerdtree
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExtensionHighlightColor['tsx'] = '44788E' " sets the color of css files to blue
"}}}

" Snipppets {{{
" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#expand_word_boundary = 1
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
" }}}

" Javascript omni complete {{{
set splitbelow
set completeopt+=noselect
" let g:deoplete#enable_at_startup = 1
" function! Multiple_cursors_before()
"   let b:deoplete_disable_auto_complete=1
" endfunction
" function! Multiple_cursors_after()
"   let b:deoplete_disable_auto_complete=0
" endfunction
"}}}

" buftabline {{{
let g:buftabline_numbers=2
let g:buftabline_indicators=1
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)
highlight BufTabLineHidden guifg=lightgray
highlight BufTabLineActive guifg=white guibg=#738C8C
highlight BufTabLineCurrent guifg=black guibg=lightblue
highlight BufTabLineModified guifg=black guibg=#FC5255
" }}}

" fzf {{{
map <C-A> :FZF<CR>
map <C-p> :GFiles<CR>
function! Agerium()
  let params = input('Search files for: ')
  execute 'Ag ' . params
endfunction
map <Leader>i :call Agerium()<CR>
map <Leader>g :GFiles?<CR>
map <Leader>b :Buffers<CR>
" }}}

" ale {{{
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '●'
let g:ale_lint_on_enter = 0
" }}}

" hilighterr {{{
nmap <Leader>m <Plug>(quickhl-manual-this)
nmap <Leader>h <Plug>(quickhl-manual-this-whole-word)
nmap <Leader>c <Plug>(quickhl-manual-clear)
nmap <Leader>M <Plug>(quickhl-manual-reset)
" }}}
"
" Allows you to visually select a section and then hit @ to run a macro on all lines
" https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.3dcn9prw6
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" Executes a macro for each line in visual selection
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

function! InsertIfEmpty()
  if @% == ""
    " No filename for current buffer
    FZF
  elseif filereadable(@%) == 0
    " File doesn't exist yet
    startinsert
  elseif line('$') == 1 && col('$') == 1
    " File is empty
    startinsert
  endif
endfunction

au VimEnter * call InsertIfEmpty()

let g:formatdef_js_prettier= '"prettier --stdin --single-quote --no-semi --no-bracket-spacing --tab-width 4"'
let g:formatters_javascript = ['js_prettier']

let g:formatdef_elm_format = '"elm-format --stdin"'
let g:formatters_elm = ['elm_format']

let g:tsuquyomi_single_quote_import=1

noremap <Leader><Leader>p <C-R>"
let g:gruvbox_contrast_dark = "hard"

let g:ale_linters = { 'elixir': [], 'rust': ['rustc'] }

function! FormatJSON(...)
  execute "%! node -e 'process.stdin.on(\"data\", data => console.log(JSON.stringify(eval(`data = ${data.toString()}`), null, 4)))"
endfunction

nmap fj :<C-U>call FormatJSON(v:count)<CR>

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

autocmd BufRead,BufNewFile *.js set suffixesadd+=.jsx,.js

set mouse=a

map <left> :bp<CR>
map <right> :bn<CR>

noremap <silent> <C-l> <c-w>l
tnoremap <silent> <C-l> <C-\><C-n><c-w>l
noremap <silent> <C-h> <c-w>h
tnoremap <silent> <C-h> <C-\><C-n><c-w>h
noremap <silent> <C-k> <c-w>k
tnoremap <silent> <C-k> <C-\><C-n><c-w>k
noremap <silent> <C-j> <c-w>j

tnoremap <silent> <Esc> <C-\><C-n>
autocmd BufWinEnter,WinEnter term://* startinsert

nmap <Leader>d :YcmCompleter GoTo<CR>
autocmd Filetype json let g:indentLine_setConceal = 0
let g:ycm_key_list_select_completion = ['DOWN']

let g:ale_fixers = {
      \   'javascript': [
      \       'prettier',
      \   ],
      \}

let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
let g:ycm_rust_src_path = '/Users/will/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:tagbar_type_rust = {
      \ 'ctagstype' : 'rust',
      \ 'kinds' : [
      \'T:types, type definitions',
      \'f:functions, function definitions',
      \'g:enum, enumeration names',
      \'s:structure names',
      \'m:modules, module names',
      \'c:consts, static constants',
      \'t:traits',
      \'i:impls, trait implementations'
      \]
      \}

nmap <C-w>z :tabedit %<CR>

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ }

" \ 'javascript.jsx': ['javascript-typescript-stdio'],
" \ 'javascript': ['javascript-typescript-stdio'],

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Leader-r> :call LanguageClient_textDocument_rename()<CR>

let g:test#javascript#jest#file_pattern = '\vtests?\.(js|jsx|coffee)$'

noremap <Leader>t :TestFile -strategy=neovim<cr>
noremap <Leader>s *Nciw

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename'
      \ },
      \ }
function! LightLineFilename()
  return expand('%:F')
endfunction

let g:tmux_navigator_disable_when_zoomed = 1

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<': '>'}
" let g:flow#flowpath = '/usr/local/bin/flow'
