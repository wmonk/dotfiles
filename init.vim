set termguicolors
set sw=4
set ts=4
set expandtab
set hidden
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·,eol:⨼
set list!
set undofile
set undodir=~/.config/nvim/undodir
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
set mouse=a
set cmdheight=2
set updatetime=300
set shortmess+=c
set suffixesadd=.js,.jsx,.ts,.tsx
botright cwindow

" let g:loaded_python_provider = 1
" let g:python_host_prog='/usr/bin/python3'
let g:python3_host_prog='/usr/local/bin/python3'
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:3m"

let g:vim_monokai_tasty_italic = 1

hi SpellBad gui=undercurl guisp=red term=undercurl cterm=undercurl

call plug#begin('~/.local/share/nvim/plugged')

Plug 'keith/swift.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-abolish'
Plug 'w0rp/ale'
Plug 'szorfein/fromthehell.vim'
Plug 't9md/vim-quickhl'
Plug 'nightsense/stellarized'
Plug 'iloginow/vim-stylus'
Plug 'cormacrelf/vim-colors-github'
Plug 'AndrewRadev/switch.vim'
Plug 'airblade/vim-gitgutter'
Plug 'FooSoft/vim-argwrap'
" Plug 'SirVer/ultisnips'
Plug 'zooxyt/Ultisnips-rust'
Plug 'tomtom/tcomment_vim'
Plug 'mechatroner/rainbow_csv'
Plug 'rust-lang/rust.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'
Plug 'moll/vim-node'
Plug 'wmonk/vim-makegreen'
" Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'alexbyk/vim-ultisnips-js-testing'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'roxma/nvim-yarp'
Plug 'wmonk/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'bogado/file-line'
Plug 'Raimondi/delimitMate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'mbbill/undotree'

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

" set background=dark
" let g:gruvbox_contrast_dark="hard"
" colorscheme gruvbox

" more blocky diff markers in signcolumn (e.g. GitGutter)
let g:github_colors_soft = 1
let g:github_colors_block_diffmark = 1
set background=light
colorscheme github

noremap <silent> <C-l> <c-w>l
tnoremap <silent> <C-l> <C-\><C-n><c-w>l
noremap <silent> <C-h> <c-w>h
tnoremap <silent> <C-h> <C-\><C-n><c-w>h
noremap <silent> <C-k> <c-w>k
tnoremap <silent> <C-k> <C-\><C-n><c-w>k
noremap <silent> <C-j> <c-w>j

map <C-p> :GFiles<CR>
function! Rgerium()
  let params = input('Search files for: ')
  execute 'Rg ' . params
endfunction
map <Leader>i :call Rgerium()<CR>
vmap <Leader>i y:Rg <C-R>"<CR>
vmap " S"
vmap B SB
vmap b Sb
vmap ] S]
vmap [ S[
map <Leader>g :GFiles?<CR>
map <Leader>b :Buffers<CR>
map <Leader>l :Lines<CR>
map <C-\-> :FZF <c-r>=fnameescape(expand('%:p:h'))<cr>/<cr>
imap <c-x><c-f> <plug>(fzf-complete-path)
command! -bang -nargs=* Rg
  \ call fzf#vim#rg(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

nnoremap <Leader>j :cp<CR>
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>s :source ~/.config/nvim/test.vim<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_javascript = ['prettier']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

vnoremap  <Leader>y  "+y
nnoremap  <Leader>Y  "+yg_
nnoremap  <Leader>y  "+y
nnoremap  <Leader>yy  "+yy
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
 
" let g:test#javascript#jest#file_pattern = '\vtests?\.(js|jsx|coffee|ts|tsx)$'
" let g:test#javascript#jest#options = '--reporters jest-simple-reporter'
" noremap <Leader>t :TestFile -strategy=neomake<cr>
noremap <Leader>s *Nciw
noremap <Leader>r yiw:%s/<C-r>"/

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

nnoremap <silent> <Leader>a :ArgWrap<CR>

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

au BufNewFile,BufRead,BufReadPost Pipfile set ft=cfg
au BufNewFile,BufRead,BufReadPost .babelrc set ft=json

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
noremap <Leader>o :CocFzfList outline<cr>
noremap <Leader>d :CocFzfList diagnostics<cr>

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
autocmd BufEnter *.tsx set filetype=typescript.tsx

