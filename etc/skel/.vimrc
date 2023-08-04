" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
""""Setting for the plugin Vundle plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme) 
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-python/python-syntax'
Plugin 'derekwyatt/vim-scala'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'micha/vim-colors-solarized' 

"Set python checker to pylint only
let g:syntastic_python_python_exec='python3.6'
let g:syntastic_python_checkers=['python']
let g:syntastic_check_on_open = 0
"
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

"Set the indtendation of the Matlab files
" For all text files set 'textwidth' to 78 characters.

syntax enable
set background=light
colorscheme solarized

set expandtab shiftwidth=4 tabstop=4 
set number

autocmd FileType tex setlocal spell textwidth=78 expandtab shiftwidth=4 tabstop=4 winaltkeys=no
autocmd FileType text setlocal textwidth=78 expandtab shiftwidth=4 tabstop=4 
autocmd FileType matlab setlocal expandtab shiftwidth=4 tabstop=4 
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=4 
autocmd FileType c setlocal expandtab shiftwidth=4 tabstop=4 
autocmd FileType vhdl setlocal expandtab shiftwidth=4 tabstop=4 
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 
autocmd FileType scala setlocal expandtab shiftwidth=4 tabstop=4 

set autoindent
set hls!

"Syntastic checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"Clear searh highlights with esc
""nnoremap <esc> :noh<return><esc>
filetype plugin on

let g:tex_flavor='latex'
" Vim latex environment modifications  and additions here
" Figure
let g:Tex_Env_figure="\\begin{figure}\<CR>\\centering\<CR>\
    \\includegraphics[width=<++>\\textwidth]{<+path+>}\<CR>\
    \\caption{<+caption text+>}\<CR>\
    \\label{fig:<+label+>}\<CR>\
\\end{figure}<++>"
" Align
let g:Tex_Env_align="\\begin{align}\<CR><++>&=<++>\<CR>\
\\end{align}<++>"

" Frame with one content
let g:Tex_Env_frame="%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\<CR>\
\\begin{frame}[<++>]\<CR>\
    \\frametitle{<++>}\<CR>\
    \\begin{itemize}\<CR>\
        \\item <++> <++>\<CR>\
    \\end{itemize}\<CR>\
\\end{frame}"

"""""
set wildmode=longest,list,full
set wildmenu 

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq
map <C-a> <Nop>

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
"  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" Set some highlighting for the spellchecker
hi SpellBad cterm=underline

"Here write the alterations for the latex suite



"Auto update Last Modified stamp within 50 first lines

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
"function! LastModified()
"  if &modified
"    let save_cursor = getpos(".")
"    let n = min([50, line("$")])
"    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' . 
"                \strftime('%Y%m%d %H:%M') . ' marko.kosunen@aalto.fi' .  '#e'
"          "strftime('%Y%m%d  %I:%M%p') . '#e'
"    call histdel('search', -1)
"    call setpos('.', save_cursor)
"  endif
"endfun
"
"function! LastModified2()
"  if &modified
"    let save_cursor = getpos(".")
"    let n = min([50, line("$")])
"    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modification by \).*#\1' . 
"                \'Marko Kosunen, marko.kosunen@aalto.fi, ' . strftime('%d.%m.%Y %H:%M') . '#e'
"          "strftime('%Y%m%d  %I:%M%p') . '#e'
"    call histdel('search', -1)
"    call setpos('.', save_cursor)
"  endif
"endfun
" 
"autocmd BufWritePre * call LastModified()
"autocmd BufWritePre * call LastModified2()
"Disable automatic commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Nerdtree settings
"silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
"silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"

map <C-F12> :!ctags -R -f tags .<CR>

"Show the filename on the bar
set laststatus=2
set statusline=%f

"Syntastic improvements
let g:syntastic_quiet_messages = { "regex": [ '\mpossible unwanted space at "{"' ] }

"Map tag navigation to be preceded by default split
"nnoremap <C-]> <C-w><C-]>

