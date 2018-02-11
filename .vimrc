"  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
" ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███▌ ███   ███   ███
" ███    ███ ███  ███   ███   ███
" ███    ███ ███  ███   ███   ███
"  ▀██████▀  █▀    ▀█   ███   █▀

" @modifiedBy - Mandeep Singh Gill (mandeep6ill)
" Based on the ThoughtBot & Dorian base configuration but customized to my needs

" General settings
scriptencoding utf-8      " allow emojis in vimrc
set nocompatible           " vim, not vi
syntax on                  " syntax highlighting
filetype plugin indent on  " try to recognize filetypes and load rel' plugins
let g:livepreview_previewer = 'mupdf'

"  Behavior Modification ----------------------  {{{

" set leader key
" Leader
let mapleader = ","
let maplocalleader = "\\"

set cursorline
set number relativenumber
set background=dark   " tell vim what the background color looks like
set backspace=2       " Backspace deletes like most programs in insert mode
set history=200       " how many : commands to save in history
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set incsearch         " do incremental searching
set laststatus=2      " Always display the status line
set autowrite         " Automatically :write before running commands
set ignorecase        " ignore case in searches
set smartcase         " will use case sensitive if capital letter present or \C
set magic             " Use 'magic' patterns (extended regular expressions).
" set guioptions=       " remove scrollbars on macvim
set noshowmode        " don't show mode as airline already does
set showcmd           " show any commands
set foldmethod=manual " set folds by syntax of current language

set tabstop=2         " Softtabs or die! use 2 spaces for tabs.
set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
set expandtab         " insert tab with right amount of spacing
set shiftround        " Round indent to multiple of 'shiftwidth' set ttyfast           " should make scrolling faster set lazyredraw        " should make scrolling faster 

" wildmenu
set wildmenu                        " enable wildmenu
set wildmode=list:longest,list:full " configure wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code


" text appearance
" set textwidth=80
set nowrap                          " nowrap by default
set list                            " show invisible characters
set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

" Numbers
set number
set numberwidth=1

" Backups

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" set shell to bash
set shell=/bin/bash

" highlight fenced code blocks in markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'vim',
      \ 'js=javascript',
      \ 'json',
      \ 'python',
      \ 'bash=sh'
      \ ]

" custom settings (clean up later)

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" Save when losing focus
au FocusLost * :silent! wall

" show trailing spaces in normal mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Abbreviations ----------------------------------------------------------- {{{
" to use inside insert mode just write the abbrev and press space

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction
function! MakeSpacelessBufferIabbrev(from, to)
    execute "iabbrev <silent> <buffer> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghm/', 'http://github.com/mandeep6ill/')

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ

iabbrev todo TODO

iabbrev m6@ mandeep6ill@gmail.com
iabbrev mg@ mandeepgill.iitkgp@gmail.com
" }}}


"  Plugin Modifications (BEFORE loading bundles) ----- {{{

" ====================================
" SplitJoin
" ====================================
let g:splitjoin_align = 1
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

" ====================================
" MatchTagAlways
" ====================================
let g:mta_filetypes = {
      \ 'jinja': 1,
      \ 'xhtml': 1,
      \ 'xml': 1,
      \ 'html': 1,
      \ 'django': 1,
      \ 'javascript.jsx': 1,
      \ 'eruby': 1,
      \ }

" ====================================
" Sensible.vim
" ====================================
if !has('nvim')
  let g:loaded_sensible = 1
endif

" ====================================
" Snippets (UltiSnips)
" ====================================
let g:UltiSnipsListSnippets                = '<c-.>'
let g:UltiSnipsExpandTrigger               = '<tab>'
let g:UltiSnipsJumpForwardTrigger          = '<tab>'
let g:UltiSnipsJumpBackwardTrigger         = '<s-tab>'

" inoremap <Tab> <c-r>=UltiSnips#ExpandSnippet()<cr>
let g:UltiSnipsSnippetsDir="~/.vim/Ultisnips"


" let g:UltiSnipsListSnippets                = '<c-.>'
" let g:UltiSnipsExpandTrigger               = '<tab>'
" let g:UltiSnipsJumpForwardTrigger          = '<c-b>'
" let g:UltiSnipsJumpBackwardTrigger         = '<c-z>'

" :UltiSnipsEdit opens in a vertical split
let g:UltiSnipsEditSplit                   = 'vertical'
let g:UltiSnipsSnippetsDir                 = $HOME . '/dotfiles/vim/UltiSnips'

" ====================================
" indentLine
" ====================================
let g:indentLine_fileType = [
      \ 'java',
      \ 'ruby',
      \ 'elixir',
      \ 'javascript',
      \ 'vim'
      \ ]

" ====================================
" setup airline
" ====================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" =====================================
"  FZF
" =====================================
" set fzf's default input to AG instead of find. This also removes gitignore etc
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
let g:fzf_files_options =
  \ '--preview "(rougify {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" =====================================
"  JSX
" =====================================

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" =====================================
"  Ack + Ag
" =====================================

