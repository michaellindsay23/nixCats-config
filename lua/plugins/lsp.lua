return {
  "neovim/nvim-lspconfig"
  dependencies = {
    "williamboman/mason.nvim", -- Recommended for managing language servers
    "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
    -- Other LSP-related plugins like nvim-cmp, luasnip, etc.
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",  -- Lua language server
      },
    })

    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
