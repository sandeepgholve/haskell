" Summary
" In summary adding these plugins and lines to the .vimrc will introduce several
" Haskell specific commands which are bound to these keyboard shortcuts:
"
" Command
" t + w          Insert type fortoplevel declaration
" t + q          Query type of expression under cursor
" t + s          Case split expression under cursor
" t + e          Erase type query
" a + =          Align on equal sign
" a + -          Align on case match
" Ctrl + x + o   Tab complete undercursor
" \ + t          Open fuzzy file finder
" \ + n          Open file explorer
" \ + c + Space  Toggle comment of text under cursor
" \ + c + s      Toggle “sexy” comment of text


" Set up our basic vim configuration with some pretty sensible defaults that
" should work nicely in either terminal vim or gvim. Fairly standard stuff here
" to enable syntax highlighting, line numbers, tab completion and two space
" indentation. The last line enables the pathogen manager which pulls all the
" bundles into the environment.

syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

execute pathogen#infect()


" ---------------------- Syntastic - Start -----------------------------------
"  Syntactic provides background syntax checking with line-by-line error
"  reporting. It integrates with ghc-mod and hlint to provide semantic hinting
"  about type errors and possible code corrections. To enable it we add the
"  following lines to our .vimrc.
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ---------------------- Syntastic - End -----------------------------------

" ---------------------- ghc-mod - Start -----------------------------------
"  To hook into GHC’s code competion capabilities we map several keyboard
"  commands to ghc-mod functions
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
" ---------------------- ghc-mod - End -----------------------------------

" ---------------------- Supertab - start  -----------------------------------
" To enable familiar tab completion we configure supertab to dispatch to
" neco-ghc’s tab completion routines instead of the usual local variable
" completion. After that we configure necoghc to be the default tab completion
" method.

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif
" ---------------------- Supertab - end  -----------------------------------

" ---------------------- neco-ghc - start ----------------------------------
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" ---------------------- neco-ghc - end ----------------------------------

" ---------------------- nerdtree - start ----------------------------------
"  Nerdtree is the standard file management plugin which replaces vim’s default
"  left-hand file pile. It allows recursive directory traversal with folds and
"  slew of other convenient features. It’s usually one of the first things
"  installed in any respectable vim installation.
map <Leader>n :NERDTreeToggle<CR>
" ---------------------- nerdtree - end ----------------------------------

" ---------------------- tabularize - start ----------------------------------
"  Tabularize allows uniform aligned code formatting based on any textual regex
"  pagttern. For Haskell there are several common identifiers that we typically
"  align on; and we can map specific keys to these common patterns.
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
" ---------------------- tabularize - end ----------------------------------


" ---------------------- vim-snipmate - start ----------------------------------
"  The best Haskell snippet collection that I know of is one I’ve curated over
"  the years, that automates the insertion of many common insert statements,
"  language extensions and instance declarations. This is placed in the
"  ~/.vim/snippets folder.
"  haskell.snippet
"
"  The usage is simple, simply define a keyword in the haskell.snippets file of
"  the form:
"  snippet derive
"      {-# LANGUAGE DeriveDataTypeable #-}
"      {-# LANGUAGE DeriveGeneric #-}
"      {-# LANGUAGE DeriveFunctor #-}
"      {-# LANGUAGEDeriveTraversable #-}
"      {-# LANGUAGE DeriveFoldable #-}
" Then tab completing on the this phrase in Insert Mode will expand out the code
" block.
" ---------------------- vim-snipmate - end ----------------------------------

" ---------------------- ctrl-p - start ----------------------------------
"  Ctrl-p is a fuzzy file search plugin which allows quick browsing of a project
"  based on a fuzzy text search of the filename or it’s contents. We’ll bind the
"  ctrl-p panel launch to \ + t.
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
" ---------------------- ctrl-p - end ----------------------------------


" syntax on
" filetype plugin indent on

" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" g:haskell_classic_highlighting to 1. " you can switch to a more traditional mode

" let g:haskell_indent_if = 3
" let g:haskell_indent_case = 2
" let g:haskell_indent_let = 4
" let g:haskell_indent_where = 6
" let g:haskell_indent_before_where = 2
" let g:haskell_indent_after_bare_where = 2
" let g:haskell_indent_do = 3
" let g:haskell_indent_in = 1
" let g:haskell_indent_guard = 2
" let g:haskell_indent_case_alternative = 1
" let g:cabal_indent_section = 2

