return {
    {
      "echasnovski/mini.pairs",
      config = function(_, opts)
        require("mini.pairs").setup(opts)
      end,
    },
    {
      "echasnovski/mini.move",
      config = function(_, opts)
        require("mini.move").setup(opts)
      end,
    },
    {
      "echasnovski/mini.comment",
      config = function(_, opts)
        require("mini.comment").setup(opts)
      end,
    }
}
