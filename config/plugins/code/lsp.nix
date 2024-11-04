{ pkgs, ... }:
{
  plugins = {
    nix.enable = true;
    lsp-lines = {
      enable = true;
      luaConfig.post = ''
        vim.diagnostic.config({
          virtual_text = false,
          virtual_lines = { only_current_line = true },
        })'';
    };
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        # shell
        bashls.enable = true;

        # nix
        nil_ls.enable = true;

        # python
        pylyzer.enable = true;
        ruff.enable = true;

        # terraform
        terraformls.enable = true;

        # plain text lsps
        jsonls.enable = true;
        marksman.enable = true;
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                  "https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json" = ".gitlab-ci.yml";
                };
              };
            };
          };
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          "<localleader>h" = {
            action = "hover";
            desc = "Hover";
          };
          "<localleader>w" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<localleader>r" = {
            action = "rename";
            desc = "Rename";
          };
          "<localleader>a" = {
            action = "code_action";
            desc = "Code Action";
          };
        };
        diagnostic = { };
      };
    };
  };
}
