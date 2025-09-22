{
  pkgs,
  lib,
  inputs,
  ...
}:
{

  imports = [
    ./ghostty.nix
    ./zed.nix
    ./niri.nix
    ./helix
  ];

  home = {

    packages = with pkgs; [

      playerctl
      base16-schemes

      zip
      unzip

      nix
      nil

      vesktop
      eza
      glances

      nerd-fonts.zed-mono
      nerd-fonts.victor-mono

    ];

    username = "hdezg";
    homeDirectory = "/home/hdezg";
    stateVersion = "25.11";

    pointerCursor = {
      enable = true;
      package = pkgs.apple-cursor;

      name = "macOS-White";

      gtk.enable = true;
      x11.enable = true;

      size = 24;

    };

  };

  gtk = {
    enable = true;

    font = {
      name = "ZedMono Nerd Font";
      size = 10;
    };

    iconTheme = {
      name = "colloid-icon-theme-latest-Pink-Catppuccin-Light";
    };
  };

  programs.git = {
    userName = "hdezig";
    userEmail = "hdezgalberto@outlook.com";
  };

  programs.home-manager.enable = true;

  _module.args = {
    inherit inputs;
  };

  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
  };

}
