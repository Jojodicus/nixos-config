{ inputs, ... }: {
  nix = {
    extraOptions = ''
      http-connections = 128
      experimental-features = nix-command flakes
    '';

    # Automatically run garbage collection for nix store
    gc = {
      automatic = true;
      dates = "weekly";
      randomizedDelaySec = "3h";
      options = "--delete-older-than 30d";
    };

    # Keep generated outputs on garbage collection
    settings.keep-outputs = true;
    settings.keep-derivations = true;

    # Auto optimise store on builds
    settings.auto-optimise-store = true;

    # Build in sandboxed environment
    settings.sandbox = true;

    settings.max-substitution-jobs = 128;

    # Use current nixpkgs version as default on the system
    registry.nixpkgs.flake = inputs.nixpkgs;

    # Compatibility for legacy Nix commands
    nixPath = [ "nixpkgs=${inputs.nixpkgs.outPath}" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels" ];
  };
}

