{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.sops
    pkgs.age
    pkgs.ssh-to-age
  ];

  sops.age.sshKeyPaths = ["/persist/etc/ssh/ssh_host_ed25519_key"];
}
