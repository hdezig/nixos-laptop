{
  pkgs,
  ...
}:
{
  imports = [
    ./boot.nix
    ./services.nix
    ./packages.nix
    ./steam.nix
  ];

  networking.hostName = "hdezg";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "America/Mazatlan";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.kdeconnect.enable = true;
  programs.niri.enable = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  users.users.hdezg.shell = pkgs.nushell;

  users.users.hdezg = {
    isNormalUser = true;
    description = "Alberto Hdezg";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [ ];
  };


  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";

}
