{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell = {
    enable = true;
    setting = builtins.fromJSON (builtins.readFile "$NOCTALIA_CONFIG_PATH");
  };
}
