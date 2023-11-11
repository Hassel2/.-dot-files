vim.api.nvim_create_autocmd({ "bufnewfile", "bufread" }, {
	pattern = { "*.nix" },
	callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd({ "bufnewfile", "bufread", "bufwinenter" }, {
    pattern = { "*/*ansible*/*.yml" },
    callback = function()
        vim.opt.filetype = "yaml.ansible"
    end,
})

