return {
	"L3MON4D3/LuaSnip",
    -- follow latest release.
	version = "<CurrentMajor>.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
}
