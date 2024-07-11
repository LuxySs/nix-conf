{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "Enable user module";
    userName = lib.mkStrOption "mainuser" "main user's username";
    defaultShell = lib.mkPkgOption pkgs.bash "user's main shell";
    extraGroups = lib.mkOption {
      description = ''List of extra groups for the user. '';
      default = [
        "networkmanager"
        "wheel"
      ];
      type = lib.types.listOf lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      description = "main user";
      extraGroups = cfg.extraGroups;
      isNormalUser = true;
      shell = cfg.defaultShell;
    };
  };
}
