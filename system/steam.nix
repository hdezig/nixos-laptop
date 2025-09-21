{
  lib,
  system,
  inputs,
  pkgs,
  ...
}:
{

  programs.gamemode.enable = true;
  programs = {
    gamescope = {
      package = inputs.chaotic.packages.${system}.gamescope_git;
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession = {
        enable = true;
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

}
