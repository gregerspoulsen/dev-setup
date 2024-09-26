{
  description = "A flake using nixbox configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixbox = {
      url = "github:nix-community/nixbox";
    };
  };

  outputs = { self, nixpkgs, nixbox }: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # or the appropriate system architecture
      modules = [
        nixbox.scripts.configuration  # Use nixbox's configuration.nix
        ./additional-config.nix       # Your local configuration
      ];
    };
  };
}