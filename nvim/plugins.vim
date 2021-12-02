if has("nvim")
  call plug#begin('~/.config/nvim/plugged')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  call plug#begin('~/.config/nvim/plugged_vim')
  Plug 'tpope/vim-sensible'
endif

Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" programming
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'

" editing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
Plug 'szw/vim-smartclose', {'on': 'SmartClose'}

" navigating
Plug 'tpope/vim-vinegar'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/unite.vim'
Plug 'Shougo/junkfile.vim'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim interface
Plug 'morhetz/gruvbox'

" python
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}

" javascript
Plug 'tpope/vim-jdaddy', {'for': 'javascript'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'Valloric/YouCompleteMe', {'for': 'javascript'}

" misc
Plug 'sjl/vitality.vim'

" html
Plug 'gregsexton/matchtag'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake',    {'for': 'ruby'}
Plug 'tpope/vim-rails',   {'for': 'ruby'}
Plug 'tpope/vim-bundler', {'for': 'ruby'}
Plug 'tpope/vim-rbenv',   {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}
Plug 'kana/vim-textobj-user', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}

" clojure

Plug 'guns/vim-sexp',                              {'for': 'clojure'}
Plug 'tpope/vim-salve',                            {'for': 'clojure'}
Plug 'tpope/vim-fireplace',                        {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
Plug 'guns/vim-clojure-static',                    {'for': 'clojure'}
Plug 'guns/vim-clojure-highlight',                 {'for': 'clojure'}
Plug 'eraserhd/parinfer-rust',                     {'for': 'clojure', 'do': 'cargo build --release'}
" Plug 'Olical/conjure', {'tag': 'v4.3.1'}

" Plug 'tpope/vim-dispatch'
" Plug 'clojure-vim/vim-jack-in'
" Plug 'radenling/vim-dispatch-neovim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()
