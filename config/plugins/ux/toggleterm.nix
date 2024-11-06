{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "vertical";
      float_opts = {
        border = "curved";
      };
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<cr>";
      options = {
        desc = "Toggle Term.";
      };
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options = {
        desc = "Toggle Vertical Term.";
      };
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options = {
        desc = "Toggle Horizontal Term.";
      };
    }
    {
      mode = "n";
      key = "<localleader><localleader>";
      action = "<cmd>ToggleTermSendCurrentLine trim_spaces=false<cr>";
      options = {
        desc = "Send line to Term.";
      };
    }
    {
      mode = "v";
      key = "<localleader><localleader>";
      action = "<cmd>ToggleTermSendVisualLines trim_spaces=false<cr>";
      options = {
        desc = "Send line to Term.";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<localleader>t";
      action = "<cmd>TermExec cmd='ipython --no-autoindent'<cr>";
      options = {
        desc = "Launch iPython";
        remap = true;
      };
    }
  ];
}
