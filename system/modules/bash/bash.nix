{ lib, ... }:
{
  programs.bash = {
    enable = true;
    undistractMe = {
      enable = true;
      playSound = true;
      timeout = 60;
    };
    interactiveShellInit = "${lib.concatStrings (
      builtins.map (file: builtins.readFile file) (
        builtins.map (name: ./addons + "/${name}") (
          builtins.attrNames (lib.filterAttrs (name: type: type == "regular") (builtins.readDir ./addons))
        )
      )
    )}";
  };
}
