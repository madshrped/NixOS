{
  programs.waybar = {
    enable = true;
    style = ./mechabar/style.css;
  };
  xdg.configFile."waybar/config.jsonc".source = ./mechabar/config.jsonc;
}
