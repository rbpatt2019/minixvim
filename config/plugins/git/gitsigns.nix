{
  plugins.gitsigns = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua require('gitsigns').diffthis()<CR>";
      options = {
        desc = "Diff";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>";
      options = {
        desc = "Blame";
      };
    }
  ];
}
