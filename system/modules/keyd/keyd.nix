{
  services.keyd.keyboards = {
    enable = true;
    default = {
      ids = [ "*" ];
      settings = import ./keyboards/key_default.nix;
    };
  };
}
