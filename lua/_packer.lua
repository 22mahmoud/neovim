vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    use {"wbthomason/packer.nvim", opt = true}

    use {
      "brooth/far.vim",
      config = function()
        vim.cmd [[
        let g:far#source = 'rg'
        let g:far#enable_undo=1
        ]]
      end
    }
    use "tpope/vim-surround"
    use {
      "tpope/vim-repeat",
      config = function()
        vim.cmd [[silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)]]
      end
    }
    use "tpope/vim-commentary"

    -- themeing, ui
    use {"kyazdani42/nvim-web-devicons"}
    use {"lifepillar/vim-gruvbox8"}
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
      run = ":TSUpdate",
      config = function()
        require("_treesitter")
      end,
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects"
      }
    }

    -- lsp
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("_lsp")
      end
    }
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("_completion")
      end,
      requires = {
        "hrsh7th/vim-vsnip"
      }
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
      config = function()
        require("_fzf")
      end,
      requires = {
        "junegunn/fzf",
        "ojroques/nvim-lspfuzzy"
      }
    }

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("_tree")
      end
    }

    -- js,ts,jsx
    -- because treesitter breaks jsx indentation
    use "maxmellon/vim-jsx-pretty"
    use "leafgarland/typescript-vim"

    use "christoomey/vim-tmux-navigator"

    -- git
    use {
      "tpope/vim-fugitive",
      config = function()
        vim.api.nvim_set_keymap(
          "n",
          "<leader>gs",
          ":Gstatus<CR>",
          {noremap = true, silent = true}
        )
      end
    }
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
        require("_vim-test")
      end
    }

    -- autopairs
    use {
      "Raimondi/delimitMate"
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
