return {
	"nvim-treesitter/nvim-treesitter",
    version = false,
	build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = { 
			"c",
			"cpp",
			"lua",
			"go",
			"css",
			"dockerfile",
			"fish",
			"bash",
			"help",
			"json",
			"make",
			"markdown",
			"php",
			"python",
			"vue",
			"sql",
			"javascript",
			"html"
		},
		sync_install = true,
		auto_install = true,
		highlight = {
			enable=true,
			additional_vim_regex_highlighting = false,
		}
	},
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
