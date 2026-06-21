{ config, pkgs, ... }:
let
  pywalfox = pkgs.pywalfox-native;
in
{
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };

  home.file.".mozilla/native-messaging-hosts/pywalfox.json".text = builtins.toJSON {
    name = "pywalfox";
    description = "Pywalfox native messaging host";
    path = "${pywalfox}/bin/pywalfox";
    type = "stdio";
    allowed_extensions = [ "pywalfox@frewacom.org" ];
  };
}
