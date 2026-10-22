{
  inputs,
  pkgs,
}: {
  weiqihub = pkgs.callPackage ./weiqihub {};
  sabaki = pkgs.callPackage ./sabaki {};
}
