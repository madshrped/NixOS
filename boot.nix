{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;

        configurationLimit = 5;
      };
      timeout = 10;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
