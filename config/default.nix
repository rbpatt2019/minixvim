_: {
  imports = [
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./filetypes.nix
    ./colourscheme.nix

    ./plugins/mini.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix

  ];
}
