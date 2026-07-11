{ pkgs, ... }:

{
  users.users.mads = {
    isNormalUser = true;
    description = "Mads";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "dialout"
      "docker"
      "lpadmin"
    ];
    packages = with pkgs; [ ];
  };
}
