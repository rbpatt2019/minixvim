{
  inputs,
  pkgs,
  system,
  ...
}:
{
  pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
    src = ./.;
    default_stages = [ "pre-commit" ];
    hooks = {
      check-added-large-files.enable = true;
      check-executables-have-shebangs.enable = true;
      check-shebang-scripts-are-executable.enable = true;
      check-merge-conflicts.enable = true;
      detect-private-keys.enable = true;
      end-of-file-fixer.enable = true;
      mixed-line-endings.enable = true;
      trim-trailing-whitespace.enable = true;
      forbid-submodules = {
        enable = true;
        name = "Forbid git submodules";
        description = "Forbids all git submodules in current dir.";
        language = "fail";
        entry = "Git submodules are not allowed here: ";
        types = [ "directory" ];
      };
      nixfmt-rfc-style.enable = true;
      statix.enable = true;
    };
  };
}
