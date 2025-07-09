{ pkgs, ... }: {
  imports = [ ./plugins ];

  programs.neovim = {
    enable = false;
    viAlias = false;
    vimAlias = false;
  };

  programs.nixvim = {
    enableMan = false;
    enable = true;
    defaultEditor = true;

    extraConfigVim = ''
      source ${./vimrc}
    '';

    performance = {
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      readline-vim # readline bindings in (insert/command mode)
      vim-table-mode # .md tables
      colorizer
      # vim-startuptime
    ];


    withRuby = false;
    withPython3 = false;
    withPerl = false;
    withNodeJs = false;
    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2
    };

    opts = {
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search: show match for partly typed search command
      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      cursorline = true;
      cmdheight = 0;
    };

    plugins = {
      # lz-n.enable = true;
      comment.enable = true;
      vim-surround.enable = true;
      repeat.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;

      # harpoon = {
      #   enable = true;
      #   enableTelescope = true;
      # };
      # indent-blankline.enable = true;
    };

  };
}
