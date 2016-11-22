" vim: set ts=2 sw=4

" Use sh shell so that git works in the NerdTree buffer
set shell=sh

" Setup dein  ---------------------------------------------------------------{{{
if &compatible
	set nocompatible
endif

  set runtimepath+=/Users/willm/.config/nvim/repos/github.com/Shougo/dein.vim
  call dein#begin('/Users/willm/.config/nvim/')
  call dein#add('Shougo/dein.vim')

  " syntax
  call dein#add('sheerun/vim-polyglot')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('othree/yajs.vim', {'on_ft': 'javascript'})
  call dein#add('othree/jsdoc-syntax.vim', {'on_ft':['javascript', 'typescript']})
  call dein#add('othree/es.next.syntax.vim', {'on_ft': 'javascript'})
  call dein#add('lambdatoast/elm.vim')
  call dein#add('moll/vim-node')
  call dein#add('othree/javascript-libraries-syntax.vim')
  call dein#add('hail2u/vim-css3-syntax', {'on_ft':['css','scss']})
  call dein#add('elzr/vim-json', {'on_ft': 'json'})
  call dein#add('tpope/vim-markdown', {'on_ft': 'markdown'})
  call dein#add('jtratner/vim-flavored-markdown', {'on_ft': 'markdown'})
  call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
  call dein#add('HerringtonDarkholme/yats.vim')
  "
  " async stuff
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  "
  " colorschemes
  call dein#add('trusktr/seti.vim')
  call dein#add('mhartington/oceanic-next')
  call dein#add('vim-airline/vim-airline-themes')
  "
  " typescript stuff
  " call dein#add('HerringtonDarkholme/yats.vim')
  " call dein#add('mhartington/vim-typings')
  call dein#add('quramy/tsuquyomi')
  "
  " purescript stuff
  call dein#add('frigoeu/psc-ide-vim')
  "
  " system
  call dein#add('Shougo/denite.nvim') " faster unite plugin
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('ujihisa/unite-colorscheme')
  call dein#add('junkblocker/unite-codesearch')
  call dein#add('rafi/vim-unite-issue')
  call dein#add('mhartington/vim-folds') " folds for various languages
  call dein#add('Konfekt/FastFold') " Only updates folds when needed
  call dein#add('Yggdroot/indentLine') " shows line intents
  call dein#add('itmammoth/doorboy.vim') " autocloses brackets ([{}])
  call dein#add('valloric/MatchTagAlways', {'on_ft': ['html','javascript']}) " tag highglighting for html/jsx
  call dein#add('majutsushi/tagbar') " shows file outlines
  call dein#add('tpope/vim-fugitive') " Git commands
  call dein#add('tpope/vim-rhubarb') " Github commands
  call dein#add('jreybert/vimagit') " Git flow in vim
  call dein#add('airblade/vim-gitgutter') " Git markings in gutter
  call dein#add('tpope/vim-repeat') " Repeat plugin commands not just native
  call dein#add('facebook/vim-flow', {'autoload': {'filetypes': 'javascript'}}) " flow typing
  call dein#add('neomake/neomake') " Async commands for eslint/flow/etc
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('scrooloose/nerdtree') " Sidebar for file browsing
  call dein#add('Xuyuanp/nerdtree-git-plugin') " Git symbols for above
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('AndrewRadev/switch.vim') " Switches stuff = true -> false
  call dein#add('vim-airline/vim-airline') " Airline at the bottom
  call dein#add('tpope/vim-surround') " Surrounds true -> (true)
  call dein#add('tomtom/tcomment_vim') " comment lines, blocks
  call dein#add('mattn/emmet-vim', {'on_ft': 'html'}) " emmet completions
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('ap/vim-css-color') " Highlights colour references, hex, css names
  call dein#add('mhinz/vim-sayonara') " Closes buffers
  call dein#add('mattn/webapi-vim')
  call dein#add('mattn/gist-vim') " Posts current buffer to gist.github.com
  call dein#add('terryma/vim-multiple-cursors') " Multiple cursors are great
  call dein#add('junegunn/goyo.vim') " Distraction free coding, like iA writer
  call dein#add('itchyny/vim-cursorword') " Underlines the word under cursor
  call dein#add('rhysd/nyaovim-popup-tooltip') " Show images in a tooltip
  call dein#add('tyru/open-browser.vim') " Open in browser
  call dein#add('sbdchd/neoformat') " Allow formating
  call dein#add('Numkil/ag.nvim') " Allow ag searching
  "
  " deoplete stuff
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('steelsojka/deoplete-flow')
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('mhartington/deoplete-typescript')
  call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})
  call dein#add('Shougo/neoinclude.vim')
  "
  " Snippets
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('honza/vim-snippets')
  call dein#add('heavenshell/vim-jsdoc')
  "
  " final dein stuff
  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  call dein#end()
