{
  plugins.notify.enable = true; # required to make noice playe nice with errors
  plugins.noice = {
    enable = true;
    settings = {
      presets = {
        command_palette = true;
        lsp_doc_border = true;
      };
      cmdline.enabled = true;
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      messages = {
        enabled = true;
        view = "mini";
        view_error = "notify";
        view_history = "mini";
        view_search = "mini";
        view_warn = "mini";
      };
      notify = {
        enabled = true;
        view = "mini";
      };
      popupmenu.enabled = true;
      smart_move.enabled = true;
    };
  };
}
