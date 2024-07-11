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

    extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "networkmanager"
        "wheel"
      ];
      description = ''
        List of extra groups for the user.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "main user";
      extraGroups = cfg.extraGroups;
      shell = pkgs.fish;
    };
  };
}
