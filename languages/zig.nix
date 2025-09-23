{ pkgs, inputs, ... }:
let
  zls = inputs.zls-overlay.packages.x86_64-linux.zls.overrideAttrs (old: {
    nativeBuildInputs = with pkgs; [ zigpkgs.master ];
  });
in
{
  environment.systemPackages = with pkgs; [
    zigpkgs.master
    zls

    llvmPackages_21.clang-tools
    clang
  ];

}
