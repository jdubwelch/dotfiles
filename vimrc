set nocompatible              						"We want the latest vim settings and options

so ~/.vim/plugins.vim

syntax enable

"-------------General Settings--------------"
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ' ' 						    	"The default leader is \, but a comma is much better.
set number								"Let's activate line numbers.


set noerrorbells
set noswapfile
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab




"-------------Visuals--------------"
set t_CO=256
let g:onedark_terminal_italics = 1					"Use italics
colorscheme onedark							"Use one dark color theme
set guifont=Dank\ Mono:h17						"MavVim to use Dank Mono font
set linespace=15   						        "Macvim-specific line-height.
set guioptions-=e							"We don't want Gui tabs

" Add a little padding on the side
set foldcolumn=1
"Remove the side bars, search guioptions in help for more info."
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Macros
let @j='%%v%J'      " Join the contents of a bracket/brace/paragraph. 
	

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif





"-------------Search--------------"
set hlsearch
set incsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase				" when searching, 	



"-------------Split Management--------------"
set splitbelow 		"new splits should go below the current one
set splitright		"new horizontal splits should go to the right

nmap <C-J> <C-W><C-J> 	"Control J should do Control W Control J
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>




"-------------Mappings--------------"

"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader>h :nohlsearch<cr>

"Make NERDTree easier to toggle. <D-1> is command 1
nmap <Leader>kb :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" remap the annoying u in visual mode
vmap u y

"toggle between absolute -> relative line number
nnoremap <C-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>

" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap t. :tabclose<CR>

" move tab to first position
nnoremap tF :tabm 0<CR>
nnoremap tL :tabm<CR>




"--------------Plugins--------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'    "don't search in those
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_working_path_mode = 0

nmap <D-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>
nmap <D-p> :CtrlP<cr>




"/
"/ NERDTree
"/




"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Automatically generate ctags on save. ctags git hook must be added. It's in
" my dot file.
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.

" Window Management
" ':sp' splits the window
" ':vsp' splits the window vertically

