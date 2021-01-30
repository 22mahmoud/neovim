vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    use {"wbthomason/packer.nvim", opt = true}

    use "tpope/vim-surround"
    use {
      "tpope/vim-repeat",
      config = function()
        vim.cmd [[silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)]]
      end
    }
    use "tpope/vim-commentary"

    -- themeing, ui
    use "gruvbox-community/gruvbox"
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup {
          css = {rgb_fn = true},
          scss = {rgb_fn = true},
          sass = {rgb_fn = true},
          stylus = {rgb_fn = true},
          vim = {names = true},
          tmux = {names = false},
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          html = {
            mode = "foreground"
          }
        }
      end
    }

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- lsp
    use "neovim/nvim-lspconfig"
    use {
      "hrsh7th/nvim-compe",
      requires = {
        "hrsh7th/vim-vsnip",
        "hrsh7th/vim-vsnip-integ"
      }
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup()
      end
    }

    -- lua
    use {
      "tjdevries/nlua.nvim",
      requires = {
        "euclidianAce/BetterLua.vim"
      }
    }

    use {
      "junegunn/fzf.vim",
      requires = {
        "junegunn/fzf",
        "ojroques/nvim-lspfuzzy"
      }
    }

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      opt = true,
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    }

    -- formatter
    use {
      "mhartington/formatter.nvim",
      opt = true
    }

    -- js,ts,jsx
    -- because treesitter breaks jsx indentation
    use "maxmellon/vim-jsx-pretty"
    use "leafgarland/typescript-vim"

    use "christoomey/vim-tmux-navigator"

    -- git
    use "tpope/vim-fugitive"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("gitsigns").setup()
      end
    }

    -- testing
    use {
      "vim-test/vim-test",
      config = function()
        vim.cmd [[let test#strategy = "neovim"]]
      end
    }

    -- debugging
    use {
      "mfussenegger/nvim-dap",
      requires = {
        {"theHamsta/nvim-dap-virtual-text"},
        {"nvim-telescope/telescope-dap.nvim"}
      },
      config = function()
        require("_dap")
      end
    }
  end
)