" Use The Silver Searcher for grep https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use Ag for Ack
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" ----------------------------------------------------------------------------
" vim slime
" ----------------------------------------------------------------------------
" let g:slime_target='tmux'

" ----------------------------------------------------------------------------
" Scratch.vim
" ----------------------------------------------------------------------------
" let g:scratch_no_mappings=1

" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------
" better emmet leader key (must be followed with ,)
" let g:user_emmet_leader_key='<C-e>'

" ----------------------------------------------------------------------------
" Vim RSpec
" ----------------------------------------------------------------------------
" vim-rspec command - make it use dispatch
" let g:rspec_command = 'VtrSendCommandToRunner! rspec {spec}'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" ----------------------------------------------------------------------------
" Vim Flow JS
" ----------------------------------------------------------------------------
let g:flow#autoclose = 1

" ----------------------------------------------------------------------------
" Startify
" ----------------------------------------------------------------------------
let g:startify_files_number = 5

" ----------------------------------------------------------------------------
" Vim Hashrocket
" ----------------------------------------------------------------------------
"Change cursor on insert mode (vim-hashrocket)
if !has('nvim')
  let g:use_cursor_shapes = 1
end

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> H :vertical resize -10<cr>
    au Filetype nerdtree nnoremap <buffer> L :vertical resize +10<cr>
    " au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak', '.*\.pdf$', '.*\.mid$',
                    \ '^tags$',
                    \ '^.*\.meta$',
                    \ '^.*\.fasl$',
                    \ '^.*\.dx64fsl$',
                    \ '.*\.bcf$', '.*\.blg$', '.*\.fdb_latexmk$', '.*\.bbl$', '.*\.aux$', '.*\.run.xml$', '.*\.fls$',
                    \ '.*\.midi$']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeMapJumpFirstChild = 'gK'
let g:NERDTreeIgnore = ['\.vim$', '\~$', '\.beam', 'elm-stuff']

" ----------------------------------------------------------------------------
" goyo.vim + limelight.vim
" ----------------------------------------------------------------------------
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  execute 'Limelight!'
endfunction

augroup GOYO
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END


" ----------------------------------------------------- }}}

" Load all plugins ------------------------------- {{{
if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif

"  Plugin Modifications (AFTER loading bundles) ----- {{{

" UI Customizations --------------------------------{{{


" let s:background_color="NONE"
  " when on dracula
  let g:limelight_conceal_ctermfg = 59
  let g:limelight_conceal_guifg = '#43475b'

" -----------------------------------------------------    }}}

" Auto commands ------------------------------------------------- {{{
  augroup vimrcEx
    autocmd!

    " Remove trailing whitespace on save for ruby files.
    autocmd BufWritePre *.rb,*.ex,*.exs :%s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

    " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    " autocmd FileType gitcommit setlocal spell

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-

    " Use 4 spaces for java
    " autocmd FileType java setlocal shiftwidth=4 tabstop=4

    " Vim/tmux layout rebalancing
    " automatically rebalance windows on vim resize
    autocmd VimResized * :wincmd =
  augroup END

  " May be we can save folds for certain files, check this later
  " augroup AutoSaveFolds
  "   autocmd!
  "   " add file types as needed
  "   autocmd BufWinLeave *.c,*.rb mkview
  "   autocmd BufWinEnter *.c,*.rb silent loadview
  " augroup END

" }}}

" Vim Script file settings ------------------------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Better split management, kept in sync with tmux' -- {{{
"" noremap <leader>- :sp<CR><C-w>j
"" noremap <leader>\| :vsp<CR><C-w>l
" }}}

