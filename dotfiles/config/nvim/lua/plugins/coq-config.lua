return function()
  vim.g.coq_settings = {
    -- auto_start = 'shut-up',
    ["keymap.jump_to_mark"] = "<c-j>",
    ["keymap.bigger_preview"] = "<c-b>",
--     ["clients.buffers.enabled"] = false,
--     ["clients.snippets.enabled"] = false,
--     ["clients.tmux.enabled"] = false,
    ["clients.tree_sitter.enabled"] = false,
  }
end
