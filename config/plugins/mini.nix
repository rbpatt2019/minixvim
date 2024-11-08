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
        ];
      };
      comment = {
        options.ignore_blank_line = true;
      };
      cursorword = { };
      diff = { };
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
          idle_stop = 2000;
        };
      };
      jump2d = { };
      map = { };
      move = { };
      # notify = { };
      pairs = { };
      pick = {
        options = {
          content_from_bottom = true;
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

    # These could probably be done with __raw, but I think they are more readable this way.
    luaConfig.post = ''
      local miniclue = require('mini.clue')
      miniclue.setup({
        clues = {
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.z(),
        },
      })

      require("mini.indentscope").gen_animation.none()

      local map = require('mini.map')
      local diagnostic_integration = map.gen_integration.diagnostic({
        error = 'DiagnosticFloatingError',
        warn  = 'DiagnosticFloatingWarn'
      })
      map.setup({ integrations = { diagnostic_integration } })
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
      key = "<localleader>fd";
      action = "<cmd>Pick diagnostic<CR>";
      options = {
        desc = "Find diagnostic";
      };
    }
    {
      mode = "n";
      key = "<localleader>fs";
      action = "<cmd>Pick lsp scope='document_symbol'<CR>";
      options = {
        desc = "Find symbol (doc)";
      };
    }
    {
      mode = "n";
      key = "<localleader>fS";
      action = "<cmd>Pick lsp scope='workspace_symbol'<CR>";
      options = {
        desc = "Find symbol (space)";
      };
    }
    {
      mode = "n";
      key = "<localleader>fr";
      action = "<cmd>Pick lsp scope='references'<CR>";
      options = {
        desc = "Find references";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua MiniDiff.toggle_overlay()<CR>";
      options = {
        desc = "Diff";
      };
    }
  ];
}
