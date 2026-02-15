{ config, lib, ... }:

let
  cfg = config.settings.virtualization;
in
{
  options.settings.virtualization.enable = lib.mkEnableOption "virtualization";

  config = lib.mkIf (cfg.enable) {
    # **** virt-manager ****
    #
    # virtualisation.libvirtd.enable = true;
    # programs.virt-manager.enable = true;
    # users.groups.libvirtd.members = [ "lulu" ];
    # virtualisation.spiceUSBRedirection.enable = true;

    # **** virtualbox ****
    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "lulu" ];

    # Guest Additions
    virtualisation.virtualbox.guest.enable = true;
  };
}
