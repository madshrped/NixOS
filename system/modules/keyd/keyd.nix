{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = import ./keyboards/key_default.nix;
      };
    };
  };
}
