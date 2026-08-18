{ lib, ... }:

{
  viAlias = true;
  vimAlias = true;
  opts = {
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
    foldtext = lib.mkForce "getline(v:foldstart)";
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
    signcolumn = "yes:1";
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
  globals.maplocalleader = ",";

  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;
    float = {
      border = "rounded";
    };
    jump = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };
    virtual_lines = false;
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

  highlight = {
    Comment.fg = "#ff00ff";
    Comment.bg = "#000000";
    Comment.underline = true;
    Comment.bold = true;
  };
}
