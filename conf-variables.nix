{ config, ... }:
{
  _module.args = {
    noctalia_setting_path = "${config.home.homeDirectory}/nixos/home/modules/noctalia/noctalia-settings.json";
    utils_path = "${config.home.homeDirectory}/nixos/utils/";
  };
}
