call plug#begin('~/AppData/Local/nvim/plugged')
"add the plugin you want to use here.
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jparise/vim-graphql'
Plug 'preservim/nerdcommenter'
Plug 'kristijanhusak/defx-git'
Plug 'folke/todo-comments.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
Plug 'ap/vim-css-color'
Plug 'iCyMind/NeoSolarized'
Plug 'tribela/vim-transparent'
Plug 'frazrepo/vim-rainbow'
call plug#end()


au BufNewFile,BufRead *.prisma setfiletype graphql
"Configration
set encoding=UTF-8
let g:rainbow_active = 1

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000


set path+=**
set wildignore+=*/node_modules/*
set ignorecase
set cursorline
set smarttab
set number
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set background=dark

filetype plugin on

" theme
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
	"colorscheme gruvbox	
endif


nnoremap <silent>sf :<C-u>Defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>
nnoremap <silent>fi :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })



"Coc
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
	  "Recently vim can merge signcolumn and number column into one
		set signcolumn=number
		else
		set signcolumn=yes
		endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
	  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction


if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
		  inoremap <silent><expr <>c-@> coc#refresh()
		endif

if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
		  inoremap <silent><expr> <c-@> coc#refresh()
		endif

nmap <silent> gj <Plug>(coc-diagnostic-prev)
nmap <silent> gk <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
		else
		call feedkeys('K', 'in')
		endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	  autocmd!
		  " Setup formatexpr specified filetype(s).
			autocmd FileType typescript,json setl
			"formatexpr=CocAction('formatSelected')
			" Update signature help on jump placeholder.
			autocmd User CocJumpPlaceholder call
			"CocActionAsync('showSignatureHelp')
augroup end"

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)



if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

						" Use CTRL-S for selections ranges.
						" " Requires 'textDocument/selectionRange' support of language
						" server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
						"
						"" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

						" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
						"
						"" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

						" Add (Neo)Vim's native statusline support.
						" " NOTE: Please see `:h coc-status` for integrations with
						" external plugins that
						" " provide custom statusline: lightline.vim, vim-airline.
						" set
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
						"" Mappings for CoCList
						"Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
						" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
						" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
						" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
						" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-uCocList -I symbols<>cr>
						" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
						" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
						" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



lua << EOF
require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

require('lualine').setup {
	options = {
		    icons_enabled = true,
				    theme = 'solarized_dark',
						    component_separators = { left = '', right = '' },
								    section_separators = { left = '', right = '' },
										    disabled_filetypes = {},
												    always_divide_middle = true,
														    globalstatus = false,
																  
		},
	sections = {
		    lualine_a = {'mode'},
				    lualine_b = {'branch', 'diff'},
						    lualine_c = {'filename'},
								    lualine_x = {'encoding', 'fileformat', 'filetype'},
										    lualine_y = {'progress'},
												    lualine_z = {'location'}
														  
		},
	inactive_sections = {
		    lualine_a = {},
				    lualine_b = {},
						    lualine_c = {'filename'},
								    lualine_x = {'location'},
										    lualine_y = {},
												    lualine_z = {}
														  
		},
	  tabline = {},
		  extensions = {'fugitive'}
			
	}

local telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup{
  defaults = {
    mappings = {
    },
  }
}



require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
    additional_vim_regex_highlighting = true,
		disable = {},
  },
	rainbow = {
		enable = true,
	},
  indent = {
    enable = true,
    disable = {},
	},
ensure_installed = {
    "tsx",
    "json",
    "html",
    "scss",
		"css",
  },
autotag = {
    enable = true,
  },

}


EOF
nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
