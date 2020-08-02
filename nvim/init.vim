inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0

" autocmd InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<S-TAB>'
" let g:auto_save = 1
hi Normal guibg=NONE ctermbg=NONE
set clipboard=unnamed
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[5 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[2 q"  " default cursor (usually blinking block) otherwise

" let g:indent_guides_enable_on_vim_startup = 1

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

let g:vim_markdown_conceal = 0
let g:vebugger_leader='\'


 " Tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" nnoremap <C-h> <C-w>h<CR>
" nnoremap <C-j> <C-w>j<CR>
" nnoremap <C-k> <C-w>k<CR>
" nnoremap <C-l> <C-w>l<CR>


map <leader>h :Ranger<CR>
map <leader>g :BuffergatorOpen<CR>
" map <leader>y :Ranger<CR>
" map <leader>g :Ranger<CR>
" map <leader>e :Ranger<CR>
" inoremap <leader>bb :BuffergatorOpen<cr>
" nnoremap <leader>t :terminal<cr>
" nnoremap <leader>ut :RangerNewTab<cr>
" nnoremap <leader>uu :Ranger<cr>
" nnoremap <leader>; :silent !i3 split h && $TERMINAL -e ranger & <cr>
" nnoremap <leader>v :silent !i3 split v && $TERMINAL -e ranger & <cr>
nnoremap <leader>w :silent !$TERMINAL -e ranger & <cr>




" nnoremap <M-j> <C-f>
" nnoremap <M-k> <C-b>

" " Alt-j and Alt-k works for select in Intelisence
" inoremap <expr> <M-j> ((pumvisible())?("\<C-n>"):("<M-j>")) 
" inoremap <expr> <M-k> ((pumvisible())?("\<C-p>"):("<M-k>"))
"Clicking Enter inside Intelisence Works
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>" 

autocmd filetype rust map mm :w <bar> :!/home/rajatv/scripts/compile-current-project.sh <CR>

map zz :w <CR>
autocmd filetype cpp nnoremap <F4> :w <bar> !clear <CR> :!cmake . <CR>
autocmd filetype cpp nnoremap <F5> :w <bar> !clear <CR> :!make && ./run <CR>

autocmd filetype rust nnoremap <F4> :w <bar> !clear <CR> :!cargo build <CR>
autocmd filetype rust nnoremap <F5> :w <bar> !clear <CR> :!alacritty --hold -e cargo run <CR>
autocmd filetype rust nnoremap <F6> :w <bar> !clear <CR> :!cargo test<CR>


" map <f9> :w <cr> :!gcc % -o %< && ./%< <cr>
autocmd filetype cpp nnoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!g++ % -o %< && ./%< -O3 -m64<CR>
autocmd filetype cpp nnoremap <F12> :w <bar> !clear && map <F12> :w <CR> :!g++ % -o %< <CR>
autocmd filetype rust nnoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!rustc % && ./%<<CR>
autocmd filetype cpp inoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!g++ % -o %< && ./%< -O3 -m64<CR>
autocmd FileType python nnoremap <buffer> <F8> :update<bar>!python %<CR>
autocmd FileType python nnoremap <buffer> <F5> !konsole -e python main.py &<CR>
autocmd filetype c nnoremap <F9> :w <bar> map <F9> :w <CR> :!gcc % -o %< && ./%< <CR>

" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.

autocmd filetype java map <F9> :set makeprg=javac\ %<CR>:make<CR>
autocmd filetype java map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype java map <F11> :set makeprg=javac\ #<CR>:make<CR>
autocmd filetype java map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>

autocmd filetype java map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
autocmd filetype java map! <F10> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype java map! <F11> <Esc>set makeprg=javac\ #<CR>:make<CR>
autocmd filetype java map! <F12> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>

" Tip: load a file into the default buffer, and its driver
" into the alternate buffer, then use F9/F12 to build/run.
" Note: # (alternate filename) isn't set until you :next to it!
" Tip2: You can make then run without hitting ENTER to continue. F9-F12

" With these you can cl/cn/cp (quickfix commands) to browse the errors
" after you compile it with :make

set makeprg=javac\ %
set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
  n
  e #
endif

" nmap <space> <bslash>

" let mapleader = "\<Space>"
nnoremap <SPACE> <Nop>
map <Space> <Leader>

noremap <Leader>y "+y
noremap <Leader>Y "*y

" xnoremap <Leader>y "*y
" xnoremap <Leader>p "*p
" xnoremap <Leader>Y "+y
" xnoremap <Leader>P "+p

nnoremap <Leader>p :PrettierAsync <cr>
nnoremap <Leader>x :q<cr>   " Quit current file

" nnoremap <Leader>m :PrettierAsync<cr>:w<cr>
nnoremap zx :wq!<cr>
nnoremap zc :qa!<cr>

set showmatch
set cursorline
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

inoremap kj <Esc>
filetype plugin on

set so=8

let g:buffergator_viewport_split_policy="B"


set nocompatible
syntax on
let g:vim_markdown_folding_disabled = 1

let g:markdown_fenced_languages = ['c','cpp','html', 'python', 'bash=sh']


let $ZFZ_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-b> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install' }
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Plug 'peitalin/vim-jsx-typescript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'https://github.com/lambdalisue/vim-django-support'

Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax'

" Plug 'https://github.com/SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'https://github.com/neoclide/coc-snippets'
" Plug 'vim-scripts/Conque-GDB'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'tikhomirov/vim-glsl' "Opengl shading language highlighting
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
" Plug 'wookiehangover/jshint.vim'
Plug 'cespare/vim-toml'


" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'



Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
" Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-scripts/Highlight-UnMatched-Brackets'

" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'easymotion/vim-easymotion'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/vim-auto-save'
Plug 'arcticicestudio/nord-vim'
Plug 'https://github.com/dunstontc/vim-vscode-theme'

call plug#end()

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx, js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
syntax enable

" colorscheme ayu
" let ayucolor="mirage"
colorscheme PaperColor
set background=dark
set ts=4 sw=4 et

set noswapfile
set number
set relativenumber


"Flutter Commands
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>
"Flutter End
"
"====================================================================================================
"Coc - Language Server Client ***Start***
"====================================================================================================
 " if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"====================================================================================================
"Coc Language Server Client ***End *****
"====================================================================================================
" hi Normal guibg=NONE ctermbg=NONE
