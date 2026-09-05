{lib, ...}: {
  services.tailscale = {
    enable = true;

    # Receive routes by default, overridable for possible future servers
    useRoutingFeatures = lib.mkDefault "client";
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
