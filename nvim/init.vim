" ========== Vim Basic Settings ============="
source ~/.config/nvim/plugins.vim

set modelines=0

set noswapfile
noremap H ^
noremap L $
vnoremap L g_

set encoding=utf-8

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set showmode
set showcmd
set hidden
set visualbell

set ttyfast

set re=1
set synmaxcol=300
set nocursorcolumn
set nocursorline

set norelativenumber

set undofile
set lazyredraw
set matchtime=3

"Settings for Searching and Moving
set ignorecase
set smartcase
set showmatch
set hlsearch

" Make Vim to handle long lines nicely.
set wrap
set textwidth=99
set colorcolumn=88

set completeopt=menu,noinsert,noselect

" To  show special characters in Vim
set listchars=tab:▸\ ,eol:¬

" enable folding
set foldmethod=indent
set foldlevel=99

" Set title to window
set title

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Wildmenu completion "
"
set wildmode=full
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.beam
set wildignore+=build
set wildignore+=static
set wildignore+=tmp
set wildignore+=**/node_modules/**
set wildignore+=*.class
set wildignore+=.stack-work
set wildignore+=**/bower_components/**

set path+=**

set dir=~/.nvimtmp
set undodir=~/.nvimtmp

set suffixesadd+=.html
set suffixesadd+=.vim
set suffixesadd+=.py
set suffixesadd+=.rs
set suffixesadd+=.hs
set suffixesadd+=.md
set suffixesadd+=.txt
set suffixesadd+=.todo
set suffixesadd+=.rb

" Removing scrollbars
if has("gui_running")
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  set guifont=Fira\ Code:h12
endif


" Colorschema
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'dark'
colorscheme gruvbox

syntax sync minlines=256
highlight clear VertSplit

" make vim to autoresize its windows after resize
augroup file_operation
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Make Sure that Vim returns to the same line when we reopen a file"
function! FindLatestPosition()
  if &ft =~ 'gitcommit'
    return
  endif
  if line("'\"") > 0 && line("'\"") <= line("$") |
    execute 'normal! g`"zvzz' |
  endif
endfunction
augroup line_return
  autocmd!
  autocmd BufReadPost * call FindLatestPosition()
augroup END

augroup programming_au
  autocmd!
  autocmd FileType ruby,vim,jade,stylus setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript,lua setlocal ts=2 sts=2 sw=2
  autocmd FileType html,htmldjango setlocal nowrap ts=2 sts=2 sw=2
  autocmd FileType snippet,snippets setlocalocal noexpandtab
  autocmd BufEnter *.rss,*.atom,*.odrl setf xml
  autocmd BufEnter *.pkb,*.pks,*.tpb,*.tps,*.prc set ft=plsql
  autocmd BufEnter plsql setlocal ts=2 sts=2 sw=2
  autocmd BufEnter volofile setf javascript
  " autocmd FileType python set ft=python.django " For SnipMate
  autocmd FileType html set ft=htmldjango " For SnipMate
  autocmd FileType dart setl sw=2 sts=2 et
  autocmd FileType blade setl sw=2 sts=2 et
augroup END

let g:netrw_liststyle=3

" ========== Plugin Settings =========="

" neomake syntax checker settings
let g:neomake_open_list = 2
augroup neomake_au
  autocmd!
  autocmd BufWritePost *.hs Neomake
  autocmd BufWritePost *.py Neomake
  autocmd BufWritePost *.rs Neomake
  autocmd BufWritePost *.go Neomake
  autocmd BufWritePost *.vim Neomake
  autocmd BufWritePost *.rb Neomake
augroup END

call neomake#configure#automake('nrwi', 500)
let g:neomake_clojure_enabled_makers = ['kondo']
let g:neomake_kondo_maker = {
      \ 'exe': 'clj-kondo',
      \ 'args': ['--lint'],
      \ 'errorformat': '%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m'
      \ }

let g:clojure_align_subforms = 1

" snipmate trigger key modified because conflicts with youcompleteme
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" unite
let s:cache_dir = '~/.nvimtmp/cache'
function! s:get_cache_dir(suffix)
  return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1,
      \ 'short_source_names': 1,
      \ 'direction': 'botright',
      \ 'prompt': '> ',
      \ 'cursor_line_highlight': 'TabLine',
      \ 'winheight': 10,
      \ })

let g:unite_data_directory=s:get_cache_dir('unite')
let g:unite_source_history_yank_enable=1

let g:junkfile#directory=s:get_cache_dir('junk')

" jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0

augroup omni
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,htmldjango,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
augroup END

" smartclose
let g:smartclose_set_default_mapping = 0

" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

if has("nvim")
  let g:python3_host_skip_check=1
  let g:python3_host_prog =$HOME . '/.virtualenvs/neovim3/bin/python' 

  set clipboard+=unnamedplus

  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  let g:jedi#auto_initialization = 0
  let g:jedi#completions_enabled = 0
  let g:deoplete#enable_at_startup = 1
else
  let g:jedi#auto_initialization = 1
  let g:jedi#popup_on_dot = 0

  set clipboard+=unnamed
  set mouse=a

  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:fzf_command_prefix = 'FF'
let g:fzf_layout = { 'down': '~20%' }
set number
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'clojure': ['bash', '-c', '/usr/local/bin/clojure-lsp'],
    \ }

" Don't send a stop signal to the server when exiting vim.
" This is optional, but I don't like having to restart Solargraph
" every time I restart vim.
let g:LanguageClient_autoStop = 0

let g:ale_linters = {
\  'javascript': ['prettier'],
\  'clojure': ['clj-kondo'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" External keybindings
if filereadable(glob("~/.config/nvim/keybindings.vim"))
  source ~/.config/nvim/keybindings.vim
endif
