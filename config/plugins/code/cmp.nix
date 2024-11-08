{
  plugins = {
    cmp-cmdline.enable = true; # all others auto enabled
    lspkind.enable = true; # for symbols
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "async_path"; }
          { name = "buffer"; }
          { name = "nvim-lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
        ];
        formatting = {
          expandable_indicator = true;
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };
        mapping = {
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<CR>" = ''
            	    cmp.mapping(function(fallback)
                          if cmp.visible() then
                              if luasnip.expandable() then
                                  luasnip.expand()
                              else
                                  cmp.confirm({
                                      select = true,
                                  })
                              end
                          else
                              fallback()
                          end
                        end)
            	  '';
          "<C-q>" = "cmp.mapping.abort()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })";
        };
        performance = {
          debounce = 60;
          max_view_entries = 30;
          fetching_timeout = 200;
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        view.docs.auto_open = true;
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
      };

      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [ { name = "buffer"; } ];
        };
        "?" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            {
              name = "cmdline";
              options = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
            { name = "buffer"; }
          ];
        };
      };
    };
  };
  extraConfigLua = ''
    luasnip = require("luasnip")
    kind_icons = {
      Text = "󰊄",
      Method = "",
      Function = "󰡱",
      Constructor = "",
      Field = "",
      Variable = "󱀍",
      Class = "",
      Interface = "",
      Module = "󰕳",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
  '';
}
