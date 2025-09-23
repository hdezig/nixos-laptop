{ ... }: {
  services.vicinae = {
    enable = true;
    autoStart = true;
    settings = {
      faviconService = "twenty";
      font.size = 11;
      popToRootOnClose = false;
      theme.name = "vicinae-light";
      window = {
        csd = false;
        opacity = 0.95;
        rounding = 0;
      };
    };
  };
}
