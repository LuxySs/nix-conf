{ 
  config,
  inputs,
  lib,
  pkgs,
  ... 
}:

let
  cfg = config.settings.noGUI.nixCats;
  myNixCats = import ./entry.nix { inherit inputs; };
in
{
  options.settings.noGUI.nixCats.enable = lib.mkDisableOption "nixCats"; 

  config = lib.mkIf cfg.enable {
    home.packages = [ myNixCats.packages.${pkgs.system}.nixCats ];

    home.sessionVariables.EDITOR = "nixCats";
  };
}
