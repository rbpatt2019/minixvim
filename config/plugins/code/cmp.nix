{
  plugins = {
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        completion.documentation.auto_show = false;
        completion.list.selection.preselect = false;
        signature.enabled = true;
        keymap.preset = "super-tab";
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "ripgrep"
          ];
          providers = {
            buffer.score_offset = -7;
            lsp.fallbacks = [ ];
            ripgrep = {
              module = "blink-ripgrep";
              name = "Ripgrep";
              async = true;
              score_offset = 100;
            };
          };
        };
      };
    };
  };
}
