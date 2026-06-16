_:

{
  globalOpts = {
    autowrite = true;
    breakindent = true;
    clipboard = "unnamedplus";
    cmdheight = 0;
    confirm = true;
    cursorline = true;
    expandtab = true;
    foldenable = true;
    foldlevel = 99;
    foldmethod = "syntax";
    grepprg = "rg --vimgrep";
    ignorecase = true;
    laststatus = 3;
    linebreak = true;
    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    mouse = "";
    number = true;
    relativenumber = true;
    scrolloff = 4;
    shiftround = true;
    shiftwidth = 2;
    showmode = false;
    showtabline = 2;
    sidescrolloff = 8;
    signcolumn = "yes";
    smarttab = true;
    smartcase = true;
    smartindent = true;
    spell = false;
    splitbelow = true;
    splitkeep = "screen";
    splitright = true;
    swapfile = false;
    tabstop = 2;
    termguicolors = true;
    timeoutlen = 300;
    undodir = ".nvim-undodir";
    undofile = true;
    winborder = "rounded";
  };
  globals.mapleader = " ";
  globals.maplocalleader = ";";

  diagnostic.settings = {
    update_in_insert = true;
    severity_sort = true;
    float = {
      border = "rounded";
    };
    jump = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };
    virtual_lines = {
      current_line = true;
    };
    virtual_text = false;
  };

  userCommands = { };

  autoGroups = {
    highlight_yank = { };
    indentscope = { };
    filetypes = { };
  };

  autoCmd = [
    {
      desc = "Highlight text when yanked";
      group = "highlight_yank";
      event = [ "TextYankPost" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    {
      desc = "Disable indentscope for help buffers";
      group = "indentscope";
      event = [ "FileType" ];
      pattern = [
        "help"
        "Startup"
        "startup"
        "neo-tree"
        "Trouble"
        "trouble"
        "notify"
      ];
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }
  ];
  #autoCmd = [
  #  {
  #    event = [ "BufEnter" "BufWinEnter" ];
  #    pattern = [ "*.md" "*.mdx" ];
  #    command = "MarkdownPreviewToggle";
  #  }
  #];

  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
