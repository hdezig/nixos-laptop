{ pkgs, ... }:
{
  security = {
    sudo = {
      enable = false;
    };
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "hdezg" ];
          groups = [ "wheel" ];
          keepEnv = true;
          runAs = "root";
        }
      ];
    };
  };

  services.displayManager.cosmic-greeter.enable = true;

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  services.dbus.enable = true;

  services.flatpak.enable = true;

  programs.appimage.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = "wlr";
    };
  };

  programs.nh = {
    enable = true;
    flake = "~/nixos-laptop";
    clean = {
      enable = true;
      extraArgs = "--keep 3  --delete-older-than 15d ";
    };
  };

}
