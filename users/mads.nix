{ config, pkgs, ... }:

{
  users.users.mads = {
    isNormalUser = true;
    description = "Mads";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "dialout"
    ];
    packages = with pkgs; [ ];
  };
}
