local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[ augroup Format ]]
    vim.api.nvim_command [[ autocmd! * <buffer> ]]
    vim.api.nvim_command [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[ augroup END]]
  end
end

-- Rust LSP (rust-analyzer)
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  filetypes = { "rust" },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
  single_file_support = true,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      }
    }
  }
}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = nvim_lsp.util.root_pattern("go.work", "go.mod"),
  single_file_support = true,
}

-- JavaScript/TypeScript LSP (tsserver)
nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- Lua LSP (lua_ls)
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

-- HTML autocomplete (emmet_ls)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "ejs" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

-- TailwindCSS LSP (tailwindcss)
nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-", "htmldjango", "edge", "eelixir",
    "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", 'html-eex', "jade", "leaf", "liquid",
    "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass",
    "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact",
    "vue", "svelte", "typescript.tsx", "javascript.jsx" },
  root_dir = nvim_lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
    'postcss.config.ts', 'package.json', 'node_modules', '.git'),
  cmd = { "tailwindcss-language-server", "--stdio" },
}

-- C/C++ LSP (clangd)
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

-- Java LSP (java_language_server)
nvim_lsp.java_language_server.setup {
  on_attach = on_attach,
  filetypes = { "java" },
}