"  Key Mappings -------------------------------------------------- {{{

  " Pasting support
    set pastetoggle=<F2>  " Press F2 in insert mode to preserve tabs when
                          " pasting from clipboard into terminal

  " re-indent file and jump back to where the cursor was
    map <F3> mzgg=G`z

  " prevent entering ex mode accidentally
    nnoremap Q <Nop>

  " Search for selected text
    vnoremap * "xy/<C-R>x<CR>

  " change dir to current file's dir
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

    " one   = 1
    " two   = 2
    " three = 3
    " four  = 4

  " Tabularize: text alignment
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>

  " zoom a vim pane, <C-w>= to re-balance
    " nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
    " nnoremap <leader>= :wincmd =<cr>

  " close all other windows with <leader>o
    " nnoremap <leader>wo <c-w>o

  " Vim Tmux Runner:
    " nnoremap <leader>pry :VtrOpenRunner {'orientation': 'h', 'percentage': 33, 'cmd': 'pry'}<cr>
    " nnoremap <leader>or :VtrOpenRunner<cr>
    " vnoremap <leader>sl :VtrSendLinesToRunner<cr>
    " nnoremap <leader>fr :VtrFocusRunner<cr>
    " nnoremap <leader>dr :VtrDetachRunner<cr>
    " nnoremap <leader>ap :VtrAttachToPane

  " Index ctags from any project, including those outside Rails
    " map <Leader>ct :!ctags -R .<CR>

  " Switch between the last two files
    nnoremap <tab><tab> <c-^>

  " NerdTree:
    nnoremap <Leader>nt :NERDTreeToggle<CR>
    nnoremap <leader>d :e %:h<CR>

  " Grep selection with Ag
    " xnoremap <leader>g y :Ag "<CR>

  " CopyRTF: Copy code as RTF
    " nnoremap <silent> <leader><C-c> :set nonumber<CR>:CopyRTF<CR>:set number<CR>

  " command typo mapping
    cnoremap WQ wq
    cnoremap Wq wq
    cnoremap QA qa
    cnoremap qA qa
    cnoremap Q! q!

  " copy to end of line
    nnoremap Y y$

  " copy to system clipboard
    noremap gy "+y

  " copy whole file to system clipboard
    nnoremap gY gg"+yG

  " Goyo:
    nnoremap <Leader>G :Goyo<CR>

  " FZF:
    nnoremap <C-b> :Buffers<CR>
    nnoremap <C-g>g :Ag<CR>
    nnoremap <C-g>c :Commands<CR>
    nnoremap <C-f>l :BLines<CR>
    nnoremap <C-p> :Files<CR>

  " CtrlSF:
    nnoremap <C-F>f :CtrlSF
    nnoremap <C-F>g :CtrlSF<CR>

  " easier new tab
    noremap <C-t> <esc>:tabnew<CR>
    noremap <C-c> <esc>:tabclose<CR>

  " Quicker window movement
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

  " Incsearch:
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

" --------------------- Key Mappings ---------------------------- }}}

" Kill window
nnoremap K :q<cr>

" Save
nnoremap s :w<cr>

" Man
" nnoremap M K
"
" Clean up windows
nnoremap - :wincmd =<cr>

" Toggle line numbers
nnoremap <leader>n :setlocal number! relativenumber!<cr>

" Sort lines
nnoremap <leader>s vip:!sort -f<cr>
vnoremap <leader>s :!sort -f<cr>

" Tab
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" Wrap
nnoremap <leader>W :set wrap!<cr>

" Inserting blank lines
" I never use the default behavior of <cr> and this saves me a keystroke...
nnoremap <cr> o<esc>

" Yank to end of line
nnoremap Y y$

" Reselect last-pasted text
nnoremap gv `[v`]

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !myctags >/dev/null 2>&1 &<cr>:redraw!<cr>

" Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" "Uppercase word" mapping.
"
" This mapping allows you to press <c-u> in insert mode to convert the current
" word to uppercase.  It's handy when you're writing names of constants and
" don't want to use Capslock.
"
" To use it you type the name of the constant in lowercase.  While your
" cursor is at the end of the word, press <c-u> to uppercase it, and then
" continue happily on your way:
"
"                            cursor
"                            v
"     max_connections_allowed|
"     <c-u>
"     MAX_CONNECTIONS_ALLOWED|
"                            ^
"                            cursor
"
" It works by exiting out of insert mode, recording the current cursor location
" in the z mark, using gUiw to uppercase inside the current word, moving back to
" the z mark, and entering insert mode again.
"
" Note that this will overwrite the contents of the z mark.  I never use it, but
" if you do you'll probably want to use another mark.
inoremap <C-u> <esc>mzgUiw`za

" Panic Button
nnoremap <f9> mzggg?G`z

" zt is okay for putting something at the top of the screen, but when I'm
" writing prose I often want to put something at not-quite-the-top of the
" screen.  zh is "zoom to head level"
nnoremap zh mzzt10<c-u>`z

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph.
"
" Useful for writing GitHub comments in actual Markdown and then translating it
" to their bastardized version of Markdown.
nnoremap <leader>j mzvipJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a

" Source
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Open current directory in Finder
nnoremap <leader>O :!ranger .<cr>

" Zip Right
"
" Moves the character under the cursor to the end of the line.  Handy when you
" have something like:
"
"     foo
"
" And you want to wrap it in a method call, so you type:
"
"     println()foo
"
" Once you hit escape your cursor is on the closing paren, so you can 'zip' it
" over to the right with this mapping.
"
" This should preserve your last yank/delete as well.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Insert Mode Completion {{{
" yet to try out on an actual situation
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

" open current file in vsplit
noremap <leader>v <C-w>v

" Quick editing ----------------------------------------------------------- {{{

nnoremap <leader>eg :vsplit ~/.gitconfig<cr>
nnoremap <leader>eq :vsplit ~/Dropbox/quotes.txt<cr>Gzz
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>

" }}}

" Searching and movement -------------------------------------------------- {{{

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" }}}

" color scheme
colorscheme codedark
if !has('nvim')       " does not work on neovim
  set termguicolors   " enable true colors
end
" if !has('nvim')       " does not work on neovim
"   set t_Co=256   " enable true colors
"   hi! Normal ctermbg=NONE guibg=NONE
"   hi! NonText ctermbg=NONE guibg=NONE
" end

