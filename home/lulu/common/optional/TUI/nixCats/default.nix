{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.nixCats;
  myNixCats = import ./conf { inherit inputs; };
in
{
  options.settings.nixCats.enable = lib.mkEnableOption "nixCats";

  config = lib.mkIf cfg.enable {
    home.packages = [ myNixCats.packages.${pkgs.system}.nixCats ];

    home.sessionVariables.EDITOR = "nixCats";
  };
}
