local common_exclude = {
	"**/node_modules/**",
	"**/dist/**",
	"**/build/**",
	"**/coverage/**",
	"**/.next/**",
	"**/.nuxt/**",
	"**/.svelte-kit/**",
	"**/.turbo/**",
	"**/__pycache__/**",
	"**/.mypy_cache/**",
	"**/.pytest_cache/**",
	"**/.ruff_cache/**",
	"**/.tox/**",
	"**/.nox/**",
	"**/.venv/**",
	"**/venv/**",
	"**/*.egg-info/**",
  "**/.tmp/**"
}

return {
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{
		"folke/snacks.nvim",
		opts = {
			picker = {
				win = {
					input = {
						keys = {
							["<C-l>"] = { "focus_preview", mode = { "i", "n" } },
						},
					},
					list = {
						keys = {
							["<C-l>"] = "focus_preview",
							["l"] = "focus_preview",
						},
					},
						preview = {
							keys = {
								["<C-h>"] = "focus_list",
								["<C-l>"] = "focus_list",
								["h"] = "focus_list",
								["l"] = "focus_list",
							},
						},
					},
				layouts = {
					git_wide = {
						layout = {
							box = "horizontal",
							width = 0.9,
							min_width = 140,
							height = 0.85,
							{
								box = "vertical",
								border = true,
								title = "{title} {live} {flags}",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
							},
							{ win = "preview", title = "{preview}", border = true, width = 0.65 },
						},
					},
				},
				sources = {
					files = {
						hidden = true,
						ignored = true,
						exclude = common_exclude,
					},
					grep = {
						hidden = true,
						ignored = true,
						exclude = common_exclude,
					},
					grep_word = {
						hidden = true,
						ignored = true,
						exclude = common_exclude,
					},
					explorer = {
						hidden = true,
						ignored = true,
						exclude = common_exclude,
					},
					git_diff = {
						layout = { preset = "git_wide" },
					},
					git_log = {
						layout = { preset = "git_wide" },
					},
					git_log_file = {
						layout = { preset = "git_wide" },
					},
					git_log_line = {
						layout = { preset = "git_wide" },
					},
					git_status = {
						layout = { preset = "git_wide" },
					},
				},
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin-latte",
		},
	},
}
