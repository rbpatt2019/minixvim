{ lib, pkgs, ... }:
{
  lsp = {
    inlayHints.enable = true;
    servers = {
      nixd = {
        enable = true;
        config =
          let
            flake = ''(builtins.getFlake "github:elythh/flake)""'';
            flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim)""'';
          in
          {
            nixpkgs = {
              expr = "import ${flake}.inputs.nixpkgs { }";
            };
            formatting = {
              command = [ "${lib.getExe pkgs.nixfmt}" ];
            };
            options = {
              nixos.expr = "${flake}.nixosConfigurations.grovetender.options";
              nixvim.expr = "${flakeNixvim}.packages.${pkgs.system}.default.options";
            };
          };
      };

      # yaml
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

      # lua
      lua_ls = {
        enable = true;
        config.telemetry.enable = false;
      };

      # Spellcheck
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

      taplo.enable = true; # toml
      jsonls.enable = true; # json
      dockerls.enable = true; # Docker
      bashls.enable = true; # Bash
      markdown_oxide.enable = true; # Markdown
      ruff.enable = true; # python
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
