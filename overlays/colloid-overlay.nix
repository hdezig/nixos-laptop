self: super: {

  colloid-icon-theme = super.colloid-icon-theme.overrideAttrs (oldAttrs: {

    version = "latest";

    src = super.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Colloid-icon-theme";
      rev = "refs/heads/main";

      sha256 = "BYBHiHyKjkuz+IlMrkdO++Mpz75PFSzPJz2Zbo26CGY=";

    };

    dontRewriteSymlinks = true;
    dontCheckForBrokenSymlinks = true;
    postPatch = ''
      patchShebangs install.sh
    '';

    installPhase = ''
      runHook preInstall
      ./install.sh -d $out/share/icons -t pink -s catppuccin
      runHook postInstall
    '';

  });

    niri = super.niri.overrideAttrs (oldAttrs: {
    src = self.fetchFromGitHub {
      owner = "visualglitch91";
      repo = "niri";
      rev = "3bef27675e80bd73c72cd67c97d5d94785f265b8";
      sha256 = "M96cjggtxgCA9ddeyqdZTv1LVx92bXuZy84Mill48Lk=";
    };
  });
}
