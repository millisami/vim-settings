" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
colorscheme vividchalk

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
imap <Tab> <C-N>
imap <S-Tab> <C-P>
vmap <Tab> >gv
vmap <S-Tab> <gv
nmap <S-Tab> <C-W><C-W>

"Vimcasts, vimrc on the fly
if has("autocmd")
	autocmd BufWritePost .vimrc source $MYVIMRC
endif

" typing ,v in normal mode opens up the ~/.vimrc file in new tab
"let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

"Vimcasts, Show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

"Vimcasts, Soft Wrap
command! -nargs=* Wrap set wrap linebreak nolist
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g0
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g0

"Vimcasts, The Edit Command
map <leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/"<CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/"<CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/"<CR>

"Vimcasts, Working with Windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Emulate TextMate's shift left/right key commands
"Vimcasts, Indentation Commands
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


"Vimcasts, Working with tabs
"map <D-S-]> gt
"map <D-S-[> gT
"map <D-1> 1gt
"map <D-2> 2gt
"map <D-3> 3gt
" ....
"map <D-0> :tablast<CR>

"Vimcasts, irb and vim
"Restore cursor position if opened via irb
"Note you've to install the interactive_editor gem to make this work
if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
endif

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

"Vimcasts, Whitespace Preferences and File Types
autocmd BufNewFile,BufRead *.ru,Gemfile,*.lock setfiletype ruby

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec


