return {
    'akinsho/bufferline.nvim', 
    dependencies = {
        'catppuccin'
    },
    opts = {
        options = {
            always_show_bufferline = true,
            tab_size = 21,
            buffer_close_icon = "󰅖 ",
            modified_icon = "● ",
            separator_style = 'slope',
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
        }
    },
}
