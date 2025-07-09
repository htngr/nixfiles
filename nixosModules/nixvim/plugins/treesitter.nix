{ pkgs, ... }: {
  programs.nixvim = {
    plugins.treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
      # folding = true;

      grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };


    # plugings.hmts.enable = true;
  };
}
