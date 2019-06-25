if exists('veonim')
set sw=4
set ts=4
set expandtab

" built-in plugin manager
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'

set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

set guifont=Iosevka:h18

map <esc> :noh<cr>
tmap <esc> <c-\><c-n><esc><cr>

let mapleader = "\<Space>"
set relativenumber

imap <silent> jk <Esc>
nnoremap ; :
map <Leader>q :x<CR>
map <Leader>w :w<CR>

imap <D-v> <C-r><C-o>+
let g:javascript_plugin_flow = 1

" extensions for web dev
let g:vscode_extensions = [
  \'vscode.css-language-features',
  \'vscode.html-language-features',
  \'vscode.typescript-language-features',
  \'rust-lang.rust',
  \'flowtype.flow-for-vscode'
\]

" multiple nvim instances
nno <silent> <C-t>c :Veonim vim-create<cr>
nno <silent> <C-g> :Veonim vim-switch<cr>
nno <silent> <C-t>, :Veonim vim-rename<cr>
nno <silent> <C-t>t :Veonim vim-create-dir ~/Code/minifort/services<cr>
nno <silent> <C-s> :source ~/.config/nvim/init.vim<cr>

" workspace functions
nno <silent> <C-p> :Veonim files<cr>
nno <silent> <C-e> :Veonim explorer<cr>
nno <silent> <C-b> :Veonim buffers<cr>

" searching text
nno <silent> <Leader>i :Veonim grep<cr>
vno <silent> <Leader>i :Veonim grep-word<cr>
nno <silent> <Leader>l :Veonim buffer-search<cr>

" language features
" nno <silent> sr :Veonim rename<cr>
" nno <silent> sd :Veonim definition<cr>
" nno <silent> si :Veonim implementation<cr>
nno <silent> <Leader>d :Veonim definition<cr>
nno <silent> <Leader>T :Veonim hover<cr>
" nno <silent> sf :Veonim references<cr>
" nno <silent> sh :Veonim hover<cr>
" nno <silent> sl :Veonim symbols<cr>
" nno <silent> so :Veonim workspace-symbols<cr>
" nno <silent> sq :Veonim code-action<cr>
" nno <silent> sk :Veonim highlight<cr>
" nno <silent> sK :Veonim highlight-clear<cr>
" nno <silent> ,n :Veonim next-usage<cr>
" nno <silent> ,p :Veonim prev-usage<cr>
nno <silent> sp :Veonim show-problem<cr>
noremap <leader>f :Neoformat<CR>
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier']
finish
endif

set termguicolors
set sw=4
set ts=4
set expandtab
set hidden
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:⨼
set list!
set undodir=$HOME/.vim/undodir
set undolevels=1000
set undoreload=10000
set noswapfile
set noshowmode
filetype on
set virtualedit=
set wildmenu
set wildmode=full
set complete=.,w,b,u,t,k
set autoindent
set smartindent
set incsearch
set inccommand=split
set foldmethod=manual

let g:loaded_python_provider = 1
let g:python_host_prog='/usr/local/bin/python3'
let g:python3_host_prog='/usr/local/bin/python3'

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:3m"

let g:vim_monokai_tasty_italic = 1

hi SpellBad gui=undercurl guisp=red term=undercurl cterm=undercurl

call plug#begin('~/.local/share/nvim/plugged')

Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" Plug 'w0rp/ale'
Plug 'szorfein/fromthehell.vim'
Plug 't9md/vim-quickhl'
Plug 'nightsense/stellarized'
Plug 'iloginow/vim-stylus'
Plug 'cormacrelf/vim-colors-github'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'FooSoft/vim-argwrap'
Plug 'zooxyt/Ultisnips-rust'
Plug 'tomtom/tcomment_vim'
Plug 'rust-lang/rust.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'
Plug 'moll/vim-node'
Plug 'wmonk/vim-makegreen'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'alexbyk/vim-ultisnips-js-testing'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
   \ 'branch': 'next',
   \ 'do': 'bash install.sh',
   \ }
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'roxma/nvim-yarp'
Plug 'wmonk/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'bogado/file-line'
Plug 'Raimondi/delimitMate'

