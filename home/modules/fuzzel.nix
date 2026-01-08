{ pkgs, config, ... }:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        match-counter = true;
        show-actions = true;
        terminal = "kitty";
        dpi-aware = true;
        tabs = 4;
      };
    };
  };
}
