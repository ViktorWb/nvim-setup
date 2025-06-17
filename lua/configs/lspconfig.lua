-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "tsserver", "pyright", "jdtls", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>:Prettier<CR>", { noremap=true, silent=true })
      else
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap=true, silent=true })
      end
    nvlsp.on_attach(client, bufnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy"
            }
        },
    }
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
