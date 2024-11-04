{ pkgs, ... }:
let
  cutlass = pkgs.vimUtils.buildVimPlugin {
    name = "cutlass.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "1ac7e4b53d79410be52a9e464d44c60556282b3e";
      hash = "sha256-zmS/JlcGW8hLWla01F2z9QMfnIYvWr5BkPCoZqzsAFw=";
    };
  };
in
{
  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = cutlass;
      config = ''
        lua require("cutlass").setup({cut_key="q"})
      '';
    }
  ];
}
