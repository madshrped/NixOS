{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      ./paks/bambu-studio.nix
    ];
  };
}
