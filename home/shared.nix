{ config, pkgs, ... }: {
  imports = [ ./modules/nix ./modules/neovim ./modules/zsh ];
  programs = {
    git = {
      enable = true;
      userName = "sbsto";
      userEmail = "brownstone@hey.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    tmux = {
      enable = true;
      shortcut = "a";
      terminal = "screen-256color";
      escapeTime = 0;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  home.packages = with pkgs; [
    cargo
    rustc
    go
    git
    gcc
    nodejs_22
    pnpm

    ripgrep
    fd
    tmux
    gh
  ];
}
