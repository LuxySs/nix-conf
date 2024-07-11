{
  config,
  lib,
  myNixos,
  ...
}:

let
  cfg = config.settings.noGUI.git;
in
{
  options.settings.noGUI.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf (cfg.enable) {
    programs.git = {
      enable = true;
      userEmail = myNixos.email;
      userName = myNixos.username;
    };
  };
}
