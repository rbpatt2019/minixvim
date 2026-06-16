_: {
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
        clues = [
          { __raw = "require('mini.clue').gen_clues.square_brackets()"; }
          { __raw = "require('mini.clue').gen_clues.builtin_completion()"; }
          { __raw = "require('mini.clue').gen_clues.g()"; }
          { __raw = "require('mini.clue').gen_clues.marks()"; }
          { __raw = "require('mini.clue').gen_clues.registers()"; }
          { __raw = "require('mini.clue').gen_clues.windows()"; }
          { __raw = "require('mini.clue').gen_clues.z()"; }
        ];
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
      completion = { };
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
      jump2d = {
        mappings.start_jumping = "<leader><leader>";
        allowed_windows.not_current = false;
      };
      move = { };
      pairs = { };
      pick = {
        options = {
          content_from_bottom = true;
        };
      };
      snippets = {
        snippets = [
          { __raw = "require('mini.snippets').gen_loader.from_lang()"; }
        ];
        expand = {
          select.__raw = ''
            function(snippets, insert)
              local select = _G.NixMiniSnippetsSelectOverride or MiniSnippets.default_select
              select(snippets, insert)
            end
          '';
        };
        mappings = {
          expand = "<CR>";
          jump_next = "<tab>";
          jump_prev = "<S-tab>";
          stop = "<C-s>";
        };
      };
      starter = { }; # File launched with starter don't use clue correctly?
      statusline = { };
      surround = {
        highlight_duration = 1000;
        search_method = "cover";
      };
      tabline = { };
    };

    luaConfig.post = ''
      require("mini.indentscope").gen_animation.none()
      local imap_expr = function(lhs, rhs)
        vim.keymap.set('i', lhs, rhs, { expr = true })
      end
      imap_expr('<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
      imap_expr('<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

      _G.cr_action = function()
        -- If there is selected item in popup, accept it with <C-y>
        if vim.fn.complete_info()['selected'] ~= -1 then return '\25' end
        -- Fall back to plain `<CR>`. You might want to customize according
        -- to other plugins. For example if 'mini.pairs' is set up, replace
        -- next line with `return MiniPairs.cr()`
        return '\r'
      end

      vim.keymap.set('i', '<CR>', 'v:lua.cr_action()', { expr = true })
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
