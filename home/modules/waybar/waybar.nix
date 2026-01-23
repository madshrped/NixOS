{
  programs.waybar = {
    enable = true;
    style = ./style.css;
  };
  xdg.configFile."waybar/config.jsonc".source =
    /home/mads/nixos/home/modules/waybar/mechabar/config.jsonc;
}
