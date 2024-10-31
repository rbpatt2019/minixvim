_: {
  imports = [
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./filetypes.nix
    ./colourscheme.nix

    # Core Functionality
    ./plugins/mini.nix

    # UX improvements
    ./plugins/ux/toggleterm.nix
    ./plugins/ux/undotree.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix
  ];
}
