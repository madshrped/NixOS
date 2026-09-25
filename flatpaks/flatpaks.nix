{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      ./paks/bambu-studio.nix
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
  };
}
