function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-t>", ":NvimTreeToggle<CR>")
map("n", "<C-f>", ":NvimTreeFocus<CR>")
map("n", "H", ":BufferLineCyclePrev<CR>")
map("n", "L", ":BufferLineCycleNext<CR>")
