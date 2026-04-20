{
  inputs,
  ...
}:
let
  config_path = ./noctalia-settings.json;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile config_path);
  };
  xdg.configFile."noctalia/settings.json".force = true;
}
