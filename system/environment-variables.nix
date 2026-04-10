{ config, ... }:
{
  environment.variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    UTILS = "${config.home.homeDirectory}/nixos/utils/";
    NOCTALIA_CONFIG_PATH = "${config.home.homeDirectory}/nixos/home/modules/noctalia/noctalia-settings.json";
  };
}
