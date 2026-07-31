{
  plugins.lspkind.enable = true; # for symbols
  plugins.lspsaga = {
    enable = true;
    settings = {
      symbol_in_winbar.enable = true;
      beacon.enable = true;
      callhierarchy = false;
      code_action.enable = true;
      definition.enable = true;
      diagnostic = {
        enable = true;
        diagnostic_only_current = true;
      };
      finder.enable = false;
      hover.enable = true;
      implement.enable = true;
      lightbulb = {
        enable = true;
        sign = false;
      };
      outline = {
        enable = true;
        auto_preview = false;
        close_after_jump = true;
      };
      rename.enable = true;
    };
  };
}
