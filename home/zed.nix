{
  pkgs,
  ...
}:
let
  vscode-lldb = pkgs.vscode-extensions.vadimcn.vscode-lldb;
  codelldb-path = "${vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
in
{

  programs.zed-editor = {
    enable = true;
    userTasks = [
      {
        label = "Cargo mommy";
        command = "cargo mommy run";
        show_output = true;
      }
      {
        label = "Zig build run";
        command = "zig build run";
        show_output = true;
      }
    ];
    userSettings = {
      theme = {
        dark = "One Dark Pro";
        light = "Zed Legacy: Atelier Heath Light";
        mode = "system";
      };
      title_bar = {
        show_onboarding_banner = false;
        show_user_picture = false;
        show_sign_in = false;
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = false;
        edit_debounce_ms = 700;
        scroll_debounce_ms = 50;
        toggle_on_modifiers_press = null;
      };
      notification_panel = {
        button = false;
      };
      dap = {
        CodeLLDB = {
          binary = codelldb-path;
        };
      };
      disable_ai = true;
      diagnostics = {
        inline = {
          enabled = true;
          update_debounce_ms = 150;
        };
      };
      ui_font_size = 18;
      helix_mode = true;
      wrap_guides = [ 80 ];
      agent = {
        enabled = false;
      };
      auto_update = false;
      buffer_font_family = "ZedMono Nerd Font";
      collaboration_panel = {
        button = false;
      };
      buffer_font_features = {
        calt = true;
      };
      current_line_highlight = "none";
      "experimental.theme_overrides" = {
        "background.appearance" = "blurred";
        "editor.wrap_guide" = "#7a517";
      };
      features = {
        edit_prediction_provider = "none";
      };
      format_on_save = "language_server";
      icon_theme = {
        mode = "system";
        light = "Base Charmed Icons";
        dark = "Base Charmed Icons";
      };
      lsp = {
        rust-analyzer = {
          initialization_options = {
            check = {
              command = "clippy";
            };

            command = "clippy";
          };
        };
        nixd = {
          initialization_options = {
            nixpkgs = {
              expr = "import <nixpkgs> {}";
            };
          };
        };
        nil = {
          initialization_options = {
            autoArchieve = true;
          };
        };
      };
      minimap = {
        current_line_highlight = "none";
        show = "always";
        thumb = "always";
        thumb_border = "left_open";
      };
      preferred_line_length = 80;
      project_panel = {
        dock = "right";
        file_icons = true;
        git_status = true;
        auto_fold_dirs = false;
        scrollbar = {
          show = null;
        };
        entry_spacing = "comfortable";
        indent_guides = {
          show = "never";
        };
      };
      scrollbar = {
        show = "never";
      };
      relative_line_numbers = true;
      show_wrap_guides = true;
      telemetry = {
        diagnostics = false;
      };
      terminal = {
        font_family = "ZedMono Nerd Font";
        working_directory = "current_project_directory";
        blinking = "on";
      };
    };
  };

  programs.zed-editor-extensions = {
    enable = true;
    packages = with pkgs.zed-extensions; [
      nix
      zed-legacy-themes
      charmed-icons
      toml
      crates-lsp
      sql
      git-firefly
      zig
      html
      scss
      latex
      one-dark-pro
    ];
  };
}
