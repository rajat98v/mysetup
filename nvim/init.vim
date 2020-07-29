map <Space> <Leader>

noremap <Leader>y "+y
noremap <Leader>Y "*y
inoremap kj <Esc>

set number
set relativenumber


call plug#begin('/home/rajatv/mysetup/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'wincent/command-t'
Plug 'wincent/loupe'
Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set background=dark
colorscheme PaperColor

:lua << END
require'nvim_lsp'.rust_analyzer.setup{}
END

nnoremap <silent>gi    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>h     <cmd>lua vim.lsp.buf.hover()<CR>

"set omnifunc=lsp#omnifunc
let settings = {
          \   "pyls" : {
          \     "enable" : v:true,
          \     "trace" : { "server" : "verbose", },
          \     "commandPath" : "",
          \     "configurationSources" : [ "pycodestyle" ],
          \     "plugins" : {
          \       "jedi_completion" : { "enabled" : v:true, },
          \       "jedi_hover" : { "enabled" : v:true, },
          \       "jedi_references" : { "enabled" : v:true, },
          \       "jedi_signature_help" : { "enabled" : v:true, },
          \       "jedi_symbols" : {
          \         "enabled" : v:true,
          \         "all_scopes" : v:true,
          \       },
          \       "mccabe" : {
          \         "enabled" : v:true,
          \         "threshold" : 15,
          \       },
          \       "preload" : { "enabled" : v:true, },
          \       "pycodestyle" : { "enabled" : v:true, },
          \       "pydocstyle" : {
          \         "enabled" : v:false,
          \         "match" : "(?!test_).*\\.py",
          \         "matchDir" : "[^\\.].*",
          \       },
          \       "pyflakes" : { "enabled" : v:true, },
          \       "rope_completion" : { "enabled" : v:true, },
          \       "yapf" : { "enabled" : v:true, },
          \     }}}
:lua << END
require'nvim_lsp'.pyls.setup{setting}
END


" disable preview window
set completeopt-=preview

" use omni completion provided by lsp
set omnifunc=lsp#omnifunc
