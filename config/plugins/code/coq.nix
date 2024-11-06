{
  plugins.coq-nvim = {
    enable = true;
    installArtifacts = true;
    settings = {
      auto_start = true;
      keymap = {
        jump_to_mark = "<A-space>";
      };
    };
  };
}
