{
  lib,
  buildNpmPackage,
  fetchFromGitHub,
  electron_43,
  makeWrapper,
  nodejs_24,
}:
buildNpmPackage rec {
  pname = "sabaki";
  version = "0.60.0";

  src = fetchFromGitHub {
    owner = "SabakiHQ";
    repo = "Sabaki";
    rev = "v${version}";
    hash = "sha256-EJ7AFPaU9MGd+z+w+I7CK0MUA26AwnYZbMklLI+7w2M=";
  };

  npmDepsHash = "sha256-5QIhV2XbnSEXQBG566pxanDymQ3Xr3PxarhVxDXIYHk=";
  nodejs = nodejs_24;

  env = {
    ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
    PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
  };

  dontNpmBuild = true;
  buildPhase = "npm run bundle";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/sabaki $out/bin \
             $out/share/applications \
             $out/share/icons/hicolor/512x512/apps

    npm prune --omit=dev

    cp -r package.json index.html bundle.js src style img data logo.png build node_modules $out/lib/sabaki/

    makeWrapper ${lib.getExe electron_43} $out/bin/sabaki \
      --add-flags "$out/lib/sabaki"

    install -m 444 logo.png $out/share/icons/hicolor/512x512/apps/sabaki.png
    cat > $out/share/applications/sabaki.desktop <<EOF
    [Desktop Entry]
    Name=Sabaki
    Comment=An elegant Go/Baduk/Weiqi board and SGF editor
    Exec=sabaki %F
    Icon=sabaki
    Terminal=false
    Type=Application
    Categories=Game;BoardGame;
    MimeType=application/x-go-sgf;
    EOF

    runHook postInstall
  '';

  meta = {
    description = "An elegant Go/Baduk/Weiqi board and SGF editor";
    homepage = "https://sabaki.yichuanshen.de";
    license = lib.licenses.mit;
    mainProgram = "sabaki";
    platforms = ["x86_64-linux"];
  };
}
