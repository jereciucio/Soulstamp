{
  lib,
  stdenv,
  fetchFromGitHub,
  godot_4_3,
  autoPatchelfHook,
  copyDesktopItems,
  makeDesktopItem,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "mision-control";
  version = "2-unstable-2026-11-10";

  src = fetchFromGitHub {
    owner = "Facundo-Sebastian-Ferraris";
    repo = "mision-control";
    rev = "31c5b84690acb94d983f010363151a065a63e387";
    hash = "sha256-XSynqLbiriectL+CAMBe9YTi6Wq4LGdqqhqZYxd5MtU=";
  };

  strictDeps = true;

  nativeBuildInputs = [
    godot_4_3
    autoPatchelfHook
    copyDesktopItems
  ];

  # The source-built export template links against the same system libraries,
  # so reuse its build inputs instead of duplicating the list here.
  buildInputs = godot_4_3.export-template.buildInputs;

  desktopItems = [
    (makeDesktopItem {
      name = "mision-control";
      desktopName = "Mision Control";
      exec = "mision-control";
      comment = "Task manager with a pixel-art space theme";
      categories = ["Utility"];
      terminal = false;
    })
  ];

  buildPhase = ''
    runHook preBuild

    # The repository ships prebuilt exports; remove them so the game is
    # generated from the Godot project sources instead.
    rm -rf .godot
    rm -f Mision_Control.exe Mision_Control.console.exe \
          Mision_Control.x86_64 Mision_Control.pck Mision_Control.sh

    export HOME=$(mktemp -d)
    mkdir -p "$HOME/.local/share/godot"
    ln -s "${godot_4_3.export-template}/share/godot/export_templates" \
          "$HOME/.local/share/godot/export_templates"

    mkdir -p build
    godot4 --headless --path . --export-release "Linux" build/Mision_Control.x86_64

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -D -m 755 build/Mision_Control.x86_64 $out/libexec/mision-control
    install -D -m 644 build/Mision_Control.pck $out/libexec/mision-control.pck

    mkdir -p $out/bin
    ln -s $out/libexec/mision-control $out/bin/mision-control

    runHook postInstall
  '';

  meta = {
    description = "Task manager with a pixel-art space theme";
    homepage = "https://github.com/Facundo-Sebastian-Ferraris/mision-control";
    license = lib.licenses.unfree;
    mainProgram = "mision-control";
    platforms = ["x86_64-linux"];
  };
})
