_: {
  imports = [
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./filetypes.nix
    ./colourscheme.nix

    # Core Functionality
    ./plugins/mini.nix

    # Code/LSP integration
    ./plugins/code/lsp.nix
    ./plugins/code/fidget.nix
    ./plugins/code/schemastore.nix
    ./plugins/code/treesitter.nix

    # UX improvements
    ./plugins/ux/toggleterm.nix
    ./plugins/ux/undotree.nix
    ./plugins/ux/cutlass.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix
  ];
}
