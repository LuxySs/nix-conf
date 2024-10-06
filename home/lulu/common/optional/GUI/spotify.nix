{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.spotify;
  stylixEnabled = config.settings.stylix.enable; # check if stylix is enabled
  stylixColor = config.lib.stylix.colors;
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

        # Conditionally set colorScheme if stylix is enabled
        colorScheme = if stylixEnabled then "custom" else "default";
        customColorScheme = lib.mkIf stylixEnabled {
          card = "${stylixColor.base02}";
          highlight = "${stylixColor.base02}";
          highlight-elevated = "${stylixColor.base03}";
          main = "${stylixColor.base00}";
          main-elevated = "${stylixColor.base02}";
          misc = "${stylixColor.base03}";
          notification = "${stylixColor.base02}";
          notification-error = "${stylixColor.base08}";
          shadow = "${stylixColor.base01}";
          sidebar = "${stylixColor.base01}";
          sidebar-text = "${stylixColor.base05}";
          subtext = "${stylixColor.base05}";
          tab-active = "${stylixColor.base02}";
          text = "${stylixColor.base05}";
        };

        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          hidePodcasts
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          keyboardShortcut
        ];
      };
  };
}
