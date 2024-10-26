_: {
  imports = [
    # Core settings
    ./settings.nix
    ./keymaps.nix
    ./filetypes.nix
    ./auto_cmds.nix
    ./colourscheme.nix

    # User Experience - make life easier
    ./plugins/ux/whichkey.nix

    # User Interface - beautification
    ./plugins/ui/dressing.nix

    ./bufferline.nix
  ];
}
