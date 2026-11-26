{
  description = "Nix package for Pdfcraft";

  nixConfig = {
    extra-substituters = [ "https://rogernavelsaker.cachix.org" ];
    extra-trusted-public-keys = [ "rogernavelsaker.cachix.org-1:n1DtzMNhA9Rz4Kg3xlXOi/KceULu8VrMbs9WXyMFQNQ=" ];
  };

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.callPackage ./nix/package.nix { };
    };
}
