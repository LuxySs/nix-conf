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
        colorScheme = "custom";
        customColorScheme = {
          text = "${config.lib.stylix.colors.base05}";
          subtext = "${config.lib.stylix.colors.base04}";
          sidebar-text = "${config.lib.stylix.colors.base05}";
          main = "${config.lib.stylix.colors.base00}";
          sidebar = "${config.lib.stylix.colors.base01}";
          player = "${config.lib.stylix.colors.base02}";
          card = "${config.lib.stylix.colors.base03}";
          shadow = "${config.lib.stylix.colors.base03}";
          selected-row = "${config.lib.stylix.colors.base02}";
          button = "${config.lib.stylix.colors.base0D}";
          button-active = "${config.lib.stylix.colors.base0B}";
          button-disabled = "${config.lib.stylix.colors.base03}";
          tab-active = "${config.lib.stylix.colors.base0A}";
          notification = "${config.lib.stylix.colors.base0C}";
          notification-error = "${config.lib.stylix.colors.base08}";
          misc = "${config.lib.stylix.colors.base07}";
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
