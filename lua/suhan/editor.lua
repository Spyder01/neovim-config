Editor = {}

-- display functions 
function Editor.transparent_background () 
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })            -- For inactive windows
	vim.api.nvim_set_hl(0, 'NonText', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })         -- For floating windows
	vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE' })         -- For borders of floating windows
	vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE' })           -- For vertical splits
	vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'NONE' })        -- For window separators
	vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })      -- For nvim-tree
	vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'NONE' }) -- For the end of buffer in nvim-tree
	vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NONE' })          -- For status line
	vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NONE' })        -- For inactive status line
end


function Editor.match_paren() 
	vim.g.loaded_matchparen = true
end


-- Autocomplete function for enclosing characters with optional indentation
function Editor.complete_scope (start, ending, config)

  ending = ending or start
	config = config or {}

  local replacer = start
  local _indent = config.indent or 0
	local new_line = config.new_line or false

	if not (_indent%2 == 0) then  
		_indent = _indent - 1
	end

	if new_line then
		replacer = replacer .. '<CR>'
	end

  if _indent > 0 then
    replacer = replacer .. string.rep(' ', _indent)
  end
	
	if new_line then
		replacer = replacer .. '<Esc>o'
	end
  replacer = replacer .. ending .. '<Left>'
	
	if _indent > 0 then
		replacer = replacer .. string.rep('<Left>', _indent/2) 
	end

	if new_line then 
		replacer = replacer .. '<Esc>k' .. string.rep(' ', _indent) .. '<Esc>a'
	end
	
  vim.api.nvim_set_keymap('i', start, replacer, { noremap = true, silent = true })
end


--appearance
vim.cmd[[colorscheme tokyonight]]
vim.cmd[[highlight Identifier guifg=#ff0000 gui=bold]]
Editor.transparent_background()


vim.opt.relativenumber = true
vim.opt.tabstop =  2
vim.opt.shiftwidth =  2

-- autocomplete

Editor.complete_scope('\"')
Editor.complete_scope('`')
Editor.complete_scope('\'')
Editor.complete_scope('{', '}', { new_line = true, indent = 2 })
Editor.complete_scope('(', ')', { should_repeat = false })
Editor.complete_scope('[', ']')
Editor.complete_scope('<', '>')
Editor.match_paren()

return Editor

