vim.g.leader = " "

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })

-- fterm
vim.keymap.set("n", "<leader>ft", "<CMD>lua require('FTerm').toggle()<CR>", { desc = "Toggle FTerm" })

-- Neotree
vim.keymap.set("n", "<leader>ee", "<CMD>Neotree position=left<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>fe", "<CMD>Neotree position=float<CR>", { desc = "Toggle Floating Neotree" })
