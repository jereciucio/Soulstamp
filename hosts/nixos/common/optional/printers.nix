{inputs, pkgs, ...}: {
  services.printing.enable = true;

  hardware.sane.enable = true;
  environment.systemPackages = with pkgs; [
    epsonscan2
  ];
}
