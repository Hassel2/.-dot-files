{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      vi = "nvim $argv";
      vim = "nvim $argv";
      shut = "shutdown -h now";
      ls = "exa --icons $argv";
      la = "exa --icons -al";
      ll = "exa --icons -l";
    };
  };
}
