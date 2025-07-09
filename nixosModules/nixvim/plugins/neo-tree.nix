{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;

      # lazyLoad.settings.keys = [ "<leader>n" ];

      closeIfLastWindow = true;
      addBlankLineAtTop = false;
      window = {
        width = 30;
        autoExpandWidth = true;
      };
      filesystem = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
      };
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];


      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = "󰅂";
          expanderExpanded = "󰅀";
          expanderHighlight = "NeoTreeExpander";
        };

        gitStatus = {
          symbols = {
            added = " ";
            conflict = "󰩌 ";
            deleted = "󱂥";
            ignored = " ";
            modified = " ";
            renamed = "󰑕";
            staged = "󰩍";
            unstaged = "";
            untracked = " ";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
    ];

  };
}
