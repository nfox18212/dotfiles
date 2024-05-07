return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
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
}
