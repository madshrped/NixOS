{
  inputs,
  config,
  noctalia_settings_path,
  utils_path,
  ...
}:
let
  config_path = noctalia_settings_path;
in
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    setting = builtins.fromJSON (builtins.readFile config_path);
  };
  system.activationScripts.myScript.text = './{utils_path}/update-noctalia-settings.bash'

  '';
}
