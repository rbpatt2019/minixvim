{ lib, pkgs, ... }:
let
  pythonPackages = pkgs.python312Packages;
  doc-str-fmt =
    let
      pname = "docstrfmt";
      version = "1.9.0";
    in
    pythonPackages.buildPythonPackage {
      inherit pname version;
      src = pkgs.fetchPypi {
        inherit pname version;
        sha256 = "sha256-AxFJSFiGAjlvN9p71U4fy9Xn7Yv1NVdqA3cMybofWOY=";
      };
      doCheck = false;
      propagatedBuildInputs = [
        pythonPackages.black
        pythonPackages.click
        pythonPackages.docutils
        pythonPackages.libcst
        pythonPackages.platformdirs
        pythonPackages.sphinx
        pythonPackages.tabulate
        pythonPackages.toml
      ];
    };
in
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      notify_no_formatters = true;
      format_on_save = {
        timeoutMs = 500;
        lspFallback = true;
      };
      formatters_by_ft = {
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        json = [ "jq" ];
        nix = [ "nixfmt" ];
        python = [
          "ruff_fix"
          "ruff_format"
          "ruff_organize_imports"
          "docstrfmt"
        ];
        rst = [ "docstrfmt" ];
        toml = [ "taplo" ];
        yaml = [ "yamlfix" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        shellcheck = {
          command = lib.getExe pkgs.shellcheck;
        };
        shellharden = {
          command = lib.getExe pkgs.shellharden;
        };
        shfmt = {
          command = lib.getExe pkgs.shfmt;
        };
        nixfmt = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
        };
        taplo = {
          command = lib.getExe pkgs.taplo;
        };
        yamlfix = {
          command = lib.getExe pkgs.yamlfix;
        };
        docstrfmt = {
          command = lib.getExe doc-str-fmt;
        };
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<localleader>m";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        desc = "Format";
      };
    }
  ];
}
