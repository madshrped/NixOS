{ config, ... }:
{
  environment.variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    UTILS = "${config.home.homeDirectory}/nixos/utils/";
    NOCTALIA_SETTINGS_PATH = "${config.home.homeDirectory}/nixos/home/modules/noctalia/noctalia-setting.json";
  };
}
