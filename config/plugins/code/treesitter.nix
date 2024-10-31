{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    folding = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    indent = true;
    nixvimInjections = true;
  };

  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "at" = "@comment.outer";
        "it" = "@comment.outer";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
      };
    };
    move = {
      # should be handled by mini.bracketed
      enable = false;
    };
    swap = {
      enable = false;
    };
  };
}
