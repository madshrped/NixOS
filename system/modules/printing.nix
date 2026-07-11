{ pkgs, ... }:
{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        gutenprint-bin
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
