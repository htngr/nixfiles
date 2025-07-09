{ pkgs, ... }: {
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [ haskell-tools-nvim ];

    # globals.haskell_tools = {
    #   hls.settings = {
    #     cabalFormattingProvider = "cabalfmt";
    #   };
    # };
    extraConfigLua = ''
      local ht = require('haskell-tools')
      local bufnr = vim.api.nvim_get_current_buf()
      local def_opts = { noremap = true, silent = true, buffer = bufnr, }
      vim.keymap.set('n', '<leader>aa', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<leader>ae', ht.lsp.buf_eval_all, opts)
      vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
      vim.keymap.set('n', '<leader>hr',  ht.repl.toggle, opts)
      vim.keymap.set('n', '<leader>hf', function()
        ht.repl.toggle(vim.api.nvim_buf_get_name(0))
      end, def_opts)
      vim.keymap.set('n', '<leader>hq', ht.repl.quit, opts)
      -- default_settings = {
      --   haskell = {
      --     cabalFormattingProvider = "cabalfmt",
      --     formattingProvider = "fourmolu",
      --     -- plugin = {
      --       -- BROKEN in nixos-22.11 -- stan = { globalOn = true },
      --     -- }
      --   }
      -- }

      -- Suggested keymaps that do not depend on haskell-language-server:
      -- local bufnr = vim.api.nvim_get_current_buf()
      -- set buffer = bufnr in ftplugin/haskell.lua
      -- local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Toggle a GHCi repl for the current package
      -- vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
      -- Toggle a GHCi repl for the current buffer
      -- vim.keymap.set('n', '<leader>rf', function()
        -- ht.repl.toggle(vim.api.nvim_buf_get_name(0))
      -- end, def_opts)
      -- vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)

      -- Detect nvim-dap launch configurations
      -- (requires nvim-dap and haskell-debug-adapter)
      -- ht.dap.discover_configurations(bufnr) 
    '';
  };
}
