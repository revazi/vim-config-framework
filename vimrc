" http://stackoverflow.com/questions/9990219/vim-whats-the-difference-between-let-and-set
" Borrows from https://github.com/terryma/dotfiles/blob/master/.vimrc
" Borrows from https://github.com/klen/.vim

let g:SESSION_DIR   = $HOME.'/.cache/vim/sessions'

" Allow switching away from unsaved buffers
" Or else FZF and :e will fail if moving away from buffer
" https://superuser.com/a/163627
set hidden

" Set initial line numbers
set number

" fix backspace
" http://vim.wikia.com/wiki/Backspace_and_delete_problems#Backspace_key_won.27t_move_from_current_line
set backspace=2 " make backspace work like most other programs

" Don't create swap files
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Glitchy behavior with parents, exception raising 
set noshowmatch
" https://stackoverflow.com/a/47361068
" https://stackoverflow.com/a/47811468
let g:loaded_matchparen=1  " or :NoMatchParen

" Make :e and :vsp show directory relative to buffer
set autochdir

" Fix E353: Nothing in register "
" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Try to fix issue where netrw is open and opened buffer not writable
" (requiring :set bt=): https://github.com/tpope/vim-vinegar/issues/13
autocmd FileType netrw setl bufhidden=delete
let g:netrw_liststyle = 4

" 1 - open files in a new horizontal split
" 2 - open files in a new vertical split
" 3 - open files in a new tab
" 4 - open in previous window
" let g:netrw_browse_split = 1

" Set the width of the netrw pane
" let g:netrw_winsize = 20

" Open netrw vertically on vim enter
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Resize vim split
noremap <silent> <C-S-Left> :vertical resize +5<CR>
noremap <silent> <C-S-Right> :vertical resize -5<CR>
noremap <silent> <C-S-Up> :resize +5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>

"  Truecolor
set termguicolors

" https://github.com/tmux/tmux/issues/1246
" How to use true colors in vim under tmux? #1246
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

call lib#SourceIfExists("~/.vim/plugin_loader.vim")
call plugin_loader#PlugInit()
call settings#LoadSettings()

call lib#SourceIfExists("~/.vim/settings/highlight.vim")

if lib#ColorSchemeExists("gruvbox-material")
  let g:gruvbox_material_disable_italic_comment = 1  " This shows up as highlighted in kitty
  colorscheme gruvbox-material
elseif lib#ColorSchemeExists("gruvbox")
  colorscheme gruvbox
elseif lib#ColorSchemeExists("desert-warm-256")
  colorscheme desert-warm-256
else
  colorscheme desert
endif

call lib#SourceIfExists("~/.vimrc.local")
