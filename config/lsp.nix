{ lib, ... }:
{
  plugins.lspconfig.enable = true;
  plugins.lsp-lines.enable = false;
  plugins.lsp-progress.enable = true;
  plugins.lsp-format.enable = true;
  lsp = {
    inlayHints.enable = false;
    servers = {
      # stuctured langs
      jsonls.enable = true;
      taplo.enable = true;
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
      # nix
      nil_ls.enable = true;
      # python
      ruff.enable = true;
      ty.enable = true;
      # bash
      bashls.enable = true;
      # docker
      dockerls.enable = true;
      # text
      marksman.enable = true;
      harper_ls = {
        enable = true;
        config.settings = {
          "harper-ls" = {
            linters = {
              boring_words = true;
              linking_verbs = true;
              # Rarely useful with coding
              sentence_capitalization = false;
              spell_check = false;
            };
            codeActions = {
              forceStable = true;
            };
            dialect = "British";
          };
        };
      };
    };
    keymaps = [
      {
        key = "<localleader>d";
        lspBufAction = "definition";
        options = {
          silent = true;
          desc = "Go to definition";
        };
      }
      {
        key = "<localleader>t";
        lspBufAction = "type_definition";
        options = {
          silent = true;
          desc = "Go to type definition";
        };
      }
      {
        key = "<localleader>i";
        lspBufAction = "implementation";
        options = {
          silent = true;
          desc = "Go to type implementation";
        };
      }
      {
        key = "<localleader>h";
        lspBufAction = "hover";
        options = {
          silent = true;
          desc = "Hover";
        };
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=-1, float=true }) end";
        key = "[d";
        options = {
          silent = true;
          desc = "Prev. Diagnostic";
        };
      }
      {
        action = lib.nixvim.mkRaw "function() vim.diagnostic.jump({ count=1, float=true }) end";
        key = "]d";
        options = {
          silent = true;
          desc = "Next Diagnostic";
        };
      }
      {
        action = "<CMD>LspStop<Enter>";
        key = "<leader>lx";
        options = {
          silent = true;
          desc = "Stop LS";
        };
      }
      {
        action = "<CMD>LspStart<Enter>";
        key = "<leader>ls";
        options = {
          silent = true;
          desc = "Start LS";
        };
      }
      {
        action = "<CMD>LspRestart<Enter>";
        key = "<leader>lr";
        options = {
          silent = true;
          desc = "Re-start LS";
        };
      }
    ];
  };
}
