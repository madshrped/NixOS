{
  inputs,
  ...
}:
let
  config_path = "./noctalia-settings.toml";
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    settings = config_path;
  };
}
