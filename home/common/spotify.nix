{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.spotify;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.settings.spotify.enable = lib.mkEnableOption "Enable spotify";

  config = lib.mkIf (cfg.enable) {
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          keyboardShortcut
        ];
      };
  };
}
