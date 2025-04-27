local on_attach = require("plugins.configs.lspconfig").on_attach
local cap = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- Python LSP configs
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = cap,
  filetypes = { "python" },
}
lspconfig.spectral.setup {
  on_attach = on_attach,
  capabilities = cap,
  filetypes = { "yaml", "yml", "json" },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = cap,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
}

lspconfig.eslint.setup {
  --- ...
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

-- Typescript LSP configs
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = cap,
  init_options = {
    preferences = {
      disableSuggestions = false,
      organize_imports_on_format = true,
      importModuleSpecifierPreference = "relative",
      importModuleSpecifierEnding = "minimal",
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = cap,
  filetypes = { "java" },
  cmd = { "jdtls" },
}

lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  on_attach = on_attach,
  capabilities = cap,
}

-- configure svelte language server
lspconfig.svelte.setup {
  cmd = { "svelteserver", "--stdio" },
  filetypes = { "svelte" },
  on_attach = on_attach,
  capabilities = cap,
}

-- configure html language server
lspconfig.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  on_attach = on_attach,
  capabilities = cap,
}

-- C# LSP configs
lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = cap,
  filetypes = { "cs" },
  cmd = { "dotnet", "/home/none/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,
  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,
  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = false,
  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,
  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,
  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,
  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
}
