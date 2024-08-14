local lsp_config = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language specific lsp definations
function go_lsp ()
	lsp_config.gopls.setup{
			capabilities = capabilities,
			cmd = {"gopls"},
			filetypes = {"go", "gomod"},
			root_dir = require('lspconfig').util.root_pattern("go.mod", ".git"),
			settings = {
					gopls = {
							analyses = {
									unusedparams = true,  -- Enable unused parameter analysis
							},
							staticcheck = true,  -- Enable staticcheck integration
					},
			},
	}
end

function lua_lsp () 
	lsp_config.lua_ls.setup({
  settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using
					version = 'LuaJIT',
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {'vim'},
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

function c_lsp () 
	lsp_config.clangd.setup {
		-- capabilities = capabilities,
		cmd = { "clangd", "--compile-commands-dir=." },
		filetypes = {
			"c", "h"
		},
		on_attach = function(client, bufnr)
  end
}

end

-- call lsps
go_lsp()
lua_lsp()
c_lsp()

