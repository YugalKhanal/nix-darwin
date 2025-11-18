{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vimPlugins.nvim-web-devicons
  ];

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}

# { config, pkgs, inputs, lib, ... }:
#
# {
#   # Allow unfree packages
#   nixpkgs.config.allowUnfree = true;
#
#   # System-wide installed packages
#   environment.systemPackages = with pkgs; [
#     vim
#   ];
#
#   # Enable flake features
#   nix.settings.experimental-features = [
#     "nix-command"
#     "flakes"
#   ];
#
#   # Required for nix-darwin
#   system.stateVersion = 6;
#
#   # Architecture (Apple Silicon)
#   nixpkgs.hostPlatform = "aarch64-darwin";
#
# }
