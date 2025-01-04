return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    'norcalli/nvim-colorizer.lua'
  },

  -- These are some examples, uncomment them if you want to see them work!
   {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
   },
   {
   	"williamboman/mason.nvim",
   	opts = {
   		ensure_installed = {
   			"lua-language-server", "stylua",
   			"html-lsp", "css-lsp" , "prettier"
   		},
   	},
   },
   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css"
   		},
   	},
   },
  	{
	 "nvim-tree/nvim-tree.lua",
	 version = "*",
	 lazy = false,
	 dependencies = {
		"nvim-tree/nvim-web-devicons",
	 },
	 config = function()
		require("nvim-tree").setup {}
	 end,
	},
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	'nvim-tree/nvim-web-devicons',
      "mfussenegger/nvim-dap",
	{ "folke/neodev.nvim", opts = {} },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
	{
	 "NeogitOrg/neogit",
	 dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration

		-- Only one of these is needed, not both.a
		"ibhagwan/fzf-lua",              -- optional
	 },
	 config = true
	},
  "m4xshen/autoclose.nvim",
  	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional cmp completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
  {
    "SGauvin/ctest-telescope.nvim",
    opts = {
        -- Your config
    }
},
'mfussenegger/nvim-dap-python',
{
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
}
}
