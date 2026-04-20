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
    ./home-args.nix

    ./modules/git.nix
    ./modules/firefox.nix
    ./modules/zen-browser.nix
    ./modules/swaylock.nix
    ./modules/kitty.nix
    ./modules/fuzzel.nix
    ./modules/portals.nix
    ./modules/plasma.nix
    ./modules/noctalia/noctalia.nix
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

      nfsm
      nfsm-cli
    ];
  };

  xdg.configFile."niri/config.kdl" = {
    text = builtins.readFile ./modules/niri.kdl;
    force = true;
  };
}
