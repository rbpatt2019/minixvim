_: {
  imports = [
    ./settings.nix
    ./keymaps.nix
    ./auto_cmds.nix
    ./filetypes.nix
    ./colourscheme.nix

    # User Interface - beautification
    ./plugins/ui/dressing.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitsigns.nix

    ./plugins/mini.nix
  ];
}
