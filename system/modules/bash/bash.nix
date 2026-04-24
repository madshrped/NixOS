{ lib, ... }:
{
  programs.bash = {
    enable = true;
    blesh.enable = true;
    undistractMe = {
      enable = true;
      playSound = true;
      timeout = 60;
    };
    vteIntegration = true;
    interactiveShellInit = "${lib.cancatStrings (
      builtins.map (file: builtins.readFile file) [
        builtins.readDir
        ./addons
      ]
    )}";
  };
}
