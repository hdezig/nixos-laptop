{
  inputs,
  pkgs,
  ...
}:
{

  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];

  environment = {
    systemPackages =
      let
        rustToolchain = pkgs.rust-bin.stable.latest.default.override {
          extensions = [
            "rust-src"
            "rust-analyzer"
            "rustfmt"
            "clippy"
          ];
        };

        crates-lsp = pkgs.rustPlatform.buildRustPackage rec {

          pname = "crates-lsp";
          version = "0.4.2";

          src = pkgs.fetchFromGitHub {
            owner = "MathiasPius";
            repo = "crates-lsp";
            rev = "28cce5179af35e810f0750fd8d8b353f22979ac3";
            hash = "sha256-s42nWQC2tD7vhQNPdTQNRokwXqeBhELidVYTlos+No0=";
          };

          cargoLock = {
            lockFile = "${src}/Cargo.lock";
          };

        };

      in
      [
        rustToolchain
        crates-lsp
        pkgs.cargo-expand
        pkgs.cargo-mommy
        pkgs.openssl
        pkgs.just
        pkgs.libxkbcommon
        pkgs.pkg-config
      ];

    variables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig:${pkgs.libxkbcommon.dev}/lib/pkgconfig";
    };
  };

}
