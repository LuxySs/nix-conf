{ lib, config, ... }:

{
  options.settings.virtualization.enable = lib.mkEnableOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf (config.settings.virtualization.enable)  {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}
