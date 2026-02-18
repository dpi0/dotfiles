return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- https://github.com/tree-sitter/tree-sitter/wiki/List-of-parsers
			require("nvim-treesitter").install({
				"bash",
				"cmake",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"git_config",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"gitignore",
				"go",
				"graphql",
				"html",
				"hyprlang",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"luadoc",
				"make",
				"make",
				"markdown",
				"markdown_inline",
				"nix",
				"nginx",
				"powershell",
				"python",
				"query",
				"regex",
				"requirements",
				"sql",
				"ssh_config",
				"terraform",
				"tmux",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
				callback = function(args)
					local bufnr = args.buf
					local ok, _ = pcall(vim.treesitter.start, bufnr)

					if ok then
						vim.wo[0][0].foldmethod = "expr"
						vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
						vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig", -- INFO: Provides the LSP configurations present in <https://github.com/neovim/nvim-lspconfig/tree/master/lsp>
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "mason-org/mason.nvim", event = "VeryLazy", opts = {} }, -- INFO: Plugin manager for LSP, Formatter, Linter and other tools
			{
				"mason-org/mason-lspconfig.nvim", -- INFO: 1. Auto install LSP servers only 2. Auto enable them (don't have to use vim.lsp.enable())
				opts = { automatic_enable = true },
			},
			{ "j-hui/fidget.nvim", opts = {} }, --INFO: Small UI at the bottom right corner to show when LSP is ready for the buffer
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim", -- INFO: Install Language Servers, Linters and Formatters via Mason
				opts = {
					run_on_start = false, -- When false, install manually using :MasonToolsInstall
					auto_update = false,
					ensure_installed = {
						-- To compile the tree-sitter parsers
						"tree-sitter-cli",
						-- Language Servers
						-- These servers are auto enabled by mason-lspconfig (otherwise manually do vim.lsp.enable)
						"docker-language-server",
						"dockerfile-language-server",
						"docker_compose_language_service",
						"yamlls",
						"ansiblels",
						"gopls",
						"bashls",
						"harper-ls", -- Markdown
						"cssls",
						"jsonls",
						-- 'kotlin_lsp',
						"gh_actions_ls", -- GitHub Actions
						"ts_ls", -- Typescript/Javascript
						-- Formatters
						"yamlfmt",
						"shfmt", -- Shell
						"stylua",
						"prettierd", -- General
						"taplo", -- TOML
						"rumdl", -- Markdown (Linter as well)
						-- Linters
						"yamllint",
						"shellcheck",
						"jsonlint",
						"selene", -- Lua
						"djlint", -- HTML
						"ruff", -- Python
						-- 'klint', -- Kotlin
						"golangci-lint",
						"hadolint", -- Dockerfile
						"actionlint", -- GitHub Actions
					},
				},
			},
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = false, -- NOTE: rachartier/tiny-inline-diagnostic.nvim now handles the inline messages
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
			})

			vim.keymap.set("n", "<leader>M", "<cmd>Mason<CR>", { desc = "Mason" })
			vim.keymap.set("n", "<leader>lsp", "<cmd>checkhealth vim.lsp<CR>", { desc = "LSP Health" })

			vim.lsp.config(
				"lua_ls",
				{ -- NOTE: Had to do lua_ls manually as Mason's "lua-language-server" was using an outdated library "libbfd-2.38-system.so"
					settings = {
						Lua = { diagnostics = { globals = { "vim" } } },
					},
				}
			)

			vim.lsp.config("harper_ls", {
				filetypes = { "markdown", "sh", "gitcommit", "asciidoc", "html" },
			})

			vim.lsp.config("gh_actions_ls", {
				filetypes = { "yaml.github-workflow" },
			})

			vim.lsp.enable({ "lua_ls" })
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		opts = {
			format_on_save = {
				timeout_ms = 5000,
				lsp_format = "fallback",
			},
			formatters = {
				rumdl = {
					command = "rumdl",
					args = { "fmt", "-" },
					stdin = true,
					env = { RUMDL_CACHE_DIR = vim.env.HOME .. "/.cache/rumdl" },
				},
				dockerfmt = {
					command = vim.env.HOME .. "/.local/share/go/bin/dockerfmt",
					stdin = true,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
				go = { "gofmt" },
				yaml = { "yamlfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				sh = { "shfmt" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				toml = { "taplo" },
				terraform = { "terraform_fmt" },
				javascript = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				dart = { "dart_format" },
				markdown = { "rumdl" },
				dockerfile = { "dockerfmt" },
				["*"] = { "trim_newlines", "trim_whitespace" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
				go = { "golangcilint" },
				terraform = { "tflint" },
				ansible = { "ansible_lint" },
				bash = { "shellcheck" },
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
				-- lua = { "selene" },
				yaml = { "yamllint" },
				yml = { "yamllint", "ansible_lint" },
				["yaml.github-workflow"] = { "actionlint" },
				json = { "jsonlint" },
				html = { "djlint" },
				j2 = { "djlint" },
				nix = { "nix" },
				ruby = { "ruby" },
				kotlin = { "ktlint" },
				dockerfile = { "hadolint" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
