local util = require("lspconfig/util")
local mappings = require("lsp.custom_attach")

local prettier = {
  formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local luafmt = {
  formatCommand = "luafmt -i 2 -l 80 --stdin",
  formatStdin = true
}

local efmConfig = {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = function(client)
    mappings(client)
    client.resolved_capabilities.document_formatting = true
  end,
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "css",
    "scss",
    "json",
    "html",
    "lua"
  },
  init_options = {documentFormatting = true},
  settings = {
    languages = {
      typescript = {prettier, eslint_d},
      javascript = {prettier, eslint_d},
      typescriptreact = {prettier, eslint_d},
      javascriptreact = {prettier, eslint_d},
      css = {prettier},
      scss = {prettier},
      json = {prettier},
      html = {prettier},
      lua = {luafmt}
    }
  }
}

return efmConfig