-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
-- Add any additional keymaps here.

vim.keymap.set("n", "<leader>br", "<cmd>checktime<cr>", { desc = "Reload Buffer" })
vim.keymap.set("n", "<leader>bR", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
