self: super: {

  colloid-icon-theme = super.colloid-icon-theme.overrideAttrs (oldAttrs: rec {

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
}
