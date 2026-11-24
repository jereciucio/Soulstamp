{pkgs, ...}: {
  home.packages = with pkgs; [
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    gcc #  As rustc needs cc lol
  ];
}
