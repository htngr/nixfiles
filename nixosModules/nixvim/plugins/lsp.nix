{
  programs.nixvim = {
    plugins = {
      fidget.enable = true;
      lspkind = {
        enable = true;
        symbolMap = {
          Copilot = " ";
        };
        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };

      schemastore = {
        enable = true;
        json.enable = true;
        yaml.enable = true;
      };

      nvim-autopairs = {
        enable = true;
        settings = {
          disable_filetype = [
            "TelescopePrompt"
            # "vim"
          ];
        };
      };

      # lsp-lines.enable = true;
      lsp-format.enable = true;
      scrollview.enable = true;

      # rustaceanvim.enable = true;
      # rustaceanvim.settings = {
      #   server = {
      #     default_settings = {
      #       rust-analyzer = {
      #         check = {
      #           command = "clippy";
      #         };
      #       };
      #     };
      #     standalone = false;
      #   };
      # };
      # tailwind-tools.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          bashls.enable = true;
          dockerls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          marksman.enable = true;
          nil_ls = {
            enable = true;
            settings.formatting.command = [ "nixpkgs-fmt" ];
          };
          tailwindcss.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          ts_ls.enable = true;
          yamlls.enable = true;
          ccls = {
            enable = true;
            # package = null;
            settings = {
              cmd = [
                "clangd"
                "--background-index"
              ];
              filetypes = [
                "c"
                "cpp"
              ];
              root_markers = [
                "compile_commands.json"
                "compile_flags.txt"
              ];
            };
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>aw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>af" = {
              action = "format";
              desc = "Workspace Symbol";
            };
            "<leader>ac" = {
              action = "code_action";
              desc = "Workspace Symbol";
            };
            "<leader>ar" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "<leader>ad" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
    };

    extraConfigLua = ''
      -- local _border = "rounded"

      -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      --   vim.lsp.handlers.hover, {
      --     border = _border
      --   }
      -- )

      -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      --   vim.lsp.handlers.signature_help, {
      --     border = _border
      --   }
      -- )

      -- vim.diagnostic.config{
      --   float={border=_border}
      -- };

      -- require('lspconfig.ui.windows').default_options = {
      --   border = _border
      -- }

      -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      -- for type, icon in pairs(signs) do
      --   local hl = "DiagnosticSign" .. type
      --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      -- end

      vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
      vim.filetype.add({ extension = { mdx = 'markdown.mdx' }})
      -- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
      -- ft_to_parser['markdown.mdx'] = "markdown"
      -- vim.treesitter.language.register('markdown', 'markdown.mdx')
      -- vim.cmd [[autocmd! Filetype mdx ]]
    '';

    extraConfigVim = ''
      augroup mdx_ft
       autocmd!
       au BufRead,BufNewFile *.mdx,*.md call timer_start(50, { tid -> execute('set syntax=markdown')})
      augroup END
    '';


  };
}
