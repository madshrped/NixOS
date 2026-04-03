{ config, pkgs, ... }:

{
  imports = [
    ./modules/fonts.nix
    ./modules/yazi.nix
    ./modules/nvf/nvf.nix
    ./modules/winboat.nix
    ./modules/ly.nix
    ./modules/plasma.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "ventoy-1.1.07"
    ];
  };
  environment = {
    systemPackages = with pkgs; [
      neovim
      wget
      xwayland-satellite
      wl-clipboard
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  programs.niri.enable = true;
}
