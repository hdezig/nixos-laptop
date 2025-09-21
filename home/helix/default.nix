{
  ...
}:
{
  imports = [
    ./languages.nix
    ./keymaps.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "kaolin-light";
      keys = {
        normal = {
          F5 = ":sh tectonic -o build {{file}}";
        };
      };
      editor = {
        rulers = [ 100 ];
        line-number = "relative";
        color-modes = true;
        clipboard-provider = "termcode";
        # cursorline = true;
        bufferline = "always";
        end-of-line-diagnostics = "hint";
        mouse = false;

        inline-diagnostics = {
          cursor-line = "warning";
        };

        indent-guides = {
          render = false;
          skip-level = 1;
        };

        statusline = {
          left = [
            "mode"
            "spacer"
            "diagnostics"
            "version-control"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
            "spinner"
          ];
          right = [
            "file-encoding"
            "file-type"
            "selections"
            "position"
          ];
        };

        cursor-shape = {
          normal = "block";
          select = "underline";
          insert = "bar";
        };

        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
          display-color-swatches = true;
          display-progress-messages = true;
          display-signature-help-docs = true;
        };

        whitespace = {
          enable = true;
        };

      };
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
