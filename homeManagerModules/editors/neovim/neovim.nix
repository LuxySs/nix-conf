{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.neovimModule;
in
{
  options = {
    neovimModule = {
      enable = lib.mkEnableOption "Enable Neovim";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor= true;
    };
  };
}
