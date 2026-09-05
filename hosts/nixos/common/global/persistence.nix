{lib, inputs, config, ...}: {
  # Device-independent persistent directories

  environment.persistence = {
    "/persist" = {
      files = [
        "/etc/machine-id"
      ];
      directories = [
        "/var/lib/nixos"
        "/var/lib/systemd"
        "/var/log"
      ];
    };
  };
}
