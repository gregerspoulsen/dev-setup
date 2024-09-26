{
  description = "A flake for building on top of an existing NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixos-config = {
    url = "path:/etc/nixos/configuration.nix"; # Adjust this path to your Vagrant box's existing configuration.nix
  };

  outputs = { self, nixpkgs, nixos-config }: {
    nixosConfigurations.my-machine = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Modify as per your system architecture
      modules = [
        nixos-config.nixosConfigurations.my-machine # Reference the upstream configuration
        ./system-config.nix # Additional configurations you want to add on top
      ];
    };
  };
}