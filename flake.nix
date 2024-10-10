{
  description = "Johannes' NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations."16ach6" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        {
          networking.hostName = "16ach6";
          system.stateVersion = "24.05";
        }

        ./configuration
      ];

      specialArgs = { inherit inputs; };
    };
  };
}

# VM starten mit `nix run .\#nixosConfigurations.16ach6.config.system.build.vm`
