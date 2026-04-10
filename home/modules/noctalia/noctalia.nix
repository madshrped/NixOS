{
  inputs,
  config,
  noctalia_settings_path,
  ...
}:
let
  config_path = noctalia_settings_path;
in
{
  imports = [
    inputs.noctalia.homeModules.default
    ""
  ];

  programs.noctalia-shell = {
    enable = true;
    setting = builtins.fromJSON (builtins.readFile config_path);
  };
  system.activationScripts.myScript.text = "${config.home.homeDirectory}/update-noctalia-settings.bash";
}
