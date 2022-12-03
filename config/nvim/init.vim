call plug#begin()
	" Colorscheme for red-eyed
	" Plug 'eddyekofo94/gruvbox-flat.nvim'
	" Plug 'morhetz/gruvbox'
	Plug 'ellisonleao/gruvbox.nvim'
	" Bottom statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Returns you to the place where you were before closing
	Plug 'farmergreg/vim-lastplace'
	" Fuzzzzzy finder but in nvim
	Plug 'junegunn/fzf.vim'
	" A \"Buffer and tab\" tabline
	Plug 'mkitt/tabline.vim'
	" Woow, LSP in geek-only unuserfriendly NEOVIM
	Plug 'neovim/nvim-lspconfig'
	" Autocompletition plugin
	Plug 'hrsh7th/nvim-cmp'
	" LSP source for nvim-cmp
	Plug 'hrsh7th/cmp-nvim-lsp'
	" Snipet source for nvim-cmp
	Plug 'saadparwaiz1/cmp_luasnip'
	" Wow, sniiipets!
	Plug 'L3MON4D3/LuaSnip'
	" With this plugin #B8BB26 have a gruvbox-green background
	Plug 'ap/vim-css-color'
	" Easy tab and win navigation
	Plug 't9md/vim-choosewin'
	" Sexy comments for your languges
	Plug 'preservim/nerdcommenter'
	" Autoclosing for html tags
	Plug 'alvan/vim-closetag'
	" Autoclosing for parentheses, quotes, brackets and etc.
	Plug 'jiangmiao/auto-pairs'
	" Different colors for parentheses, quotes, brackets and etc.
	Plug 'luochen1990/rainbow'
	" Multi language syntax highlightning
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Refactoring with nvim treesitter
	Plug 'nvim-treesitter/nvim-treesitter-refactor'
	" Show current context
	Plug 'nvim-treesitter/nvim-treesitter-context'
	" Just a tagbar
	Plug 'majutsushi/tagbar'
	" Diff visualiser
	Plug 'mhinz/vim-signify'
	" Plugins for writing texts
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/limelight.vim'
	" Nvim-tree
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'nvim-tree/nvim-tree.lua'
	" Eye-candy
	Plug 'j-hui/fidget.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

	set cursorline
	set cc=80,120
	set number
	set ruler
	set encoding=UTF-8
	set mouse=a
	set modifiable
	set nowrap
	set shiftwidth=4
	set softtabstop=4
	set tabstop=4

	noremap <A-f> :Files<cr>
	noremap <A-S-f> :vsplit<cr> :Files<cr
	noremap <C-m> :TagbarToggle<CR>
	nnoremap <C-t> :NvimTreeToggle<CR>
	nnoremap <C-f> :NvimTreeFocus<CR>
	nmap - <plug>(choosewin)
	nmap <leader><tab> <plug>(fzf-maps-n)
	xmap <leader><tab> <plug>(fzf-maps-x)
	omap <leader><tab> <plug>(fzf-maps-o)
	imap <leader><tab> <plug>(fzf-maps-i)

" Bracets coloring
let g:rainbow_active = 1

" NERD comments {
	" Create default mappings
	let g:NERDCreateDefaultMappings = 1
	" Add spaces after comment delimiters by default
	let g:NERDSpaceDelims = 1
	" Use compact syntax for prettified multi-line comments
	let g:NERDCompactSexyComs = 1
	" Align line-wise comment delimiters flush left instead of following code indentation
	let g:NERDDefaultAlign = 'left'
	" Set a language to use its alternate delimiters by default
	let g:NERDAltDelims_java = 1
	" Allow commenting and inverting empty lines (useful when commenting a region)
	let g:NERDCommentEmptyLines = 1
	" Enable trimming of trailing whitespace when uncommenting
	let g:NERDTrimTrailingWhitespace = 1
	" Enable NERDCommenterToggle to check all selected lines is commented or not 
	let g:NERDToggleCheckAllLines = 1
" }

" Indent guides {
	let g:indentguides_spacechar = '┆'
	let g:indentguides_tabchar = '|'
" }

" Tabs appearence {
	hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
	hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
	hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
" }

"workspace
	let g:workspace_autocreate = 1

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command Huy call SynStack()

lua require "plugins-conf"
lua require "lsp-conf"
