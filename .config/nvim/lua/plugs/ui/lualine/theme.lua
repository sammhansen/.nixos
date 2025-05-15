local path = vim.fn.expand("~/.local/state/nvim/colors.lua")

if vim.fn.filereadable(path) then
	colors = dofile(path)
else
	colors = require("lua.conf.ui.colors-fallback")
end

local a = {
	normal = {
		bg = colors.primary_container,
		fg = colors.on_primary_container,
	},
	insert = {
		bg = colors.primary_container,
		fg = colors.on_primary_container,
	},
	command = {
		bg = colors.primary_container,
		fg = colors.on_primary_container,
	},
	visual = {
		bg = colors.primary_container,
		fg = colors.on_primary_container,
	},
	replace = {
		bg = colors.error,
		fg = colors.on_error,
	},
	inactive = {
		bg = colors.surface_container_highest,
		fg = colors.on_surface,
	},
}

local b = {
	bg = colors.tertiary_container,
	fg = colors.on_tertiary_container,
}

local c = {
	bg = "none",
	fg = colors.on_background,
}

local x = {
	bg = "none",
	fg = colors.on_background,
}

local y = {
	bg = colors.tertiary_container,
	fg = colors.on_tertiary_container,
}

local z = {
	bg = colors.primary_container,
	fg = colors.on_primary_container,
}

-- Return your theme configuration
return {
	normal = {
		a = { bg = a.normal.bg, fg = a.normal.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = y.fg },
		z = { bg = z.bg, fg = z.fg },
	},
	insert = {
		a = { bg = a.insert.bg, fg = a.insert.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = y.fg },
		z = { bg = z.bg, fg = z.fg },
	},
	visual = {
		a = { bg = a.visual.bg, fg = a.visual.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = y.fg },
		z = { bg = z.bg, fg = z.fg },
	},
	replace = {
		a = { bg = a.replace.bg, fg = a.replace.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = y.fg },
		z = { bg = z.bg, fg = z.fg },
	},
	command = {
		a = { bg = a.command.bg, fg = a.command.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = x.fg },
		z = { bg = z.bg, fg = z.fg },
	},
	inactive = {
		a = { bg = a.inactive.bg, fg = a.inactive.fg },
		b = { bg = b.bg, fg = b.fg },
		c = { bg = c.bg, fg = c.fg },
		x = { bg = x.bg, fg = x.fg },
		y = { bg = y.bg, fg = y.fg },
		z = { bg = z.bg, fg = z.fg },
	},
}
