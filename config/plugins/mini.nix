{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
      bracketed = { };
      bufremove = { };
      clue = {
        window = {
          delay = 200;
          config = {
            width = "auto";
          };
        };
        triggers = [
          {
            mode = "n";
            keys = "<Leader>";
          }
          {
            mode = "x";
            keys = "<Leader>";
          }
          {
            mode = "n";
            keys = "<LocalLeader>";
          }
          {
            mode = "x";
            keys = "<LocalLeader>";
          }
          {
            mode = "n";
            keys = "<C-w>";
          }
          {
            mode = "n";
            keys = "[";
          }
          {
            mode = "x";
            keys = "[";
          }
          {
            mode = "n";
            keys = "]";
          }
          {
            mode = "x";
            keys = "]";
          }
          {
            mode = "n";
            keys = "g";
          }
          {
            mode = "x";
            keys = "g";
          }
          {
            mode = "n";
            keys = "z";
          }
          {
            mode = "x";
            keys = "z";
          }
          {
            mode = "n";
            keys = "'";
          }
          {
            mode = "n";
            keys = "'";
          }
          {
            mode = "x";
            keys = "\"";
          }
          {
            mode = "x";
            keys = "\"";
          }
        ];
      };
      comment = {
        options.ignore_blank_line = true;
      };
      cursorword = { };
      files = { };
      git = { };
      icons = { };
      # starter = { };  File launched with starter don't use clue correctly?
      statusline = { };
      tabline = { };
    };

    # Configuring the clues for clue requires lua code.
    luaConfig.post = ''
      local miniclue = require('mini.clue')
      miniclue.setup({
        clues = {
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.z(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
        },
      })
    '';
  };
}
