{
  lib,
  appimageTools,
  fetchurl,
  runCommand,
  imagemagick,
}:
let
  icon =
    runCommand "helium-icon"
      {
        nativeBuildInputs = [ imagemagick ];
        src = fetchurl {
          url = "https://raw.githubusercontent.com/imputnet/helium-chromium/main/resources/branding/product_logo.svg";
          hash = "sha256-frK4oLAKjM7+K0cSwpipwyDYu9RPbekTNiHj8/3TTno=";
        };
      }
      ''
        mkdir -p $out/share/icons/hicolor/256x256/apps
        convert -background none $src -resize 256x256 $out/share/icons/hicolor/256x256/apps/helium.png

        mkdir -p $out/share/icons/hicolor/512x512/apps
        convert -background none $src -resize 512x512 $out/share/icons/hicolor/512x512/apps/helium.png

        mkdir -p $out/share/icons/hicolor/128x128/apps
        convert -background none $src -resize 128x128 $out/share/icons/hicolor/128x128/apps/helium.png
      '';
in
appimageTools.wrapType2 rec {
  pname = "helium";
  version = "0.4.11.1";
  src = fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/0.4.11.1/helium-0.4.11.1-x86_64.AppImage";
    hash = "sha256:3780bced75846e227bd444faa69fa3d2e7a2ca3b7417b1c0fce90f88af4e30c2";
  };

  extraInstallCommands = ''
    mkdir -p $out/share/icons
    cp -r ${icon}/share/icons/* $out/share/icons/

    mkdir -p $out/share/applications
    cat > $out/share/applications/helium.desktop <<EOF
    [Desktop Entry]
    Type=Application
    Name=Helium
    Exec=${pname} %F
    Icon=helium
    Categories=Network;WebBrowser;
    Comment=Helium browser
    EOF
  '';
  meta = with lib; {
    description = "Brand new browser";
    homepage = "https://github.com/imputnet/helium-linux";
    platforms = [ "x86_64-linux" ];
    license = licenses.unfree;
    maintainers = [ ];
  };
}
