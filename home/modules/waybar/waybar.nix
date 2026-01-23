{
  programs.waybar = {
    enable = true;
    style = ./mechabar/style.css;
  };
  xdg.configFile."waybar/config.jsonc".source =
    /home/mads/nixos/home/modules/waybar/mechabar/style.css;
}
