{ config, lib, ... }:

let
  cfg = config.settings.virtualization;
in
{
  options.settings.virtualization.enable = lib.mkEnableOption "virtualization";

  config = lib.mkIf (cfg.enable) {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
