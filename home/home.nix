{
  pkgs,
  ...
}:
{
  imports = [
    ./modules/git.nix
    ./modules/firefox.nix
    ./modules/swaylock.nix
    ./modules/kitty.nix
    ./modules/waybar/waybar.nix
    ./modules/fuzzel.nix
    ./modules/portals.nix
    ./modules/plasma.nix
    ./modules/noctalia.nix
  ];

  home = {
    username = "mads";
    homeDirectory = "/home/mads";
    stateVersion = "25.05";
    packages = with pkgs; [
      zip
      signal-desktop
      fastfetch
      discord
      geckodriver
      gdb
      clang
      clang-tools
      steam-run
      vlc
      cmake
      gnumake
      pywalfox-native
    ];
  };

  xdg.configFile."niri/config.kdl" = {
    text = builtins.readFile ./modules/niri.kdl;
    force = true;
  };
}
