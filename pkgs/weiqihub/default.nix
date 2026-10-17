{lib, appimageTools, fetchurl}:
let
  version = "0.1.13";
  pname = "weiqihub";
  src = fetchurl {
    url = "https://github.com/ale64bit/WeiqiHub/releases/download/v${version}/WeiqiHub-v${version}-x86_64.AppImage";
    hash = "sha256-+mOWf3XTPuvskJV+TBD368LHRzxesBDBldSI1QvTggE=";
  };

  appimageContents = appimageTools.extractType1 { inherit pname src version; };
in
appimageTools.wrapType2 rec {
  inherit pname version src;

  extraInstallCommands = ''
  install -m 444 -D ${appimageContents}/com.walruswq.wqhub.desktop $out/share/applications/${pname}.desktop
  install -m 444 -D ${appimageContents}/wqhub.png $out/share/icons/hicolor/512x512/apps/wqhub.png

  substituteInPlace $out/share/applications/${pname}.desktop \
    --replace-fail 'Exec=wqhub' 'Exec=${pname}'
  '';

  meta = {
    description = "A unified client to multiple Go servers and offline puzzle solving";
    homepage = "https://walruswq.com/WeiqiHub";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
  };

  extraPkgs = pkgs: [pkgs.libepoxy];
}
