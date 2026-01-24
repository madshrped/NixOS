{ lib, ... }:
let
  waybarDir = ./.;
in
{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        include = [
          "$XDG_CONFIG_HOME/waybar/modules/*.jsonc"
          "$XDG_CONFIG_HOME/waybar/modules/custom/*.jsonc"
          "$XDG_CONFIG_HOME/waybar/modules/hyprland/*.jsonc"
        ];

        modules-left = [
          "group/user"
          "custom/left_div#1"
          "hyprland/workspaces"
          "custom/right_div#1"
          "hyprland/window"
        ];

        modules-center = [
          "hyprland/windowcount"
          "custom/left_div#2"
          "temperature"
          "custom/left_div#3"
          "memory"
          "custom/left_div#4"
          "cpu"
          "custom/left_inv#1"
          "custom/left_div#5"
          "custom/distro"
          "custom/right_div#2"
          "custom/right_inv#1"
          "idle_inhibitor"
          "clock#time"
          "custom/right_div#3"
          "clock#date"
          "custom/right_div#4"
          "network"
          "bluetooth"
          "custom/system_update"
          "custom/right_div#5"
        ];

        modules-right = [
          "mpris"
          "custom/left_div#6"
          "group/pulseaudio"
          "custom/left_div#7"
          "backlight"
          "custom/left_div#8"
          "battery"
          "custom/left_inv#2"
          "custom/power_menu"
        ];

        layer = "top";
        height = 24;
        width = 0;
        spacing = 0;
        mode = "dock";
        reload_style_on_change = true;
      };
    };
  };
  xdg.configFile."waybar/style.css".source = lib.mkForce ./style.css;
  xdg.configFile."waybar/theme.css".source = lib.mkForce ./theme.css;
  xdg.configFile."waybar/styles".source = lib.mkForce ./styles;
  xdg.configFile."waybar/styles/fonts.css".source = lib.mkForce ./styles/fonts.css;
}
