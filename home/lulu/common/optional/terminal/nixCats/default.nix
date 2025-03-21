{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.settings.nixCats;
in
{
  imports = [
    inputs.myNixCats.homeModule
  ];

  options.settings.nixCats.enable = lib.mkEnableOption "nixCats";

  config = lib.mkIf cfg.enable {
    nixCats.enable = true;

    home.sessionVariables.EDITOR = "nixcats";
  };
}
