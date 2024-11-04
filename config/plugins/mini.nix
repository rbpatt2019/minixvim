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
            mode = "n";
            keys = "<LocalLeader>";
          }
          {
            mode = "n";
            keys = "s";
          }
          {
            mode = "v";
            keys = "s";
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
            mode = "n";
            keys = "]";
          }
          {
            mode = "n";
            keys = "g";
          }
          {
            mode = "n";
            keys = "z";
          }
          {
            mode = "n";
            keys = "'";
          }
          {
            mode = "n";
            keys = "\"";
          }
        ];
      };
      comment = {
        options.ignore_blank_line = true;
      };
      cursorword = { };
      extra = { };
      files = { };
      fuzzy = { };
      git = { };
      icons = { };
      indentscope = {
        symbol = "|";
        options = {
          try_as_border = true;
        };
      };
      jump = {
        delay = {
          idle_stop = 5000;
        };
      };
      jump2d = { };
      move = { };
      # notify = { };
      pairs = { };
      pick = {
        options = {
          content_from_bottom = true;
        };
        window = {
          config = { };
        };
      };
      starter = { }; # File launched with starter don't use clue correctly?
      statusline = { };
      surround = {
        highlight_duration = 1000;
        search_method = "cover";
      };
      tabline = { };
      trailspace = { };
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
      require("mini.indentscope").gen_animation.none()
      vim.notify = require('mini.notify').make_notify()
    '';
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Pick git_files<CR>";
      options = {
        desc = "Find Files (git)";
      };
    }
    {
      mode = "n";
      key = "<leader>fF";
      action = "<cmd>Pick files<CR>";
      options = {
        desc = "Find Files (all)";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Pick grep_live<CR>";
      options = {
        desc = "Find grep";
      };
    }
    {
      mode = "n";
      key = "<leader>f?";
      action = "<cmd>Pick help<CR>";
      options = {
        desc = "Find help";
      };
    }
    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>Pick buffers<CR>";
      options = {
        desc = "Find buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Pick history<CR>";
      options = {
        desc = "Find history";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Pick commands<CR>";
      options = {
        desc = "Find command";
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>Pick marks<CR>";
      options = {
        desc = "Find marks";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Pick registers<CR>";
      options = {
        desc = "Find registers";
      };
    }
  ];
}
