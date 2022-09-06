let mapleader = ","
" let g:molokai_original = 1

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
syntax on
set nocompatible
set hlsearch
set number relativenumber
set laststatus=2
set vb
set ruler
set spelllang=en_us
set autoindent
" set colorcolumn=100
set mouse=a
set clipboard=unnamed
set noscrollbind
set wildmenu
set autochdir

hi Search cterm=NONE ctermfg=black ctermbg=red

" No more Arrow Keys, deal with it
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" netrw

nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

"-- netrw ENDD

" NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"-- NERDTree END

" plug 
call plug#begin('~/.config/nvim/plugged')
"> Must Have
Plug 'preservim/nerdtree'      " https://github.com/preservim/nerdtree
Plug 'nvim-lua/plenary.nvim'   " Telescope Dep
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " https://github.com/nvim-telescope/telescope.nvim
Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim:
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'tpope/vim-fugitive'      " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'airblade/vim-gitgutter'  " https://github.com/airblade/vim-gitgutter

"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim
Plug 'SirVer/ultisnips'                             " https://github.com/sirver/UltiSnips

"> Theme
Plug 'NLKNguyen/papercolor-theme' " https://github.com/NLKNguyen/papercolor-theme
" Plug 'tomasiser/vim-code-dark'    " https://github.com/tomasiser/vim-code-dark
call plug#end()

"-- plug END

" fugitive 
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" fugitive END

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" -- Telescope END

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END

" papercolor-theme

set termguicolors
set background=dark
colorscheme PaperColor

"-- papercolor-theme END

"-- vim-go specific configuration

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t <Plug>(go-test)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*'.&commentstring[0]

let g:go_list_type = "quickfix"    " error lists are of type quickfix
let g:go_fmt_command = "goimports" " automatically format and rewrite imports
let g:go_auto_sameids = 1          " highlight matching identifiers

"-- vim-go specific configuration (END)

"-- coc.nvim specific configuration

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

