{ lib, config, ... }:

{
  options.settings.virtualization.enable = lib.mkEnableOption "virtualization";

  config = lib.mkIf (config.settings.virtualization.enable)  {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
