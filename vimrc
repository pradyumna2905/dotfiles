" ====== "
" Vundle "
" ====== "
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                                        " let Vundle manage Vundle, required
Plugin 'ervandew/supertab'                                           " Tab completion
Plugin 'thoughtbot/vim-rspec'                                        " RSpec
Plugin 'tpope/vim-bundler'                                           " Bundler
Plugin 'tpope/vim-rake'                                              " Rake
Plugin 'tpope/vim-dispatch'                                          " Dispatch to run Rspec tests in buffer
Plugin 'tpope/vim-endwise'                                           " End ruby blocks
Plugin 'tpope/vim-fugitive'                                          " Git on steroids
Plugin 'tpope/vim-rails'                                             " Rails
Plugin 'tpope/vim-repeat'                                            " Repeat operations from plugins via .
Plugin 'tpope/vim-surround'                                          " Quotes/Parens
Plugin 'tpope/vim-cucumber'                                          " Cucumber
Plugin 'tpope/vim-commentary'                                        " Comment out lines
Plugin 'vim-ruby/vim-ruby'                                           " Ruby bindings
Plugin 'godlygeek/tabular'                                           " Tabularize
Plugin 'plasticboy/vim-markdown'                                     " MD
Plugin 'jiangmiao/auto-pairs'                                        " All sorts of parens, brackets
Plugin 'jparise/vim-graphql'                                         " GQL
Plugin 'ekalinin/Dockerfile.vim'                                     " Docker
Plugin 'terryma/vim-multiple-cursors'                                " Multi cursors
Plugin 'tpope/vim-eunuch'                                            " UNIX bindings
Plugin 'kaicataldo/material.vim'                                     " Material theme
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fuzzy search
Plugin 'junegunn/fzf.vim'                                            " Fuzzy search
Plugin 'SirVer/ultisnips'                                            " Snippets
Plugin 'vim-airline/vim-airline'                                     " Vim/Tmux Status bar
Plugin 'vim-airline/vim-airline-themes'                              " Vim/Tmux Status bar
Plugin 'pangloss/vim-javascript'                                     " React
Plugin 'mxw/vim-jsx'                                                 " React
Plugin 'mattn/emmet-vim'                                             " React
Plugin 'alvan/vim-closetag'                                          " Close HTML tags
Plugin 'scrooloose/nerdtree'                                         " File Explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'                                 " Git plugin for NERDTree
Plugin 'airblade/vim-gitgutter'                                      " Git gutter
Plugin 'tpope/vim-vinegar'                                           " Netrw on steroids
Plugin 'dense-analysis/ale'                                          " Lint engine
Plugin 'pradyumna2905/vim-ruby-def'                                  " Lint engine
call vundle#end()
filetype plugin indent on

" ============= "
" PLUGIN CONFIG "
" ============= "

" ============ "
" junegunn/fzf "
" ============ "
set rtp+=/usr/local/opt/fzf
map <silent><C-p> :FZF<CR>

" ================ "
" SirVer/ultisnips "
" ================ "
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
let g:UltiSnipsEditSplit = 'vertical'

" ======================= "
" vim-airline/vim-airline "
" ======================= "
let g:airline_section_y = fnamemodify(getcwd(), ':t')
let g:airline_section_error = ''
let g:airline_section_warning = ''
let g:airline_theme = 'material'

" =========== "
" mxw/vim-jsx "
" =========== "
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" ================== "
" alvan/vim-closetag "
" ================== "
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml,*.jsx,*.js"

" =================== "
" scrooloose/nerdtree "
" =================== "
let g:NERDTreeWinPos = 'right' " Open on right
let NERDTreeShowHidden = 1
" Close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =========================== "
" Xuyuanp/nerdtree-git-plugin "
" =========================== "
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "•",
    \ "Staged"    : "•",
    \ "Untracked" : "+",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "-",
    \ "Deleted"   : "x",
    \ "Dirty"     : "x",
    \ "Clean"     : "✔",
    \ 'Ignored'   : '-',
    \ "Unknown"   : "?"
    \ }

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=80
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?   " Make ?s part of words
augroup END

