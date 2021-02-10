set hidden
set mouse=a
" Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" open new split panes to right and below
set splitright
set splitbelow
" so be do be so 

"remembers the last position of cursor after closing file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

inoremap ;<cr> <end>;<cr>
inoremap .<cr> <end>.
inoremap ;;<cr> <down><end>;<cr>
inoremap ..<cr> <down><end>.;

" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>

let g:bclose_no_plugin_maps = 1 " <leader>bd disable

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
" autocmd InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:airline_powerline_fonts=1

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:auto_save = 0
hi Normal guibg=NONE ctermbg=NONE
set clipboard=unnamed

let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_char = '┊'


let g:vim_markdown_conceal = 0
let g:vebugger_leader='\'


" Tab
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap <C-h> <C-w>h<CR>
nnoremap <C-j> <C-w>j<CR>
nnoremap <C-k> <C-w>k<CR>
nnoremap <C-l> <C-w>l<CR>
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <leader>q :exit<CR>
map <leader>h :Lf<CR>
" map <leader>d :!g++ -Wall -lm -o main main.cpp && ./main < input > output1 && diff output1 output<cr>
map <leader>d :!g++ -Wall -lm -o main main.cpp && ./main < input > output<cr>


"Clicking Enter inside Intelisence Works
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>" 

autocmd filetype rust map mm :w <bar> :!/home/rajatv/scripts/compile-current-project.sh <CR>

autocmd filetype cpp nnoremap <F4> :w <bar> !clear <CR> :!cmake . <CR>
autocmd filetype cpp nnoremap <F5> :w <bar> !clear <CR> :!make && ./run <CR>
autocmd filetype rust nnoremap <F5> :w <bar> !clear <CR> :!alacritty --hold -e cargo run <CR>

autocmd filetype rust nnoremap <F4> :w <bar> !clear <CR> :!cargo build <CR>
autocmd filetype rust nnoremap <F5> :w <bar> !clear <CR> :!alacritty --hold -e cargo run <CR>
autocmd filetype rust nnoremap <F6> :w <bar> !clear <CR> :!cargo test<CR>


" map <f9> :w <cr> :!gcc % -o %< && ./%< <cr>
autocmd filetype cpp nnoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!g++ % -o %< && ./%< -O3 -m64<CR>
autocmd filetype cpp nnoremap <F12> :w <bar> !clear && map <F12> :w <CR> :!g++ % -o %< <CR>
autocmd filetype rust nnoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!rustc % && ./%<<CR>
autocmd filetype cpp inoremap <F9> :w <bar> !clear && map <F9> :w <CR> :!g++ % -o %< && ./%< -O3 -m64<CR>
autocmd filetype c nnoremap <F9> :w <bar> map <F9> :w <CR> :!gcc % -o %< && ./%< <CR>

" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.


" Tip: load a file into the default buffer, and its driver
" into the alternate buffer, then use F9/F12 to build/run.
" Note: # (alternate filename) isn't set until you :next to it!
" Tip2: You can make then run without hitting ENTER to continue. F9-F12



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

set showmatch
set cursorline
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

inoremap kj <Esc>
filetype plugin on

set so=8
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
    


set nocompatible
syntax on
let g:vim_markdown_folding_disabled = 1

let g:markdown_fenced_languages = ['c','cpp','html', 'python', 'bash=sh']



" set backspace=indent,eol,start
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wincent/command-t', {
     \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
     \ }
Plug 'wincent/ferret'
Plug 'wincent/scalpel'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install' }

" Plug 'ctrlpvim/ctrlp.vim' -> command t
" Plug 'jeetsukumaran/vim-buffergator' -> command t
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'honza/vim-snippets'

Plug 'tikhomirov/vim-glsl' "Opengl shading language highlighting
" Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'cespare/vim-toml'
" Plug 'thezeroalpha/vim-lf'
Plug 'ptzz/lf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'jiangmiao/auto-pairs'
" Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
" Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim-scripts/Highlight-UnMatched-Brackets'

" Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'SidOfc/mkdx', { 'for': 'markdown' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'easymotion/vim-easymotion'
" Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/vim-auto-save'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.vue'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.vue'
" let g:closetag_filetypes = 'html,xhtml,phtml,js,vue'
" let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,vue'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_regions = {
"             \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"             \ 'javascript.jsx': 'jsxRegion',
"             \ }
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'


let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
syntax enable

" colorscheme ayu
" let ayucolor="mirage"
" colorscheme PaperColor
" set background=dark
colorscheme base16-default-dark

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


" ##################### coc config #######################################

let g:coc_snippet_next = '<S-TAB>'
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
" nmap <leader>qf  <Plug>(coc-fix-current)

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
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"====================================================================================================
"Coc Language Server Client ***End *****
"====================================================================================================
" hi Normal guibg=NONE ctermbg=NONE
" =+=+=+=+====================Setting=========================
if has('folding')
  if has('windows')
    set fillchars=diff:∙               " BULLET OPERATOR (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·              " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
    set fillchars+=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
  endif

  if has('nvim-0.3.1')
    set fillchars+=eob:\              " suppress ~ at EndOfBuffer
  endif

  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
endif


