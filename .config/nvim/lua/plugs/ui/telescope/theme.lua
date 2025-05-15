local path = vim.fn.expand("~/.local/state/nvim/colors.lua")

local colors

if vim.fn.filereadable(path) == 1 then
	colors = dofile(path)
else
	colors = require("conf.ui.colors-fallback")
end

local prompt_bg = colors.background
local prompt_accent = colors.primary_container
local results_bg = colors.background
local results_accent = colors.on_primary_fixed
local preview_bg = colors.background
local preview_accent = colors.tertiary_container

local normal_hl = vim.api.nvim_get_hl_by_name("Normal", true)

----------------------------------------------------------------------
--                              Prompt                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {
	fg = prompt_bg,
	bg = prompt_bg,
})

vim.api.nvim_set_hl(0, "TelescopePromptNormal", {
	fg = normal_hl.foreground,
	bg = prompt_bg,
})

vim.api.nvim_set_hl(0, "TelescopePromptTitle", {
	fg = normal_hl.foreground,
	bg = prompt_accent,
})

vim.api.nvim_set_hl(0, "TelescopePromptCounter", {
	fg = prompt_accent,
	bg = prompt_bg,
})

vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
	fg = prompt_accent,
	bg = prompt_bg,
})

----------------------------------------------------------------------
--                              Result                              --
----------------------------------------------------------------------
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {
	fg = results_bg,
	bg = results_bg,
})

vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {
	fg = normal_hl.foreground,
	bg = results_bg,
})

vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {
	fg = normal_hl.foreground,
	bg = results_accent,
})

vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {
	fg = results_accent,
	bg = results_bg, -- manually chosen fallback background
})

----------------------------------------------------------------------
--                             Preview                              --
----------------------------------------------------------------------

vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {
	fg = preview_bg,
	bg = preview_bg,
})

vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {
	fg = normal_hl.foreground,
	bg = preview_bg,
})

vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {
	fg = normal_hl.foreground,
	bg = preview_accent,
})