" ======= "
" Leaders "
" ======= "
let mapleader = ","
imap jj <esc>
map <Leader>b :Gblame<cr>
map <Leader>tw :set textwidth=999<cr>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
map <Leader>cc :!clear && cucumber %<CR>
map <Leader>ct :!cucumber<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co mmggVG"*y`m
map <Leader>n :cn<cr>
map <Leader>p :cp<cr>
" Search all occurrences
nmap <Leader>sa :Ag <C-r>=expand('<cword>')<CR><CR> 
map <Leader>cs :call SearchForCallSitesCursor()<CR>
map <Leader>cd :call SearchForRubyMethodDeclarationCursor()<CR>
map <Leader>cf :call SearchForRubyClassCursor()<CR>
map <Leader>d Obinding.pry<esc>:w<cr>
map <Leader>f Odebugger<esc>:w<cr>
map <Leader>D obinding.pry<esc>:w<cr>
map <Leader>o :w<cr>:call RunNearestSpec()<CR>
map <Leader>ps :set paste<CR><esc>
map <Leader>px :set nopaste<CR><esc>
map <Leader>q :copen<cr><cr>
map <Leader>ra :%s/
map <Leader>rd :redraw!<cr>
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>vg :vsp<cr>:grep
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>
map <Leader>nn :noh<cr>
nnoremap <Leader>s :Ag 
map <Leader>cl :w<cr>:exe "! clear && cucumber %" . ":" . line(".")<cr>
map <Leader>sc :setlocal spell spelllang=en_us<cr>
map <Leader>ns :set nospell<cr>
map <Leader>mm [<C-d>
map <Leader>a :NERDTreeToggle<CR>
map <Leader>at :ALEToggle<CR>
noremap <silent> <leader>m :NERDTreeFind<cr>
inoremap <Tab> <C-P>

" Git Leaders
map <Leader>g :Git<cr>
map <Leader>gb :Gblame<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gd :Gdiff<cr>

function! FormatFile()
  normal! mmgg=G`m^
endfunction
nnoremap <Leader>ri FormatFile()<esc>:w<cr>

function! Commentize()
  normal! mmyyPr#Vyjp
endfunction
map <Leader>c Commentize()<esc>:w<cr>
map <Leader>sop :source %<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap H ^
nnoremap L $
map <C-p> :Files<CR>
map ; :Files<CR>
map [j :ALENextWrap<CR>
map [k :ALEPreviousWrap<CR>


" Open tree of the current file's parent folder
" Example:
"   pwd: /code/my-proj/file.txt
" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>v :vsplit<cr><C-w><C-w>
map <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <C-h> :nohl<cr>
imap <C-l> :<Space>

" ==================== "
" Save file with <C-s> "
" ==================== "
imap <C-s> <esc>:w<CR>:echo Saved...
map <C-s> <esc>:w<CR>:echo Saved...
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

map <Space><Space> :ccl<cr> " Close Quickfix
map Q @q " Execute macro in q
map K <Nop> " Disable K looking stuff up

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>r :call RenameFile()<cr>


" ======= "
" Setters "
" ======= "
syntax on
set hidden
set rtp+=/usr/local/opt/fzf
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set history=500                   " keep 500 lines of command line history
set ruler                         " show the cursor position all the time
set showcmd                       " display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp              " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2                  " Always show status line.
set relativenumber
set number
set textwidth=79
set gdefault                      " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent                    " always set autoindenting on
set lazyredraw                    " Don't redraw screen when running macros.
set nofixendofline
set grepprg=ag                    " Use Silver Searcher instead of grep
set wildignore+=tmp/**            " Ignore stuff that can't be opened
set shiftround                    " When at 3 spaces and I hit >>, go to 4, not 5.
set nofoldenable                  " Say no to code folding...
set maxmempattern=100000          " Weird issue. Hack for now
set clipboard+=unnamed            " Makes `y` and `p` work with global buffers.
set wildmenu                      " Better? completion on command line
set wildmode=list:full            " What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set noesckeys                     " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1                 " Faster leader commands
set timeoutlen=500
set list listchars=tab:»·,trail:· " Display whitespace and tab chars
set hlsearch                      " Switch on highlighting the last used search pattern
set updatetime=100                " Used for git gutter refresh

" ======= "
" Letters "
" ======= "
let g:rspec_command = '!clear && bin/rspec {spec}'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['standardrb'],
\}
" let g:ale_fix_on_save = 1

au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace

" ================= "
" Cursor management "
" ================= "
" TMUX
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" iTerm 2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Terminal
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

" ===== "
" Theme "
" ===== "
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:material_terminal_italics = 1
" let g:material_theme_style = 'lighter'
colorscheme material

highlight PmenuSel ctermfg=black                             " Make the omnicomplete text readable
highlight StatusLine ctermfg=blue ctermbg=yellow             " Highlight the status line
highlight SignColumn ctermbg=black                           " Gutter background
highlight MatchParen cterm=none ctermbg=black ctermfg=yellow " Highlight matching parens
highlight ColorColumn ctermbg=235                            " Make it more obvious when lines are too long

" ================================ "
" Case insensitive common commands "
" ================================ "
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq
command! WQ wq


" =================== "
" Ruby Search Methods "
" =================== "
" function! SearchAllOccurrences()
"   let searchTerm = expand("<cword>")
"   cexpr system('ag -w ' . shellescape(searchTerm))
" endfunction

" function! SearchForCallSitesCursor()
"   let searchTerm = expand("<cword>")
"   call SearchForCallSites(searchTerm)
" endfunction

" function! SearchForRubyMethodDeclarationCursor()
"   let searchTerm = expand("<cword>")
"   call SearchForDeclaration(searchTerm)
" endfunction

" function! SearchForRubyClassCursor()
"   let searchTerm = expand("<cword>")
"   call SearchForRubyClass(searchTerm)
" endfunction

" " Search for call sites for term (excluding its definition) and
" " load into the quickfix list.
" function! SearchForCallSites(term)
"   cexpr system('ag -w ' . shellescape(a:term) . '\| grep -v def')
" endfunction

" function! SearchForDeclaration(term)
"   let definition = 'def ' . a:term
"   let class_definition = 'def self.' . a:term
"   let scope_declaration = 'scope :' . a:term
"   let search = definition . '|' . class_definition . '|' . scope_declaration
"   cexpr system('ag -w ' . shellescape(search))
" endfunction

" function! SearchForRubyClass(term)
"   let class = 'class ' . a:term
"   let module = 'module ' . a:term
"   let search = class . '|' . module
"   cexpr system('ag -w ' . shellescape(search))
" endfunction

" Enable built-in matchit plugin
runtime macros/matchit.vim

" ================= "
" File ext settings "
" ================= "
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " By default, vim thinks .md is Modula-2.
autocmd FileType markdown setlocal nolist wrap lbr        " Without this, vim breaks in the middle of words when wrapping
autocmd FileType qf setlocal wrap linebreak               " Wrap the quickfix window
autocmd VimResized * :wincmd =                            " Make sure tmux does not overlap vim splits

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
