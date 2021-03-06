if executable('ag')
  Plug 'rking/ag.vim'
endif

Plug 'qpkorr/vim-bufkill'

Plug 'editorconfig/editorconfig-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'francoiscabrol/ranger.vim'

if executable('pipenv')
  Plug 'cespare/vim-toml'
  au BufNewFile,BufRead Pipfile     setf toml
  au BufNewFile,BufRead Pipfile.lock     setf json
endif

Plug 'GutenYe/json5.vim'

if executable('docker')
  Plug 'ekalinin/Dockerfile.vim'
endif

if executable('git')
  " Plug 'airblade/vim-gitgutter'
  " Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']
endif

if executable('go')
  Plug 'fatih/vim-go', {
	\ 'for': 'go'
	\ }
endif

if executable('psql')
  Plug 'lifepillar/pgsql.vim'
endif


" helpers for unix: :Move, :Rename, etc
Plug 'tpope/vim-eunuch'

Plug 'tomtom/tcomment_vim'
Plug 'mustache/vim-mustache-handlebars', {
      \   'for': ['html', 'mustache', 'hbs']
      \ }

Plug 'tpope/vim-markdown', {'for':['markdown']}
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'cpp'] }
Plug 'chaoren/vim-wordmotion'

Plug 'rainux/vim-desert-warm-256'
Plug 'morhetz/gruvbox'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}

"" CocInstall coc-json coc-html coc-css coc-python coc-eslint coc-tsserver coc-tslint-plugin
let g:coc_global_extensions = [
  \ 'coc-json', 'coc-html', 'coc-css', 'coc-python',
  \ 'coc-tsserver', 'coc-rls', 
  \ 'coc-prettier', 'coc-eslint'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

function! OnLoadCoc()
  " use <tab> for trigger completion and navigate next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " Remap keys for gotos
  nmap <F12> <Plug>(coc-definition)
  nmap <C-F12> <Plug>(coc-type-definition)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> <leader>g <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> <leader>G <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
  nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
  nmap <leader>do <Plug>(coc-codeaction)
  nmap <leader>rn <Plug>(coc-rename)
endfunction

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call OnLoadCoc()

" For coc-settings.json jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

Plug 'vim-python/python-syntax'

let g:rainbow_active = 1
Plug 'frazrepo/vim-rainbow'

if executable('black')
  autocmd BufWritePost *.py silent !black % --quiet
endif

if executable('isort')
  autocmd BufWritePost *.py silent !isort % --quiet
endif

if executable('node')
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'vue', 'markdown', 'markdown.mdx'] }

  autocmd BufWritePre *.md,*.mdx,*.ts,*.tsx,*.js,*.jsx execute ':Prettier'
endif

if executable('bibtex-tidy')  " Tested with bibtex-tidy at 1.3.1
  autocmd BufWritePost *.bib silent !bibtex-tidy % --quiet --no-backup
endif

Plug 'jparise/vim-graphql'

Plug 'cakebaker/scss-syntax.vim'

if executable('node')
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'posva/vim-vue'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'pangloss/vim-javascript'
endif

if executable('tmux')
  Plug 'wellle/tmux-complete.vim'
endif

if executable('cargo')
  Plug 'rust-lang/rust.vim'
endif

if executable('poetry')
  let g:poetv_auto_activate = 1

  Plug 'petobens/poet-v'
endif

