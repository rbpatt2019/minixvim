_: {
  plugins.lspconfig.enable = true;
  plugins.lsp-lines.enable = false;
  plugins.lsp-progress.enable = true;
  plugins.lsp-format.enable = true;
  lsp = {
    inlayHints.enable = false;
    servers = {
      # structured langs
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
      # Docker
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
        key = "<localleader>a";
        action = "<CMD>Lspsaga code_action<Enter>";
        options = {
          silent = true;
          desc = "Code Actions";
        };
      }
      {
        key = "<localleader>d";
        action = "<CMD>Lspsaga peek_definition<Enter>";
        options = {
          silent = true;
          desc = "Peek definition";
        };
      }
      {
        key = "<localleader>t";
        action = "<CMD>Lspsaga peek_type_definition<Enter>";
        options = {
          silent = true;
          desc = "Peek type definition";
        };
      }
      {
        key = "<localleader>h";
        action = "<CMD>Lspsaga hover_doc<Enter>";
        options = {
          silent = true;
          desc = "Hover";
        };
      }
      {
        key = "<localleader>e";
        action = "<CMD>Lspsaga outline<Enter>";
        options = {
          silent = true;
          desc = "Outline";
        };
      }
      {
        key = "<localleader>r";
        action = "<CMD>Lspsaga rename<Enter>";
        options = {
          silent = true;
          desc = "Rename";
        };
      }
      {
        action = "<CMD>Lspsaga diagnostic_jump_next<Enter>";
        key = "]d";
        options = {
          silent = true;
          desc = "Next Diagnostic";
        };
      }
      {
        action = "<CMD>Lspsaga diagnostic_jump_prev<Enter>";
        key = "[d";
        options = {
          silent = true;
          desc = "Prev. Diagnostic";
        };
      }
      {
        action = ":LspStop<Enter>";
        key = "<leader>lx";
        options = {
          silent = true;
          desc = "Stop LS";
        };
      }
      {
        action = ":LspStart<Enter>";
        key = "<leader>ls";
        options = {
          silent = true;
          desc = "Start LS";
        };
      }
      {
        action = ":LspRestart<Enter>";
        key = "<leader>lr";
        options = {
          silent = true;
          desc = "Re-start LS";
        };
      }
    ];
  };
}
