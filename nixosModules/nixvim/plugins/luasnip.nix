{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
    };
    extraConfigVim = ''
      imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'
      inoremap <silent> <c-k> <cmd>lua require'luasnip'.jump(-1)<Cr>
      snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<Cr>
      snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<Cr>

      lua << EOF
        require("luasnip").filetype_extend("all", { "_" })
        -- require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "${pkgs.vimPlugins.vim-snippets}" } })
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "${pkgs.vimPlugins.friendly-snippets}" } })
      EOF
    '';
  };
}
