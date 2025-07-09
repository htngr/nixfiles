{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      # lazyLoad.settings.cmd = "Telescope";
      extensions = {
        file-browser.enable = true;
        fzf-native.enable = true;
        manix.enable = true;
      };
      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
        };
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Grep (root dir)";
          };
        };
        "<leader>fr" = {
          action = "resume";
          options = {
            desc = "Resume";
          };
        };
        "<leader>fF" = {
          action = "oldfiles";
          options = {
            desc = "Recent";
          };
        };
        "<leader>fb" = {
          action = "buffers";
          options = {
            desc = "Buffers";
          };
        };
        "<leader>fgc" = {
          action = "git_commits";
          options = {
            desc = "Commits";
          };
        };
        "<leader>fgs" = {
          action = "git_status";
          options = {
            desc = "Status";
          };
        };
        "<leader>fc" = {
          action = "command_history";
          options = {
            desc = "Command History";
          };
        };
        "<leader>fC" = {
          action = "commands";
          options = {
            desc = "Commands";
          };
        };
        "<leader>fD" = {
          action = "diagnostics";
          options = {
            desc = "Workspace diagnostics";
          };
        };
        "<leader>fM" = {
          action = "man_pages";
          options = {
            desc = "Man pages";
          };
        };
        "<leader>ft" = {
          action = "colorscheme";
          options = {
            desc = "Colorscheme preview";
          };
        };
        "<leader>fn" = {
          action = "manix";
          options = {
            desc = "Manix Search";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>fd";
        action = "<cmd>Telescope diagnostics bufnr=0<cr>";
        options = {
          desc = "Document diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>Telescope file_browser<cr>";
        options = {
          desc = "File browser";
        };
      }
      {
        mode = "n";
        key = "<leader>fE";
        action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
        options = {
          desc = "File browser";
        };
      }
    ];
    extraConfigLua = ''
      require("telescope").setup{
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
    '';

  };
}
