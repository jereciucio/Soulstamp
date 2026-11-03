{config, lib, ...}: {
  services.kanata = {
    enable = true;

    keyboards.kbd = {
      config = (builtins.readFile ./canary.kbd);
    };
  };
}
