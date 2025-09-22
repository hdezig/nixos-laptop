{
  pkgs,
  inputs,
  system,
  ...
}:
{

  nixpkgs.overlays = [
    inputs.zed-extensions.overlays.default
    (import ./../overlays/helium.nix)
    (import ./../overlays/colloid-overlay.nix)
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    inputs.quickshell.packages.${system}.default

    xwayland-satellite
    bluez
    bluez-tools
    apple-cursor
    gh
    vscode-extensions.vadimcn.vscode-lldb
    github-desktop
    git
    wlsunset
    signal-desktop
    helium
    direnv
    nix-direnv
    heroic
    curl
    libproxy
    nh
    ladybird
    nix-prefetch-github
    prismlauncher
    cartero
    mission-center
    texliveFull
    fmt
    nixfmt-rfc-style
    alejandra
    nixd
    nix-prefetch-github
    _1password-gui-beta
    brightnessctl
    telegram-desktop
    colloid-icon-theme
    xfce.thunar
  ];
}
