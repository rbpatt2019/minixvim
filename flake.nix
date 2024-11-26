{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    pre-commit-hooks.url = "github:cachix/git-hooks.nix";
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      pre-commit-hooks,
      self,
      ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./checks { inherit inputs system pkgs; }
      );

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          precommit = self.checks.${system}.pre-commit-check;
        in
        import ./shell.nix { inherit pkgs precommit; }
      );

      defaultPackage = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config; # import the module directly
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        nvim
      );
    };
}
