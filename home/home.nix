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
    ./modules/btop.nix
    ./modules/git.nix
    ./modules/firefox.nix
    ./modules/kitty.nix
    ./modules/portals.nix
    ./modules/plasma.nix
    ./modules/noctalia/noctalia.nix

    ./modules/bambu-lab.nix
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
      vlc
      geckodriver

      pywalfox-native

      gdb
      clang
      clang-tools
      cmake
      gnumake

      kicad
      arduino-cli
      arduino-ide

      steam-run

      nfsm
      nfsm-cli

      tetrio-desktop
    ];
  };

  xdg.configFile."niri/config.kdl" = {
    text = builtins.readFile ./modules/niri.kdl;
    force = true;
  };
}
