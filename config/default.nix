_: {
  imports = [

    # Core Functionality
    ./plugins/code/snippets.nix
    ./plugins/mini.nix

    # Code/LSP integration
    ./plugins/code/cmp.nix
    ./plugins/code/schemastore.nix
    ./plugins/code/treesitter.nix
    ./plugins/code/lspkind.nix

    # UX improvements
    ./plugins/ux/noice.nix
    ./plugins/ux/toggleterm.nix
    ./plugins/ux/undotree.nix
    ./plugins/ux/cutlass.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitgutter.nix

    # Settings
    ./lsp.nix
    ./options.nix
    ./keymaps.nix
    ./colourscheme.nix
  ];
}
