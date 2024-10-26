_: {
  imports = [
    # Core settings
    ./settings.nix
    ./keymaps.nix
    ./filetypes.nix
    ./auto_cmds.nix
    ./colourscheme.nix

    # User Experience plugins
    ./plugins/ux/whichkey.nix

    ./bufferline.nix
  ];
}
