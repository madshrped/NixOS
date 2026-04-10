{ config, ... }:
{
  environment.variables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    UTILS = "${config.home.homeDirectory}/nixos/utils/";
  };
}
