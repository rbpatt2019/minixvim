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
    {
      flake-parts,
      nixvim,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.git-hooks-nix.flakeModule
      ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      perSystem =
        {
          config,
          system,
          pkgs,
          ...
        }:
        let
          configuration = nixvim.lib.evalNixvim {
            inherit system;
            modules = [ ./config ];
          };
        in
        {
          packages.default = configuration.config.build.package;
          checks.default = configuration.config.build.test;
          treefmt = {
            flakeFormatter = true;
            flakeCheck = false; # handled by pre-commit
            programs = {
              nixfmt.enable = true;
              deadnix.enable = true;
              statix.enable = true;
              rstfmt.enable = true;
              yamlfmt.enable = true;
            };
          };
          pre-commit.settings = {
            package = pkgs.prek;
            hooks = {
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
              };
              flake-checker.enable = true;
              checks = {
                enable = true;
                name = "nix flake check";
                entry = "nix flake check --no-warn-dirty .";
                pass_filenames = false;
                stages = [ "pre-push" ];
              };
              update = {
                enable = true;
                name = "nix flake update";
                entry = "nix flake update";
                pass_filenames = false;
                stages = [ "pre-push" ];
              };
            };
          };
          devShells.default = config.pre-commit.devShell;
        };
    };
}
