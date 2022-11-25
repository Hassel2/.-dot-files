-- local servers = { 'ccls', 'gopls', 'cssls', 'html', 'rust_analyzer', 'pyright', 'tsserver', 'flow', 'intelephense', 'csharp_ls'}
local servers = {
	-- python
	pyright = {},
    -- c/c++
	ccls = {
		filetypes = { "c", "cpp", "objc", "pbjcpp" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
		autostart = true,
		single_file_support = true,
	},
    -- php
	intelephense = {
		filetypes = { "php" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
		autostart = true,
	},
	-- typescritp, javasript
	tsserver = {
		filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
		autostart = true,
	},
	-- html
    html = {},
	-- css
    cssls = {},
	-- gopls
	gopls = {
		filetypes = { "go" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
		autostart = true,
	},
}

return servers
