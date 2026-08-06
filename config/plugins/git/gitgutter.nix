{
  plugins.gitgutter = {
    enable = true;
    settings = {
      map_keys = false;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "zq";
      action = "<cmd>GitGutterFold<cr>";
      options = {
        desc = "Fold unchanged";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<Plug>(GitGutterPreviewHunk)";
      options = {
        desc = "Git diff hunk";
      };
    }
  ];
}
