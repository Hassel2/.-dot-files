return {
    'neovim/nvim-lspconfig',
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )

        local servers = require("plugins.lsp.servers")
        for server_name, settings in pairs(servers) do
            local opts = {
                on_attach = require("plugins.lsp.keymaps"),
                capabilities = capabilities,
            }
            opts = vim.tbl_extend("keep", opts, settings)

            require("lspconfig")[server_name].setup(opts)
        end
    end,
}
