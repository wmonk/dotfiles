" vim:ts=2:sw=2

" Use sh shell so that git works in the NerdTree buffer
set shell=sh

" Setup plugins ------------------------------------------------------------{{{
  if &compatible
    set nocompatible
  endif

  call plug#begin('~/.vim/plugged')
  "
  " typescript stuff
  Plug 'quramy/tsuquyomi'
  "
  " syntax
  Plug 'Shougo/vimproc.vim', {'build' : 'make'}
  Plug 'leafgarland/typescript-vim'
  Plug 'w0rp/ale'
  Plug 'flowtype/vim-flow'
  Plug 'ElmCast/elm-vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'plasticboy/vim-markdown'
  "
  " colorschemes
  Plug 'effkay/argonaut.vim'
  Plug 'philpl/vim-adventurous'
  Plug 'mhartington/oceanic-next'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ianks/vim-tsx'
  
  " system
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-fugitive'
  Plug 'Yggdroot/indentLine' " shows line intents
  Plug 'valloric/MatchTagAlways', {'on_ft': ['html','javascript']} " tag highglighting for html/jsx
  Plug 'airblade/vim-gitgutter' " Git markings in gutter
  Plug 'tpope/vim-repeat' " Repeat plugin commands not just native
  Plug 'editorconfig/editorconfig-vim'
  Plug 'scrooloose/nerdtree' " Sidebar for file browsing
  Plug 'Xuyuanp/nerdtree-git-plugin' " Git symbols for above
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'vim-airline/vim-airline' " Airline at the bottom
  Plug 'tpope/vim-surround' " Surrounds true -> (true)
  Plug 'tomtom/tcomment_vim' " comment lines, blocks
  Plug 'Chiel92/vim-autoformat'
  Plug 'terryma/vim-multiple-cursors' " Multiple cursors are great
  Plug 'itchyny/vim-cursorword' " Underlines the word under cursor
  Plug 'sbdchd/neoformat' " Allow formating
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "
  " fzf
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  "
  " snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'heavenshell/vim-jsdoc'
  "
  call plug#end()
" }}}

" System Settings  ----------------------------------------------------------{{{
  " Neovim Settings
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  filetype plugin indent on
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" Let airline tell me my status
  set noshowmode
  set noswapfile
  filetype on
  set relativenumber number
  set tabstop=4 shiftwidth=4 expandtab
  set conceallevel=0
" block select not limited by shortest line
  set virtualedit=
  set wildmenu
  set laststatus=2
  set colorcolumn=100
  set wrap linebreak nolist
  set wildmode=full
  set undofile
  set undodir="$HOME/.VIM_UNDO_FILES"
  set complete=.,w,b,u,t,k
  let g:gitgutter_max_signs = 1000  " default value
  let g:indentLine_char='│'
" }}}

" System mappings  ----------------------------------------------------------{{{
  let mapleader = "\<Space>" " I like space as my leader
  "
  " Quick way of saving a file
  map <Leader>q :x<CR>
  map <Leader>w :w<CR>
  "
  " Make it so that a curly brace automatically inserts an indented line
  inoremap {<CR> {<CR>}<Esc>O<BS><Tab>
  "
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
  map <left> <nop>
  map <right> <nop>
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
  noremap  <silent> k gk
  noremap  <silent> j gj
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
  vnoremap leader>d "_d
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

" Tsuquyomi -----------------------------------------------------------------{{{
  "
  " Hint typescript
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
  "
  " Got to definition
  map <Leader>d <Plug>(TsuquyomiDefinition)
  "
  " Use single quotes for imports
  " let g:tsuquyomi_single_quote_import=1
  " let g:tsuquyomi_disable_quickfix = 1
  autocmd FileType typescript setlocal completeopt+=preview
  nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
" }}}

" Themes, Commands, etc  ----------------------------------------------------{{{
  syntax enable
  colorscheme adventurous
  "
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "
  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
   set termguicolors
  endif
  "
  " enable italics, disabled by default
  let g:oceanic_next_terminal_italic = 1
  "
  " enable bold, disabled by default
  let g:oceanic_next_terminal_bold = 1
  "
  set background=dark
"}}}

" Fold, gets it's own section  ----------------------------------------------{{{
  function! MyFoldText() " {{{
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
  endfunction " }}}

  set foldtext=MyFoldText()

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

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99
  autocmd FileType css,scss,json setlocal foldmethod=marker
  autocmd FileType css,scss,json setlocal foldmarker={,}

  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  autocmd FileType javascript,typescript,json setl foldmethod=syntax
" }}}

" NERDTree ------------------------------------------------------------------{{{
  "
  " Auto open nerdtree if no file opened
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | FZF | endif
  map - :NERDTreeToggle<CR> " Toggle nerdtree
  map <C-\> :NERDTreeFind<CR> " Open current file in nerdtree
  autocmd StdinReadPre * let s:std_in=1
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  let g:NERDTreeAutoDeleteBuffer=1
  "
  " Git markings for nerdtree
  let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
  "
  " Highlight filetypes in nerdtree
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
  let g:NERDTreeExtensionHighlightColor['tsx'] = '44788E' " sets the color of css files to blue
"}}}

" Snipppets -----------------------------------------------------------------{{{
  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#expand_word_boundary = 1
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets'

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

"}}}

" Javscript omni complete ---------------------------------------------------{{{
  set splitbelow
  set completeopt+=noselect
  let g:deoplete#enable_at_startup = 1
  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=1
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
"}}}

" vim-airline ---------------------------------------------------------------{{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_skip_empty_sections = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline_theme='oceanicnext'
  let g:airline_powerline_fonts = 1
  tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
  nmap <leader>, :bnext<CR>
  tmap <leader>, <C-\><C-n>:bnext<cr>
  nmap <leader>. :bprevious<CR>
  tmap <leader>. <C-\><C-n>:bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
  tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
  tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
  tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
  tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
  tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
  tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
  tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
  tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
"}}}

" fzf ---------------------------------------------------------------------- {{{
  map <C-P> :GFiles<CR>
  function! Agerium()
    let params = input('Search files for: ')
    execute 'Ag ' . params
  endfunction
  map <Leader>i :call Agerium()<CR>
  map <Leader>g :GFiles?<CR>
  map <Leader>b :Buffers<CR>

" }}}

" ale -----------------------------------------------------------------------{{{
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

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

function InsertIfEmpty()
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

" set colorscheme again
colorscheme adventurous


