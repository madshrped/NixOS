{ ... }:
{
  services.flatpak = {
    enable = true;
    packages = [
      {
        appId = "com.bambulab.BambuStudio";
        origin = "flathub";
      }
    ];
  };
}
