{ pkgs, ... }:

{
  home.username = "yugalkhanal";
  home.homeDirectory = "/Users/yugalkhanal";
  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "Neovim";
  };

  home.packages = [
  ];


  programs.home-manager.enable = true;
  # programs.neovim.enable = true;
  #programs.nixvim.enable = true;
}
