-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'williamboman/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'williamboman/mason-lspconfig.nvim' },

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        'lua_ls',
        'clangd',
        'pyright', -- requires node to used
        'bashls', -- requires npm to be installed
        'yamlls', -- requires npm to be installed
        'lemminx',
        'marksman',
        'quick_lint_js',
        'cssls', -- requires npm to be installed
        'html', -- requires npm to be installed
        'jsonls', -- requires npm to be installed
      },
      automatic_installation = true,
      automatic_enable = {
          exclude = {
              "lua_ls"
          }
      }
    })

    local lspconfig = require('lspconfig')
    --(Not needed anymore since from nvim 0.11.0+ 'automatic_enable' is true by default)
    -- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- local lsp_attach = function(client, bufnr)
    --   -- Create your keybindings here...
    -- end
    -- Call setup on each LSP server
    -- require('mason-lspconfig').setup_handlers({
    --   function(server_name)
    --     lspconfig[server_name].setup({
    --       on_attach = lsp_attach,
    --       capabilities = lsp_capabilities,
    --     })
    --   end
    -- })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }

    --(Not needed anymore if there is customization since from nvim 0.11.0+ 'automatic_enable' is true by default)
    -- Setup all other LSPs
    -- lspconfig.clangd.setup {capabilities = lsp_capabilities}
    -- lspconfig.pyright.setup {capabilities = lsp_capabilities}
    -- lspconfig.bashls.setup {capabilities = lsp_capabilities}
    -- lspconfig.yamlls.setup {capabilities = lsp_capabilities}
    -- lspconfig.lemminx.setup {capabilities = lsp_capabilities}
    -- lspconfig.marksman.setup {capabilities = lsp_capabilities}
    -- lspconfig.quick_lint_js.setup {capabilities = lsp_capabilities}
    -- lspconfig.cssls.setup {capabilities = lsp_capabilities}
    -- lspconfig.html.setup {capabilities = lsp_capabilities}
    -- lspconfig.jsonls.setup {capabilities = lsp_capabilities}

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview_base = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview_base(contents, syntax, opts, ...)
    end

    -- Turn off LSP log by default to conserve disk space
    -- comment this out if log is needed for debugging
    vim.lsp.set_log_level("off")
  end
}

