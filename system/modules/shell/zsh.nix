{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "yy" = "yazi";
      "noctalia-update" = "~/home/mads/nixos/utils/update-noctalia-settings.bash/";
      "plasma-update" = "/home/mads/nixos/utils/update-plasma-config.bash";
    };

    initContent = ''
      ${lib.concatStrings (
        builtins.map (file: builtins.readFile file) (
          builtins.map (name: ./addons + "/${name}") (
            builtins.attrNames (lib.filterAttrs (name: type: type == "regular") (builtins.readDir ./addons))
          )
        )
      )}
    '';
  };
}
