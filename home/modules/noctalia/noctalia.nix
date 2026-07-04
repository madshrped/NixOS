{
  inputs,
  lib,
  ...
}:
let
  config_path = ./noctalia-settings.toml;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = lib.importTOML config_path;
  };
}
