{ lib, ... }:
{
  programs.niri = {
    enable = true;
  };
  services.displayManager.defaultSession = lib.mkForce "niri";
}
