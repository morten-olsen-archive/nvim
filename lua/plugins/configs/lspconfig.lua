local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local M = {}

require("plugins.configs.others").lsp_handlers()

function M.on_attach(client, _)
   client.server_capabilities.document_formatting = false
   client.server_capabilities.document_range_formatting = false

   require("core.mappings").lspconfig()
end

function M.on_attach_formatter(client, _)
   client.server_capabilities.documentFormattingProvider = true
   client.server_capabilities.documentRangeFormattingProvider = true

   require("core.mappings").lspconfig()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
   documentationFormat = { "markdown", "plaintext" },
   snippetSupport = true,
   preselectSupport = true,
   insertReplaceSupport = true,
   labelDetailsSupport = true,
   deprecatedSupport = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   },
}

lspconfig.sumneko_lua.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim", "nvchad" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}

local eslint_config = require("lspconfig.server_configurations.eslint")
lspconfig.eslint.setup {
   on_attach = M.on_attach_formatter,
   capabilities = capabilities,
   opts = {
     cmd = { "yarn", "exec", unpack(eslint_config.default_config.cmd) }
   },
   format = true,
}

lspconfig.tsserver.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,
}

lspconfig.prismals.setup {}

-- requires a file containing user's lspconfigs
local addlsp_confs = nvchad.load_config().plugins.options.lspconfig.setup_lspconf

if #addlsp_confs ~= 0 then
   require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
end

return M
