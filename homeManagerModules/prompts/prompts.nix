{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.prompts;
in
{
  imports = [
    ./starship/starship.nix
  ];

  options.prompts = {
    enable = mkEnableOption "enable prompts module";
    enableStarship = mkEnableOption "enable starship module";
  };

  config = mkIf cfg.enable {
    starshipModule.enable = cfg.enableStarship;
  };
}
