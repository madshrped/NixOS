{ config, ... }:
{
  _module.args = {
    utils_path = "${config.home.homeDirectory}/nixos/utils/";
  };
}
