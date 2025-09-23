{
  inputs,
  system,
  ...
}:
{
  programs.ghostty = {
    package = inputs.ghostty.packages.${system}.default;
    enable = true;
    settings = {
      font-size = 14;
      font-feature = true;
      font-family = "ZedMono Nerd Font";
      mouse-hide-while-typing = true;

      cursor-style-blink = true;

      background-opacity = 0.8;
      background-blur = true;
      window-theme = "ghostty";
      window-subtitle = "working-directory";
      fullscreen = false;
      unfocused-split-opacity = 1.0;
      unfocused-split-fill = "#000000";
      quick-terminal-position = "top";
      quick-terminal-autohide = true;
      keybind = "ctrl+a=toggle_quick_terminal";
      quick-terminal-size = "25%,60%";

      theme = "dark:Ultra Dark,light:Xcode Light hc";

      window-padding-balance = true;
      window-padding-x = 0;
      window-padding-y = 0;
      window-padding-color = "extend";
    };
  };
}
