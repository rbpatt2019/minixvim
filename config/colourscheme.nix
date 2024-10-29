{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        custom_highlights = ''
          function(highlights)
            return {
            CursorLineNr = { fg = highlights.peach, style = {} },
            NavicText = { fg = highlights.text },
            }
          end
        '';
        flavour = "mocha";
        no_bold = false;
        no_italic = false;
        no_underline = false;
        transparent_background = true;
        integrations = {
          mini = {
            enabled = true;
            indentscope_color = "rosewater";
          };
          gitsigns = true;
        };
      };
    };
  };
}
