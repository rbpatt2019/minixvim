{
  description = "A fully mini-aturised nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      nixvim,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      {
        ...
      }:
      {
        imports = [
          inputs.treefmt-nix.flakeModule
          inputs.git-hooks-nix.flakeModule
        ];
        systems = nixpkgs.lib.systems.flakeExposed;
        perSystem =
          {
            config,
            pkgs,
            system,
            ...
          }:
          let
            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};
            nixvimModule = {
              inherit pkgs;
              module = import ./config;
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
          in
          {
            packages.default = nvim;
            checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
            devShells.default = pkgs.mkShell {
              shellHook = ''
                ${config.pre-commit.installationScript}
                echo 1>&2 "Welcome to the development shell!"
              '';
            };
            pre-commit = {
              check.enable = false; # All non-trivial checks handled by treefmt
              settings.hooks = {
                check-added-large-files.enable = true;
                check-executables-have-shebangs.enable = true;
                check-shebang-scripts-are-executable.enable = true;
                check-merge-conflicts.enable = true;
                detect-private-keys.enable = true;
                end-of-file-fixer.enable = true;
                mixed-line-endings.enable = true;
                trim-trailing-whitespace.enable = true;
                treefmt = {
                  enable = true;
                  verbose = true;
                  settings.formatters = [
                    pkgs.actionlint
                    pkgs.nixfmt-pkgs
                    pkgs.deadnix
                    pkgs.statix
                    pkgs.yamlfmt
                  ];
                };
              };
            };
            treefmt = {
              programs = {
                nixfmt.enable = true;
                deadnix.enable = true;
                statix.enable = true;
                yamlfmt.enable = true;
              };
            };
          };
      }
    );
}
