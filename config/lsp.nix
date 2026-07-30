{ lib, ... }:
{
  plugins.lspconfig.enable = true;
  lsp = {
    inlayHints.enable = true;
    servers = {
      # stuctured langs
      jsonls.enable = true;
      yamlls = {
        enable = true;
        config = {
          yaml.schemas = {
            "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
            "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
            "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
            "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json" =
              ".gitlab-ci.yml";
          };
        };
      };
      # python
      ruff.enable = true;
      ty.enable = true;
    };
    keymaps = [
      {
        key = "<localleader>d";
        lspBufAction = "definition";
        options.silent = true;
      }
      {
        key = "<localleader>t";
        lspBufAction = "type_definition";
        options.silent = true;
      }
      {
        key = "<localleader>i";
        lspBufAction = "implementation";
        options.silent = true;
      }
      {
        key = "<localleader>h";
        lspBufAction = "hover";
        options.silent = true;
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
        key = "[d";
        options.silent = true;
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
        key = "]d";
        options.silent = true;
      }
      {
        action = "<CMD>LspStop<Enter>";
        key = "<leader>lx";
        options.silent = true;
      }
      {
        action = "<CMD>LspStart<Enter>";
        key = "<leader>ls";
        options.silent = true;
      }
      {
        action = "<CMD>LspRestart<Enter>";
        key = "<leader>lr";
        options.silent = true;
      }
      # {
      # action = "<CMD>Lspsaga hover_doc<Enter>";
      # key = "K";
      # options.silent = true;
      # }
    ];
  };
}
