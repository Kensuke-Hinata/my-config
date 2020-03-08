source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
filetype indent on

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType sml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml,wxml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css,styl,wxss setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support

syntax enable
syntax on

" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

set scrolloff=0
set cursorline cursorcolumn
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colorscheme darkburn

set encoding=utf-8
set nowrap
set expandtab
set nu!
set shiftwidth=4
set ts=4
set t_Co=256
set bg=dark

let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
let Tlist_WinHeight=1
let g:winManagerWindowLayout='FileExplorer|TagList'

au GUIenter * winpos 0 0 | set lines=999 columns=9999

"noremap <silent> wm :WMToggle<cr>
"noremap <silent> ww :<C-R>ww<cr>
"noremap <silent> <F9> :WMToggle<cr>
"set guifont=Consolas:h100
set gfn=Monaco:h18
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
   "add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

set cscopequickfix=c-,d-,e-,g-,i-,s-,t-

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

map <F9> <C-W-W><CR>
"map <C-H> :%s/
"set runtimepath+=~/.vim/bundle/ack.vim-master/autoload

"vundle begin

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:mapleader=','
let g:user_emmet_expandabbr_key='<C-J>'

map<Leader>w <C-w><C-w>

" for tags
let g:autotagTagsFile="tags"
let g:autotagDisabled=0
let g:autocatExcludeSuffixes='sh.js.txt.xml.tml.text'
"let g:autotagCtagsCmd="ctags -R"
let g:vim_tags_auto_generate=1
let g:autotagmaxTagsFileSize=1024 * 1024 * 7 * 100
set autochdir
set tags+=tags;
set path=./**

"autocmd vimenter * !ctags -R --exclude=node_modules --exclude=static 2>&1 &
"autocmd vimenter * !echo kensuke

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" vundle end
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable plugins
try
    source ~/.vim/plugins.vim
    source ~/.vim/plugins_config.vim
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier moving between windows

" YouCompleteMe
" close the preview
set completeopt-=preview
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" ctags generate tag files
let g:ycm_collect_identifiers_from_tag_files=1
" ctrl + space => alt+ (CLang)
let g:ycm_key_invoke_completion='<M-;>'
" complete
let g:ycm_seed_identifiers_with_syntax=1
" prevent from showing the information about checking the ycm_extra_conf file
let g:ycm_confirm_extra_conf=0
" regenerate matching items
let g:ycm_cache_omnifunc=0
" complete in comment
let g:ycm_complete_in_comments=1
" complete after typing the first character
let g:ycm_min_num_of_chars_for_completion=1
" error hint
let g:ycm_error_symbol='>>'
" Warning hint
let g:ycm_warning_symbol='>*'
"let g:ycm_use_ultisnips_completer = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" for java
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0
let g:EclimCompletionMethod = 'omnifunc'

"NERDTree
let NERDTreeIgnore=['.pyc', '.swp', '\.hi', '\.o$', '\~']
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeWinSize=30
"let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w
noremap <silent> <leader>t :NERDTreeToggle<cr>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <silent> <leader>w :set wrap! wrap?<cr>
nnoremap <silent> <leader>hl :nohl<cr>
nnoremap <leader>ds d^
nnoremap <leader>de d$
nnoremap <leader>ys y^
nnoremap <leader>ye y$
nnoremap <leader>grl :Grep -i -r
nnoremap <leader>gr :Grep -r
nnoremap <c-v> <c-v>

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
let g:haskell_indent_let = 2
let g:haskell_indent_where = 2
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 2

let g:cabal_indent_section = 2

let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_linters = {
            \'java': ['javac', 'javalsp', 'pmd'],
            \'D': ['dls', 'dmd', 'uncrustify'],
            \'javascript': ['eslint'],
            \}

"for Python
nnoremap <leader>pyl :PymodeLint<cr>
nnoremap <leader>pyf :PymodeLintAuto<cr>
"let g:pymode_python='python2'

"input method
"set noimdisable
"autocmd! InsertLeave * set imdisable|set iminsert=0
"autocmd! InsertEnter * set noimdisable|set iminsert=0

"se imd
"au InsertEnter * se noimd
"au InsertLeave * se imd
"au FocusGained * se imd
"

set rubydll=/usr/local/Cellar/ruby/2.6.3/lib/libruby.2.6.dylib
