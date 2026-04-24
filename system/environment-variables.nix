{ config, ... }:
let
  home = config.users.users.mads.home;
in
{
  environment = {
    variables = {
      BROWSER = "firefox";
      EDITOR = "nvim";
    };

    sessionVariables = {
      UTILS = "${home}/nixos/utils/";
      NOCTALIA_SETTINGS_PATH = "${home}/nixos/home/modules/noctalia/noctalia-settings.json";
      PLASMA_CONFIG_PATH = "${home}/nixos/home/modules/plasma.nix";
    };
  };
}
