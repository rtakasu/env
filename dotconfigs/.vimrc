set nocompatible             " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')
Plugin 'w0rp/ale'
Plugin 'shime/vim-livedown'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'preservim/nerdcommenter'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'elzr/vim-json'
Plugin 'prettier/vim-prettier'
Plugin 'cespare/vim-toml'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'racer-rust/vim-racer'
Plugin 'rust-lang/rust.vim'
Plugin 'rust-lang/rls'
"Plugin 'Shougo/deoplete.nvim'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'

Plugin 'ryanolsonx/vim-lsp-python'
"Plugin 'mattn/vim-lsp-settings'
"Plugin 'lighttiger2505/deoplete-vim-lsp'

"Plugin 'ycm-core/YouCompleteMe'

"Plugin 'ervandew/supertab'
call vundle#end()            " required
filetype plugin indent on    " required

"consul template highlighting
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl

"format onSave
"autocmd BufWritePre *.ts Neoformat
"let g:neoformat_try_formatprg = 1
autocmd FileType typescript set formatprg=prettier\ --stdin\ --parser\ typescript\ --single-quote\ --trailing-comma\ all\ --print-width\ 100


"vim-racer config
"set hidden
"let g:racer_cmd = '~/.cargo/bin/racer'
"let g:racer_experimental_completer = 1
"let g:racer_insert_paren = 1

nmap <silent><leader>d :ALEGoToDefinition<cr>

"au FileType rust nmap \d <Plug>(rust-def)
"au FileType rust nmap \s <Plug>(rust-def-split)
"au FileType rust nmap \x <Plug>(rust-def-vertical)
"au FileType rust nmap <leader>gd <Plug>(rust-doc)

"YouCompleteMe config
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']


"rustfmt config
let g:rustfmt_autosave = 1 "Enable auto rust formatting

"deoplete config
"let g:deoplete#enable_at_startup = 1

"ale config
let g:ale_elm_format_options = '--yes --elm-version=0.19'

let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint', 'tsserver']
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.python = ['flake8', 'mypy', 'pyls']
let g:ale_rust_rls_executable = 'rust-analyzer'
let g:ale_linters.rust = ['rls']

let g:ale_fixers = {}
let g:ale_fixers['elm'] = ['format']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['python'] = ['black', 'isort', 'autopep8']
let g:ale_fixers['rust'] = ['rustfmt']


let g:ale_list_window_size = 1
let g:ale_fix_on_save = 1

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" settings
"switch semicolon with colon
nnoremap ; :

vnoremap p "_dP

"custom settings
set autoindent
set autoread
set backspace=2
set completeopt-=preview
set cursorline
set expandtab
set hlsearch
set incsearch
set laststatus=2
set number
set scroll=7
set shiftwidth=2
set showcmd
set showmatch
set softtabstop=2
set tabstop=2
set wildmode=longest,list
set wildmenu
set visualbell
set lazyredraw
set smarttab
set backupdir=$TMPDIR//
set directory=$TMPDIR//

" removes trailing whitespace
fun! StripTailingWhitespace()
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTailingWhitespace()

"color options
syntax on
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" elm and javascript autofromats
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_ex = '$(npm bin)/eslint'

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has ("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

nmap Y y$

"let gmycm_semantic_triggers = {
"            \ 'elm' : ['.'],
"            \}

