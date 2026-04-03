{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.sessionPackages = with pkgs; [
    kdePackages.plasma-workspace
  ];
}