" }}}

" System Settings  ----------------------------------------------------------{{{
  " Neovim Settings
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  " let $NVIM_PYTHON_LOG_FILE="nvimpy.log"
  " let $NVIM_PYTHON_LOG_LEVEL='DEBUG'
  " set clipboard+=unnamedplus

 let g:switch_custom_definitions =
    \ [
    \ {
    \   'it.only': 'it',
    \   'it': 'it.only',
    \ }
    \ ]
  filetype plugin indent on
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
  autocmd BufWrite * :RemoveTrailingSpaces
" Remember cursor position between vim sessions
  autocmd BufReadPost *
              \ if line("'\"") > 0 && line ("'\"") <= line("$") |
              \   exe "normal! g'\"" |
              \ endif
" center buffer around cursor when opening files
  autocmd BufRead * normal zz
  let g:jsx_ext_required =1
  set complete=.,w,b,u,t,k
  let g:gitgutter_max_signs = 1000  " default value
  autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
  let g:indentLine_char='│'
  " enable deoplete
  let g:deoplete#enable_at_startup = 1

  " let g:deoplete#enable_debug = 1
  " let g:deoplete#enable_ignore_case = 1
  " let g:deoplete#auto_complete_start_length = 0
  " let g:auto_complete_start_length = 0
  " let g:deoplete#enable_refresh_always = 1
  " let g:deoplete#max_list = 1000
  " let g:deoplete#enable_profile = 1
  " call deoplete#enable_logging('DEBUG', 'tss.log')

  let g:go_fmt_command = "goimports"
  let g:table_mode_corner="|"

  " let g:vimfiler_as_default_explorer = 1
  " autocmd filetype vimfiler set nonumber norelativenumber
  let g:dein#install_progress_type = 'none'
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
  vnoremap <leader>d "_d
  "
  " Comment out line(s)
  vnoremap <c-/> :TComment<cr>
  "
  " Escape always removes search hightlight
  map <esc> :noh<cr>
  tmap <esc> <c-\><c-n><esc><cr>
  "
  " Hint typescript
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
  "
  " Something?
  nnoremap <leader>e :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
  "
  " If you prefer the Omni-Completion tip window to close when a selection is
  " made, these lines close it on movement in insert mode or when leaving
  " insert mode
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
  "
  " Highlight git changes
  nnoremap <leader>h :GitGutterLineHighlightsToggle<CR>
"}}}"

" Themes, Commands, etc  ----------------------------------------------------{{{
  syntax enable
  colorscheme OceanicNext
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
  "
  " Toggle tagbar
  nnoremap <leader>o :TagbarToggle<CR>
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
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
  "
  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.config/repos/github.com/Shougo/neosnippet-snippets/neosnippets'
  "
  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

"}}}

" Javscript omni complete --------------------------------------{{{
  " let g:tsuquyomi_disable_quickfix = 1
  autocmd FileType typescript setlocal completeopt+=preview
  nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
  let g:vim_json_syntax_conceal = 0
  set splitbelow
  set completeopt+=noselect
  " autocmd FileType typescript setlocal completeopt+=menu,preview
	" set completeopt-=menu,preview
  autocmd FileType vmailMessageList let b:deoplete_disable_auto_complete=1
  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=1
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
  call deoplete#custom#set('buffer', 'mark', 'buffer')
  call deoplete#custom#set('ternjs', 'mark', '')
  call deoplete#custom#set('omni', 'mark', 'omni')
  call deoplete#custom#set('file', 'mark', 'file')
  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni_patterns.html = ''
"}}}

" Emmet customization -------------------------------------------------------{{{
  " Enable Emmet in all modes
  " Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
  " try to determine if we're within quotes or tags.
  " if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
  " expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
  " return a regular tab character
  return "\<tab>"
  endfunction

  autocmd FileType html,markdown imap <buffer><expr><tab> <sid>expand_html_tab()
  let g:user_emmet_mode='a'
  let g:user_emmet_complete_tag = 0
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall
"}}}

