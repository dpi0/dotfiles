require("lazy-nvim")
require("statusline")

-- OPTIONS
vim.o.number = true -- show line numbers
vim.o.signcolumn = "yes" -- show signcolumn
vim.o.wrap = false -- line wrapping
vim.o.inccommand = "split" -- preview substitutions live as you type
vim.o.clipboard = "unnamedplus" -- sync system clipboard
vim.o.expandtab = true -- convert tabs to spaces
vim.o.tabstop = 2 -- how many spaces a tab should be
vim.o.shiftwidth = 2 -- when shifting line using >> and auto-indent, use 2 spaces
vim.o.softtabstop = 2 -- add 2 spaces when hitting <TAB> and delete 2 spaces when <BS>
vim.o.confirm = true -- show confirmation asking if you wish to save the current unsaved file(s)
vim.o.lazyredraw = false -- don't redraw during macros/scripts
vim.o.updatetime = 50 -- faster update time (default: 4000ms)
vim.o.timeoutlen = 500 -- faster key sequence timeout (default: 1000ms)
vim.o.swapfile = false -- disable swapfile
vim.o.backup = false -- disable backup files
vim.o.writebackup = true -- prevent editing files that are open elsewhere
vim.o.undofile = true -- persistent undo
vim.o.scrolloff = 10 -- keep n lines visible when scrolling up/down
vim.o.ignorecase = true -- case-insensitive search
vim.o.smartcase = true -- case-sensitive if mixed-case search
vim.o.incsearch = true -- show incremental matches
vim.o.hlsearch = true -- highlight search results
vim.o.winborder = "none" -- remove border from floating windows

-- THEMING
vim.cmd("colorscheme kanagawa")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- remove bg color
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- inactive windows
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" }) -- from ~ lines at EOF
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- remove bg from floating windows
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#223249", bg = "none" }) -- remove bg from floating window borders
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" }) -- floating window titles
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- signcolum
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" }) -- statusline
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" }) -- inactive statusline
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" }) -- "colorcolumn" visual guide
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" }) -- completion popup
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "none" }) -- completion selection
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" }) -- completion scrollbar
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "none" }) -- completion scrollbar thumbbar
vim.api.nvim_set_hl(0, "FzfLuaBorder", { fg = "#223249" }) -- fzf-lua border
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#49443C" }) -- yank bg (custom hl group)

-- KEYBINDS
vim.keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit current buffer" })
vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Select all text in buffer" })
vim.keymap.set("n", "<leader>s", "<cmd>silent write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>S", "<cmd>noautocmd w<CR>", { desc = "Save file without auto-formatting" })
vim.keymap.set("n", "<leader>N", "<cmd>enew<CR>", { desc = "Create a new blank buffer" })
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy Plugin Manager" })
vim.keymap.set("n", "<leader>d", "<C-^>", { desc = "Switch to last buffer (normal)" })
vim.keymap.set("n", "<leader>I", "mzgg=G`z", { desc = "Reindent entire buffer" })
vim.keymap.set("n", "<leader>vb", "<C-v>", { noremap = true, desc = "Enter Visual Block Mode" })
vim.keymap.set("n", "<leader>rr", ":%s/", { desc = "Replace text in current buffer" })
vim.keymap.set("n", "<leader>n", "mz:copy .<CR>`z", { desc = "Duplicate line below" })
vim.keymap.set("n", "<leader>L", "<C-w>v", { desc = "Split vertically (right)" })
vim.keymap.set("n", "<leader>J", "<C-w>s", { desc = "Split horizontally (down)" })
vim.keymap.set("i", "<A-BS>", "<C-w>", { desc = "Delete word backwards (insert)" })
vim.keymap.set("n", "<A-BS>", "db", { desc = "Delete word backwards (normal)" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left buffer" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right buffer" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower buffer" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper buffer" })
vim.keymap.set("n", "<C-up>", "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<C-down>", "<C-w>-", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-right>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<C-left>", "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
vim.keymap.set("n", "<n>", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "<S-n>", "Nzzzv", { desc = "Previous search result centered" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight with <Esc>" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", ";", "V", { desc = "Visual select entire linex" })
vim.keymap.set("n", "<C-M-j>", "J", { noremap = true, silent = true, desc = "Join line below" })
vim.keymap.set("n", "<C-M-k>", "kJ", { noremap = true, silent = true, desc = "Join line above" })

-- AUTOCMD
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	desc = "Highlight on yank",
	callback = function()
		vim.hl.on_yank({ higroup = "YankHighlight" })
	end,
})

-- https://gist.github.com/smnatale/692ac4f256d5f19fbcbb78fe32c87604
-- Do not continue the comment on next line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Set filetype for certain file names so that the Language servers can recognize them
local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		command = "set filetype=" .. filetype,
	})
end

set_filetype({ "compose.yaml", "compose.yml" }, "yaml.docker-compose")
-- set_filetype({ 'playbook.yaml', 'playbook.yml' }, 'yaml.ansible') -- Using mfussenegger/nvim-ansible for this
set_filetype({ ".github/workflows/*.yml", ".github/workflows/*.yaml" }, "yaml.github-workflow")

-- Notification on save
local group = vim.api.nvim_create_augroup("SaveNotify", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = group,
	callback = function(args)
		if args.file == "" then
			return
		end

		local buf = args.buf
		local path = vim.fn.fnamemodify(args.file, ":.")
		local lines = vim.api.nvim_buf_line_count(buf)
		local bytes = vim.fn.getfsize(args.file)
		local msg = string.format('"%s" %dL, %dB written', path, lines, bytes)

		require("snacks").notify(msg, {
			level = "info",
			title = "Neovim",
			timeout = 500,
		})
	end,
})

-- Neovide Configuration
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono NF:h11"
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.1
	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_no_idle = true
	vim.g.neovide_fullscreen = true
	vim.g.neovide_remember_window_size = false
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	vim.g.neovide_opacity = 0.8
	vim.keymap.set("i", "<C-v>", "<C-R>+", { silent = true })
	vim.keymap.set("t", "<C-v>", '<C-\\><C-o>"+p', { silent = true })
end
