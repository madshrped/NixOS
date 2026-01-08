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
      "docker"
    ];
    packages = with pkgs; [ ];
  };
}
