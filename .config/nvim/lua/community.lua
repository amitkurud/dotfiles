---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- languages

  -- backend

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.zig" },

  -- frontend

  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },

  --below is the ui config from astro community
  { import = "astrocommunity.colorscheme.catppuccin" },
  --{ import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },

  -- utilities
  { import = "astrocommunity.quickfix.quicker-nvim" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },

  { import = "astrocommunity.utility.live-server-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.docker.lazydocker" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },

  { import = "astrocommunity.lsp.actions-preview-nvim" },
}
