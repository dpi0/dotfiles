local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("lazy").setup({
	spec = {
		{
			"rebelot/kanagawa.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			},
		},
		{
			"nvim-mini/mini.icons",
			opts = {},
		},
		{
			"ibhagwan/fzf-lua",
			config = function(_, opts)
				require("fzf-lua").setup(opts)
				require("fzf-lua").register_ui_select() -- Register as the vim.ui.select for many actions
			end,
			opts = {
				keymap = {
					builtin = {
						true,
						["<C-d>"] = "preview-page-down",
						["<C-u>"] = "preview-page-up",
					},
					fzf = {
						true,
						["ctrl-d"] = "preview-page-down",
						["ctrl-u"] = "preview-page-up",
						["ctrl-q"] = "select-all+accept",
					},
				},
				winopts = { preview = { vertical = "right:45%", layout = "vertical" } },
				fzf_opts = { ["--cycle"] = true },
				files = { cmd = "fd --type f --strip-cwd-prefix --hidden --exclude .git" },
				live_grep = { cmd = "rg --vimgrep --smart-case --hidden --glob '!.git'" },
			},
			keys = {
        -- stylua: ignore start
        { "ff", function() require("fzf-lua").files() end, desc = "FzfLua: Find Files" },
        { "fj", function() require("fzf-lua").git_files() end, desc = "FzfLua: Find Git Files" },
        { "fg", function() require("fzf-lua").live_grep({ winopts = { preview = { layout = "horizontal", horizontal = 'down:60%' } } }) end, desc = "FzfLua: Grep" },
        { "fz", function() require("fzf-lua").zoxide() end, desc = "FzfLua: Zoxide" },
        { "fr", function() require("fzf-lua").oldfiles() end, desc = "FzfLua: Old Files" },
        { "fc", function() require("fzf-lua").lsp_code_actions() end, desc = "FzfLua: LSP Code Actions" },
        { "fh", function() require("fzf-lua").help_tags({ winopts = { preview = { layout = "horizontal", horizontal = 'down:60%' } } }) end, desc = "FzfLua: Browse Help" },
        { "fK", function() require("fzf-lua").keymaps({ winopts = { preview = { layout = "horizontal", horizontal = 'down:60%' } } }) end, desc = "FzfLua: Browse Keybinds" },
        { "fq", function() require("fzf-lua").quickfix({ winopts = { preview = { layout = "horizontal", horizontal = 'down:60%' } } }) end, desc = "FzfLua: Quickfix List" },
        { "fd", function() require("fzf-lua").diagnostics_document({ winopts = { preview = { layout = "horizontal", horizontal = 'down:50%' } } }) end, desc = "FzfLua: Buffer Diagnostics" },
        { "fD", function() require("fzf-lua").diagnostics_workspace({ winopts = { preview = { layout = "horizontal", horizontal = 'down:50%' } } }) end, desc = "FzfLua: Project Diagnostics" },
        { "fk", function() require("fzf-lua").git_commits({ winopts = { preview = { layout = "horizontal", horizontal = 'down:70%' } } }) end, desc = "FzfLua: Git Commits" },
        { "fzf", function() require("fzf-lua").builtin() end, desc = "FzfLua: FZF" },
        { "gjr", function() require("fzf-lua").lsp_references() end, desc = "FzfLua: LSP References" },
        { "gji", function() require("fzf-lua").lsp_implementations() end, desc = "FzfLua: LSP Implementations" },
        { "<leader>.", function() require("fzf-lua").buffers() end, desc = "FzfLua: List Opened Buffers" },
        { "<leader>/", function() require("fzf-lua").blines({ winopts = { preview = { layout = "horizontal", horizontal = 'down:50%' } } }) end, desc = "FzfLua: Fuzzy Search Buffer" },
				-- stylua: ignore end
			},
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},
		{
			"folke/flash.nvim",
			opts = {},
			keys = {
				{
					"s",
					function()
						require("flash").jump()
					end,
					mode = { "n", "x", "o" },
					desc = "Flash: Jump",
				},
			},
			config = function()
        -- stylua: ignore start
        vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#b15800", bold = true })
        vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#fef969", bold = true })
        vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#00bbbb", bold = true })
        vim.api.nvim_set_hl(0, "FlashCursor", { fg = "#00FF00", bold = true })
				-- stylua: ignore end
			end,
		},
		{
			"stevearc/oil.nvim",
			lazy = false,
			opts = {
				default_file_explorer = true,
				columns = { "icon", "size", "mtime" },
				view_options = {
					show_hidden = true,
					natural_order = true,
					is_always_hidden = function(name)
						return name == ".." or name == ".git"
					end,
				},
				use_default_keymaps = true,
				keymaps = {
					["<C-h>"] = false, -- Messes with the split pane switching
					["<C-l>"] = false,
					["q"] = "actions.close",
					["<S-l>"] = "actions.select", -- go forwards ->
					["<S-h>"] = "actions.parent", -- go backwards <-
					["<C-p>"] = "actions.preview",
					["<C-r>"] = "actions.refresh",
				},
			},
			keys = {
        -- stylua: ignore start
        { "<leader><leader>", "<cmd>Oil<cr>", desc = "Oil: Launch" },
				-- stylua: ignore end
			},
		},
		{
			"lewis6991/gitsigns.nvim",
			event = { "BufReadPre", "BufNewFile" },
			opts = {
				on_attach = function(b)
					local g = require("gitsigns")
					local map = function(mode, l, r, d)
						vim.keymap.set(mode, l, r, { buffer = b, desc = d })
					end

          -- stylua: ignore start
          map("n","gn",g.next_hunk,"Gitsigns: Next Hunk")
          map("n","gp",g.prev_hunk,"Gitsigns: Prev Hunk")
          map("n","gk",g.reset_hunk,"Gitsigns: Reset Hunk")
          map("v","gr",function() g.reset_hunk({vim.fn.line("."),vim.fn.line("v")}) end,"Gitsigns: Reset Hunk")
          map("n","<leader>hs",g.stage_hunk,"Gitsigns: Stage Hunk")
          map("n","<leader>hS",g.undo_stage_hunk,"Gitsigns: Undo Stage Hunk")
          map("n","<leader>hP",g.preview_hunk,"Gitsigns: Preview Hunk")
          map("n","<leader>hB",g.toggle_current_line_blame,"Gitsigns: Toggle Line Blame")
          map("v","<leader>hs",function() g.stage_hunk({vim.fn.line("."),vim.fn.line("v")}) end,"Gitsigns: Stage Hunk")
					-- stylua: ignore end
				end,
			},
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {},
		},
		{
			"folke/snacks.nvim",
			priority = 1000,
			lazy = false,
			opts = {
				indent = {
					enabled = true,
					animate = {
						enabled = vim.fn.has("nvim-0.10") == 1,
						style = "out",
						easing = "linear",
						duration = { step = 5, total = 200 },
					},
				},
				quickfile = {},
				image = { doc = { inline = false } },
				input = {},
				notifier = {
					timeout = 3000,
					width = { min = 60, max = 0.9 },
					height = { min = 1, max = 0.6 },
					margin = { top = 0, right = 1, bottom = 0 },
					padding = true,
				},
				lazygit = {
					enabled = true,
					theme = { selectedLineBgColor = { bg = "CursorLine" } },
					size = { width = 1, height = 1 },
				},
				styles = { lazygit = { width = 0, height = 0 } },
			},
			keys = {
        -- stylua: ignore start
        { "<leader>z", function() require("snacks").lazygit({ size = { width = 1, height = 1 } }) end, desc = "Snacks: Launch Lazygit" },
				-- stylua: ignore end
			},
		},
		{
			"saghen/blink.cmp",
			event = "InsertEnter",
			version = "1.*",
			dependencies = { "rafamadriz/friendly-snippets" },
			opts = {
				keymap = {
					preset = "default",
					["<Enter>"] = { "accept", "fallback" },
					["<A-j>"] = { "accept", "fallback" },
				},
				appearance = { nerd_font_variant = "mono" },
				completion = { documentation = { auto_show = true } },
				signature = { enabled = true },
				sources = { default = { "lsp", "path", "snippets", "buffer" } },
				fuzzy = { implementation = "prefer_rust_with_warning" },
			},
			opts_extend = { "sources.default" },
		},
		{
			dir = "~/projects/neovim/hooks.nvim",
			keys = {
        -- stylua: ignore start
        { "<leader>ha", function() require("hooks").append() end, desc = "Hooks: Append current buffer" },
        { "<leader>hl", function() require("hooks").list() end, desc = "Hooks: List buffers" },
        { "<leader>1", function() require("hooks").buffer(1) end, desc = "Hooks: Buffer 1" },
        { "<leader>2", function() require("hooks").buffer(2) end, desc = "Hooks: Buffer 2" },
        { "<leader>3", function() require("hooks").buffer(3) end, desc = "Hooks: Buffer 3" },
        { "<leader>4", function() require("hooks").buffer(4) end, desc = "Hooks: Buffer 4" },
        { "<leader>0", function() require("hooks").buffer(5) end, desc = "Hooks: Buffer 5" },
        { "<leader>9", function() require("hooks").buffer(6) end, desc = "Hooks: Buffer 6" },
				-- stylua: ignore end
			},
		},
		{
			dir = "~/projects/neovim/ddf.nvim",
			opts = {
				width = 0.5, -- width of the screen (default = 1.0, meaning 100% of the available region)
				height = 1.0, -- height of the screen (default = 1.0, meaning 100% of the available region)
				position = "center", -- position of the screen (default = center, available: left/right/top/bottom/center)
			},
			keys = {
        -- stylua: ignore start
        { 'gd', function() require('ddf').show_diff() end, desc = 'Git diff (delta) for current file', },
				-- stylua: ignore end
			},
		},
		{
			"gbprod/substitute.nvim",
			opts = {},
			keys = {
        -- stylua: ignore start
        { "q",  function() require("substitute").operator() end, mode = "n", desc = "Substitute: Operator" },
        { "q",  function() require("substitute").visual() end, mode = "x", desc = "Substitute: Selection" },
				-- stylua: ignore end
			},
		},
		{
			"echasnovski/mini.comment",
			version = "*",
			-- keys = {
			-- 	{ "<leader>c", mode = { "n", "x" } },
			-- },
			opts = {
				options = {
					ignore_blank_line = true,
					start_of_line = false,
					pad_comment_parts = true,
				},
				mappings = {
					comment = "<leader>c",
					comment_line = "<leader>cc",
					comment_visual = "<leader>c",
					textobject = "<leader>c",
				},
			},
		},
		{
			"echasnovski/mini.move",
			version = "*",
			keys = {
				{ "<M-h>", mode = { "n", "x" } },
				{ "<M-l>", mode = { "n", "x" } },
				{ "<M-j>", mode = { "n", "x" } },
				{ "<M-k>", mode = { "n", "x" } },
			},
			opts = {
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",
					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},
				options = { reindent_linewise = true },
			},
		},
		{
			"jake-stewart/multicursor.nvim",
			branch = "1.0",
			opts = {},
			keys = {
        -- stylua: ignore start
        { "<A-S-k>", function() require("multicursor-nvim").lineAddCursor(-1) end, mode = { "n","x" }, desc = "Multicursor: Add Cursor Up" },
        { "<A-S-j>", function() require("multicursor-nvim").lineAddCursor(1) end, mode = { "n","x" }, desc = "Multicursor: Add Cursor Down" },
        { "<A-m>", function() require("multicursor-nvim").matchAddCursor(1) end, mode = { "n","x" }, desc = "Multicursor: Add Match Cursor" },
        { "<esc>", function() require("multicursor-nvim").clearCursors() end, mode = "n", desc = "Multicursor: Clear Cursors" },
				-- stylua: ignore end
			},
		},
		{
			"echasnovski/mini.cursorword",
			event = "BufReadPost",
			version = "*",
			opts = {
				delay = 50,
			},
		},
		{
			"dpi0/moo.nvim",
			opts = {
				dark_mode = false,
				light_mode = false,
				disable_auto_open = false,
				disable_reload = false,
				host = "localhost",
				port = 3333,
				markdown_mode = false,
			},
			keys = {
        -- stylua: ignore start
        { "<leader>pp",  function() require("moo").preview() end, desc = "Moo: Preview", mode = "n" },
        { "<leader>pk", function() require("moo").kill_preview() end, desc = "Moo: Kill Preview", mode = "n" },
        { "<leader>pl", function() require("moo").list_previews() end, desc = "Moo: List Previews", mode = "n" },
        { "<leader>pK", function() require("moo").kill_all_previews() end, desc = "Moo: Kill All Previews", mode = "n" },
				-- stylua: ignore end
			},
		},
		{
			"catgoose/nvim-colorizer.lua",
			event = "VeryLazy",
			ft = { "css", "scss", "sass", "html", "javascript", "typescript", "vue", "lua" },
			opts = {
				user_default_options = {
					css = true,
					css_fn = true,
					tailwind = true,
					xterm = false,
					mode = "background",
					virtualtext = "■",
					virtualtext_inline = false,
					virtualtext_mode = "foreground",
				},
			},
		},
		{
			"folke/todo-comments.nvim",
			event = "BufReadPre",
			ft = { "lua", "go", "python", "js", "sh" },
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					danger = { "DiagnosticError", "ErrorMsg", "#F50008" },
					warning = { "#FFF200" },
					info = { "#9eb7fc" },
					note = { "#3caaff" },
					todo = { "#FFAC1C" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
				keywords = {
					FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
					TODO = { icon = " ", color = "todo" },
					NOTE = { icon = " ", color = "note" },
					INFO = { icon = " ", color = "info" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
					DANGER = { icon = "󰒡 ", color = "danger", alt = { "CAUTION" } },
				},
			},
			keys = {
        -- stylua: ignore start
        { "tn", function() require("todo-comments").jump_next() end, desc = "Todo: Next" },
        { "tp", function() require("todo-comments").jump_prev() end, desc = "Todo: Prev" },
				-- stylua: ignore end
			},
		},
		{
			"Bekaboo/dropbar.nvim",
			event = "BufEnter",
		},
		{
			"christoomey/vim-titlecase",
			keys = {
				{ "gz", mode = { "n", "v" } },
				{ "gzz", mode = "n" },
			},
		},
		{
			"rachartier/tiny-inline-diagnostic.nvim",
			event = "BufReadPre",
			priority = 1000,
			opts = {
				options = {
					add_messages = { display_count = true },
					multilines = { enabled = true },
				},
			},
		},
		{
			"charm-and-friends/freeze.nvim",
			cmd = "Freeze",
			opts = {
				command = "freeze",
				open = true,
				font = { family = "JetBrains Mono Nerd Font", size = 16 },
				padding = "20",
				theme = "catppuccin-macchiato",
				line_height = 1.4,
				show_line_numbers = true,
				window = true,
				output = function()
					local home = os.getenv("HOME")
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t"):gsub("%s+", "_")
					return string.format(
						"%s/Screenshots/%s_(%s)_(%s).png",
						home,
						filename,
						os.date("%H-%M-%S"),
						os.date("%d-%b")
					)
				end,
			},
			keys = {
				{ "<leader>u", ":Freeze<cr>", mode = { "n", "v" }, silent = true, desc = "Freeze: Take Screenshot" },
			},
		},
		{
			"chrisgrieser/nvim-origami",
			event = "VeryLazy",
			opts = {
				foldtext = {
					lineCount = { template = " %d lines" },
				},
				foldKeymaps = { setup = false },
			},
			init = function()
				vim.opt.foldlevel = 99
				vim.opt.foldlevelstart = 99
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			ft = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
			opts = {},
		},
		{
			"folke/trouble.nvim",
			cmd = "Trouble",
			opts = { focus = true },
			keys = {
        -- stylua: ignore start
        { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Trouble: Buffer Diagnostics" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble: Workspace Diagnostics" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Trouble: Location List" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble: Quickfix" },
        { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Trouble: Symbols" },
				-- stylua: ignore end
			},
		},
		{
			"mikavilpas/yazi.nvim",
			version = "*",
			dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
			cmd = "Yazi",
			keys = {
        -- stylua: ignore start
        { "<leader>y", "<cmd>Yazi<cr>", mode = { "n","v" }, desc = "Yazi: Open" },
        { "<leader>Y", "<cmd>Yazi toggle<cr>", desc = "Yazi: Resume" },
				-- stylua: ignore end
			},
			opts = {
				open_for_directories = false,
				keymaps = { show_help = "<F1>" },
			},
		},
		{
			"brianhuster/live-preview.nvim",
			cmd = "LivePreview",
			ft = { "html", "md" },
			opts = {
				address = "0.0.0.0",
				browser = "default",
				dynamic_root = false,
				picker = "",
				port = 1234,
				sync_scroll = true,
			},
			keys = {
        -- stylua: ignore start
        { "<leader>lp", "<cmd>LivePreview pick<CR>", desc = "Live Preview: Pick files" },
				-- stylua: ignore end
			},
		},
		{
			"echasnovski/mini.surround",
			version = "*",
			keys = {
				{ "m", mode = { "n", "x", "o" } },
			},
			opts = {
				mappings = {
					add = "ma",
					delete = "md",
					find = "mf",
					find_left = "mF",
					highlight = "mh",
					replace = "mr",
					update_n_lines = "mn",
				},
			},
		},
		{
			"echasnovski/mini.ai",
			version = "*",
			keys = {
				{ "a", mode = { "o", "x" } },
				{ "i", mode = { "o", "x" } },
				{ "g[", mode = { "o", "x" } },
				{ "g]", mode = { "o", "x" } },
			},
			opts = {
				custom_textobjects = {
					c = {
						{ "^```%w*%s*\n?([%z\1-\127]-)\n?```$" },
						{ "`([^`]+)`" },
					},
				},
				mappings = {
					around = "a",
					inside = "i",
					around_next = "an",
					inside_next = "in",
					around_last = "al",
					inside_last = "il",
					goto_left = "g[",
					goto_right = "g]",
				},
			},
		},
		{
			"stevearc/quicker.nvim",
			ft = "qf",
			opts = {},
		},
		{
			"dpi0/fim.nvim",
			opts = {
				launch_with_insert = true,
				height = 70,
				width = 50,
				position = "center",
			},
      -- stylua: ignore start
			keys = {
				{ "<A-i>", function() require("fim").toggle() end, desc = "Toggle floating terminal", },
				{ "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal's insert mode", },
			},
			-- stylua: ignore end
		},
		{
			"NickvanDyke/opencode.nvim",
			init = function()
				vim.g.opencode_opts = {
					provider = { enabled = "terminal" },
				}
				vim.o.autoread = true
			end,
			keys = {
    -- stylua: ignore start
    { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n","x" }, desc = "Opencode: Ask (@this)" },
    { "<leader>ox", function() require("opencode").select() end, mode = { "n","x" }, desc = "Opencode: Select" },
    { "<leader>o.", function() require("opencode").toggle() end, mode = { "n","t" }, desc = "Opencode: Toggle" },
    { "<leader>ob", function() require("opencode").ask("@buffer: ", { submit = true }) end, mode = { "n","x" }, desc = "Opencode: Buffer" },
    { "<leader>od", function() require("opencode").ask("@diff: ", { submit = true }) end, mode = { "n","x" }, desc = "Opencode: Diff" },
    { "go", function() return require("opencode").operator("@this ") end, mode = { "n","x" }, expr = true, desc = "Opencode: Operator" },
    { "goo", function() return require("opencode").operator("@this _") end, mode = "n", expr = true, desc = "Opencode: Line" },
    { "<leader>ok", function() require("opencode").command("session.half.page.up") end, mode = "n", desc = "Opencode: Half Up" },
    { "<leader>oj", function() require("opencode").command("session.half.page.down") end, mode = "n", desc = "Opencode: Half Down" },
				-- stylua: ignore end
			},
		},
		{
			"windwp/nvim-ts-autotag",
			ft = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
			opts = {},
		},

		{
			"bullets-vim/bullets.vim",
			ft = { "markdown", "text", "gitcommit", "scratch" },
		},
		{ import = "lang-lazy-nvim" },
		checker = { enabled = false, notify = false },
	},
})
