{
  lib,
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "gozilla";
    };

    shellAliases = {
      "yy" = "yazi";
      "noctalia-update" = "~/home/mads/nixos/utils/update-noctalia-settings.bash/";
      "plasma-update" = "/home/mads/nixos/utils/update-plasma-config.bash";
    };

    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];

    shellInit = ''
      ${lib.concatStrings (
        builtins.map (file: builtins.readFile file) (
          builtins.map (name: ./addons + "/${name}") (
            builtins.attrNames (lib.filterAttrs (name: type: type == "regular") (builtins.readDir ./addons))
          )
        )
      )}
    '';

    interactiveShellInit = ''
      unsetopt INTERACTIVE_COMMENTS
      setopt NO_INTERACTIVE_COMMENTS
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';

  };
}
