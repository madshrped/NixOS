{ pkgs, ... }:
{
  hardware.printers = {
    ensurePrinters = [
      {
        name = "Canon_TS5300_series";
        location = "Home";
        deviceUri = "ipp://325903000000.local:631/ipp/print";
        model = "everywhere";
      }
    ];
  };

  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        gutenprint-bin
        cnijfilter2
      ];
      browsing = false;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  systemd.services.ensure-printers = {
    after = [ "avahi-daemon.service" ];
    wants = [ "avahi-daemon.service" ];
  };
}
