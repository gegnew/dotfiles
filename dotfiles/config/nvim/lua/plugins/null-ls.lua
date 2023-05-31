local null_ls = require("null-ls")

local b = null_ls.builtins

require("null-ls").setup({
  sources = {
    -- webdev stuff
    b.formatting.prettierd,

    -- Lua
    b.formatting.stylua,

    -- markdown
    b.diagnostics.write_good,

    -- Shell
    b.formatting.shfmt.with({ extra_args = { "-i", "4" } }),
    b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

    -- JSON
    b.formatting.fixjson,

    -- python
    b.formatting.black, --.with { extra_args = { "--fast" } },
    b.formatting.ruff,
    b.diagnostics.flake8,
    null_ls.builtins.diagnostics.ruff,
    b.formatting.isort.with({ extra_args = { "--style=black" } }),

    -- b.diagnostics.tsc

    --  hover
    b.hover.dictionary,

    -- code actions
    b.code_actions.gitsigns,
    b.code_actions.gitrebase,

    -- Other
    b.diagnostics.actionlint,
  },
})