call plug#end()

let mapleader = "\<Space>"

set relativenumber
nnoremap ; :

imap jk <Esc>:w<CR>
imap jk <Esc>

map <Leader>q :x<CR>
map <Leader>w :w<CR>

map <esc> :noh<cr>
tmap <esc> <c-\><c-n><esc><cr>

set background=dark
let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox

noremap <silent> <C-l> <c-w>l
tnoremap <silent> <C-l> <C-\><C-n><c-w>l
noremap <silent> <C-h> <c-w>h
tnoremap <silent> <C-h> <C-\><C-n><c-w>h
noremap <silent> <C-k> <c-w>k
tnoremap <silent> <C-k> <C-\><C-n><c-w>k
noremap <silent> <C-j> <c-w>j

map <C-p> :GFiles<CR>
function! Agerium()
  let params = input('Search files for: ')
  execute 'Ag ' . params
endfunction
map <Leader>i :call Agerium()<CR>
vmap <Leader>i y:Ag <C-R>"<CR>
map <Leader>g :GFiles?<CR>
map <Leader>b :Buffers<CR>
map <Leader>l :Lines<CR>
map <C-\-> :FZF <c-r>=fnameescape(expand('%:p:h'))<cr>/<cr>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang Dir
  \ call fzf#run(fzf#wrap('my-stuff', {'dir': '~/Code/minifort/services'}, <bang>0))

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

    " \ 'javascript': ['javascript-typescript-stdio', '-l', '~/Code/tmp/ll'],
    " \ 'javascript.jsx': ['javascript-typescript-stdio', '-l', '~/Code/tmp/ll'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['python', '-m', 'pyls', '-vv'],
    \ 'javascript': ['flow', 'lsp', '--from', './node_modules/.bin'],
    \ 'javascript.jsx': ['flow', 'lsp', '--from', './node_modules/.bin'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'reason': ['/Users/will/Downloads/reason-language-server/reason-language-server.exe']
    \ }
let g:LanguageClient_autoStart = 1

nnoremap <silent> <Leader>T :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>D :vsplit<CR><C-W>l:call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <Leader>R :call LanguageClient_textDocument_references()<CR>

nnoremap <Leader>j :cp<CR>
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>s :source ~/.config/nvim/test.vim<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

let g:UltiSnipsSnippetDiretories=["~/.config/nvim/plugged/"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

noremap <leader>f :Neoformat<CR>
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier']
" let g:formatdef_js_prettier= '"prettier --stdin --single-quote --no-semi --no-bracket-spacing --tab-width 4"'
" let g:formatters_javascript = ['js_prettier']
"
" let g:formatdef_elm_format = '"elm-format --stdin"'
" let g:formatters_elm = ['elm_format']

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
 
let g:test#javascript#jest#file_pattern = '\vtests?\.(js|jsx|coffee)$'
let g:test#javascript#jest#options = '--reporters jest-simple-reporter'
noremap <Leader>t :TestFile -strategy=neomake<cr>
noremap <Leader>s *Nciw

function s:Bar(type, msg)
  if a:type == "red"
    echohl RedBar
  else
    echohl GreenBar
  endif
  echon a:msg repeat(" ", &columns - strlen(a:msg) - 1)
  echohl None
endfunction

function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code != 0
    call s:Bar("red", "There was an error")
  else
    call s:Bar("green", "All good")
  endif
endfunction
augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
augroup END

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

nnoremap <silent> <leader>a :ArgWrap<CR>

autocmd FileType rust let b:switch_custom_definitions =
      \ [
      \   {
      \     '&\(.\+\)':        '\1'
      \   }
      \ ]


highlight ExtraWhitespace guisp=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" ncm2
autocmd BufEnter  *  call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

au BufNewFile,BufRead,BufReadPost Pipfile set ft=cfg
au BufNewFile,BufRead,BufReadPost .babelrc set ft=json

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