" Unite ---------------------------------------------------------------------{{{
  let g:unite_data_directory='~/.nvim/.cache/unite'
  let g:unite_source_history_yank_enable=1
  let g:unite_prompt='❯ '
  let g:unite_source_rec_async_command =['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png', '--ignore', 'lib']
  " Search files by name
  nnoremap <silent> <c-p> :Unite -auto-resize -start-insert -direction=botright file_rec/neovim<CR>
  "
  " Change colorschemes
  nnoremap <silent> <leader>c :Unite -auto-resize -start-insert -direction=botright colorscheme<CR>
  "
  " Update plugins
  nnoremap <silent> <leader>u :call dein#update()<CR>
  "
  " Open outline pane in right
  " nnoremap <silent> <leader>o :Unite -winwidth=45 -vertical -direction=botright outline<CR>
  "
  nnoremap <leader>I :Unite -no-split -vertical -direction=topleft issue:github:driftyco/
  "
  " Custom mappings for the unite buffer
  autocmd FileType unite call s:unite_settings()
  "
  function! s:unite_settings() "{{{
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  endfunction "}}}
  "
  " Git from unite ------------------------------------------------{{{
  let g:unite_source_menu_menus = {} " Useful when building interfaces at appropriate places
  let g:unite_source_menu_menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let g:unite_source_menu_menus.git.command_candidates = [
    \[' git status', 'Gstatus'],
    \[' git diff', 'Gvdiff'],
    \[' git commit', 'Gcommit'],
    \[' git stage/add', 'Gwrite'],
    \[' git checkout', 'Gread'],
    \[' git rm', 'Gremove'],
    \[' git cd', 'Gcd'],
    \[' git push', 'exe "Git! push " input("remote/branch: ")'],
    \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
    \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
    \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
    \[' git fetch', 'Gfetch'],
    \[' git merge', 'Gmerge'],
    \[' git browse', 'Gbrowse'],
    \[' git head', 'Gedit HEAD^'],
    \[' git parent', 'edit %:h'],
    \[' git log commit buffers', 'Glog --'],
    \[' git log current file', 'Glog -- %'],
    \[' git log last n commits', 'exe "Glog -" input("num: ")'],
    \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
    \[' git log until date', 'exe "Glog --until=" input("day: ")'],
    \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
    \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
    \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
    \[' git mv', 'exe "Gmove " input("destination: ")'],
    \[' git grep',  'exe "Ggrep " input("string: ")'],
    \[' git prompt', 'exe "Git! " input("command: ")'],
    \] " Append ' --' after log to get commit info commit buffers
  nnoremap <silent> <Leader>g :Unite -direction=botright -silent -buffer-name=git -start-insert menu:git<CR>
  "}}}
"}}}

" vim-airline ---------------------------------------------------------------{{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_skip_empty_sections = 1
  set hidden
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline_theme='oceanicnext'
  let g:airline_powerline_fonts = 1
  cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
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

" Linting -------------------------------------------------------------------{{{
  function! StrTrim(txt)
    return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
  endfunction

  let g:neomake_javascript_enabled_makers = []

  let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
  let g:flow#enable = 0

  if findfile('.flowconfig', '.;') !=# ''
    let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
    let g:flow#enable = 1
    if g:flow_path != 'flow not found'
      let g:neomake_javascript_flow_maker = {
            \ 'exe': 'sh',
            \ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
            \ 'errorformat': '%E%f:%l:%c\,%n: %m',
            \ 'cwd': '%:p:h'
            \ }
      let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
    endif
  endif

  let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'eslint']
  function! neomake#makers#ft#javascript#eslint()
      return {
          \ 'args': ['-f', 'compact'],
          \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
          \ '%W%f: line %l\, col %c\, Warning - %m'
          \ }
  endfunction

  let g:neomake_purescript_syntax_maker = {
    \ 'exe': 'pulp',
    \ 'args': ['build --monochrome'],
    \ 'errorformat': '%A at %f line %l\, column %c %m'
    \ }
  let g:neomake_purescript_enabled_makers = ['syntax']

  function! TSCPWD()
    return ['--project', getcwd()]
  endfunction

  " let g:neomake_open_list = 2

  function! neomake#makers#ft#typescript#EnabledMakers() abort
      return ['tsc', 'tslint']
  endfunction

  function! neomake#makers#ft#typescript#tsc() abort
      " tsc should not be passed a single file.  Changing to the file's dir will
      " make it look upwards for a tsconfig.json file.
      return {
                  \ 'args': ['--noEmit'],
                  \ 'append_file': 0,
                  \ 'cwd': '%:p:h',
                  \ 'errorformat':
                  \ '%E%f %#(%l\,%c): error %m,' .
                  \ '%E%f %#(%l\,%c): %m,' .
                  \ '%Eerror %m,' .
                  \ '%C%\s%\+%m'
                  \ }
  endfunction

  function! neomake#makers#ft#typescript#tslint() abort
      return {
                  \ 'args': [
                  \ '%:p', '--format verbose'
                  \ ],
                  \ 'errorformat': '%f[%l\, %c]: %m'
                  \ }
  endfunction

  let g:neomake_markdown_alex_maker = {
    \ 'exe': 'alex',
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
  let g:neomake_markdown_enabled_makers = ['alex']

  autocmd! BufWritePost * Neomake
"}}}
"
" set colorscheme again
colorscheme OceanicNext
