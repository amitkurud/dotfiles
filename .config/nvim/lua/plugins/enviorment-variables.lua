return {
  "philosofonusus/ecolog.nvim",
  dependencies = {
    "nvimdev/lspsaga.nvim",
    "hrsh7th/nvim-cmp", -- Optional: for autocompletion support (recommended)
  },
  -- Optional: you can add some keybindings
  -- (I personally use lspsaga so check out lspsaga integration or lsp integration for a smoother experience without separate keybindings)
  keys = {
    { "<leader>Ne", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
    { "<leader>Np", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
    { "<leader>Ns", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
  },
  lazy = false,
  opts = {
    -- Enables shelter mode for sensitive values
    shelter = {
      configuration = {
        partial_mode = false, -- false by default, disables partial mode, for more control check out shelter partial mode
        mask_char = "*", -- Character used for masking
      },
      modules = {
        cmp = true, -- Mask values in completion
        peek = false, -- Mask values in peek view
        files = false, -- Mask values in files
        telescope = false, -- Mask values in telescope
      },
    },
    -- true by default, enables built-in types (database_url, url, etc.)
    types = true,
    path = vim.fn.getcwd(), -- Path to search for .env files
    preferred_environment = "development", -- Optional: prioritize specific env files
  },
}
