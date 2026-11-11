{
  inputs,
  pkgs,
}: {
  weiqihub = pkgs.callPackage ./weiqihub {};
  sabaki = pkgs.callPackage ./sabaki {};
  mision-control = pkgs.callPackage ./mision-control {};
}
