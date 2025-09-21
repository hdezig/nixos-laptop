{ pkgs, ... }:
{
  programs.helix = {
    extraPackages = with pkgs; [
      marksman
      texlab
      ltex-ls
      ltex-ls-plus
      rustfmt
      tree-sitter
    ];

    languages = {

      language-server.ltex.config.ltex = {
        language = "es";
        dictionary = {
          "es" = [ "aueo" ];
        };
      };

      language-server.ltex = {
        command = "ltex-ls-plus";
      };

      language-server.crates-lsp = {
        command = "crates-lsp";
      };

      language-server.rust-analyzer = {
        command = "rust-analyzer";
        config = {
          check = {
            command = "clippy";
            extraArgs = [
              "--"
              "-W"
              "clippy::unwrap_used"
              "-W"
              "clippy::expect_used"
              "-W"
              "clippy::pedantic"
              "-W"
              "clippy::nursery"
            ];
          };
        };
      };

      language = [
        {
          name = "nix";
          formatter.command = "nixfmt";
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
        }
        {
          name = "crates";
          scope = "source.toml";
          injection-regex = "toml";
          file-types = [
            { glob = "Cargo.toml"; }
          ];
          comment-token = "#";
          language-servers = [ "crates-lsp" ];
          grammar = "toml";
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          diagnostic-severity = "info";

        }

        {
          name = "latex";
          language-servers = [
            "texlab"
            "ltex-ls-plus"
          ];
        }
      ];

    };
  };
}
