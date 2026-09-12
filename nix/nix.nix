{
  nix = {
    gc = {
      options = "--delete-older-than 14d";
      automatic = true;
      dates = "weekly";
    };

    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];

      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
