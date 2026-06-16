{ pkgs, ... }:
{
  extraPackages = with pkgs; [ shfmt ];
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
          [
            "shellcheck"
            "shellharden"
            "shfmt"
          ]
        ];
        json = [ "jq" ];
        lua = [ "stylua" ];
        markdown = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        nix = [ "nixfmt" ];
        python = [
          [
            "ruff_fix"
            "ruff_format"
            "ruff_organize_imports"
          ]
        ];
        rst = [ "rstfmt" ];
        terraform = [ "terraform_fmt" ];
        toml = [ "taplo" ];
        yaml = [ "yq" ];
        # zsh
        # sh
        "*" = [ "codespell" ];
        "_" = [ "treefmt" ];
      };
      #formatters = {
      #shellcheck = {
      #command = lib.getExe pkgs.shellcheck;
      #};
      #shellharden = {
      #command = lib.getExe pkgs.shellharden;
      #};
      #shfmt = {
      #command = lib.getExe pkgs.shfmt;
      #};
      #nixfmt = {
      #command = lib.getExe pkgs.nixfmt;
      #};
      #taplo = {
      #command = lib.getExe pkgs.taplo;
      #};
      #yamlfix = {
      #command = lib.getExe pkgs.yamlfix;
      #};
      #docstrfmt = {
      #command = lib.getExe doc-str-fmt;
      #};
      #};
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
