require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

-- Disable default <leader>e (NvimTree)
del("n", "<leader>e")

-- Custom mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Show diagnostics for current line
map("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show line diagnostics" })

-- Optional: diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

