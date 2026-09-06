{
  lib,
  config,
  ...
}: {
  services.tailscale = {
    enable = true;

    # Receive routes by default, overridable for possible future servers
    useRoutingFeatures = lib.mkDefault "client";

    # Autologin when setting up a new host
    authKeyFile = config.sops.secrets.tailscale_authkey.path;
  };

  sops.secrets = {
    tailscale_authkey = {
      sopsFile = ../../../secrets.yaml;
    };
  };

  # Easier NAT traversal when possible
  networking.firewall.allowedUDPPorts = [41641];

  # Persist tailscale things :)
  environment.persistence = {
    "/persist".directories = [
      {
        directory = "/var/lib/tailscale";
      }
    ];
  };
}
