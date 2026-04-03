{
  pkgs,
  inputs,
  system,
  ...
}:

let
  inherit (inputs.nfsm-flake.packages.${system}) nfsm nfsm-cli;
in
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
      swaybg
      geckodriver
      nfsm
      nfsm-cli
      gdb
      clang
      clang-tools
      networkmanagerapplet
      steam-run
      vlc
      cmake
      gnumake
    ];
  };

  xdg.configFile."niri/config.kdl" = {
    text = builtins.readFile ./modules/niri.kdl;
    force = true;
  };
}
