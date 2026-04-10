{ config, ... }:
{
  _moduls.args = {
    noctalia_settings_path = "${config.home.homeDirectory}/nixos/home/modules/noctalia/noctalia-settings.json";
  };
}
