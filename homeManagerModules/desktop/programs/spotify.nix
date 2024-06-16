{ pkgs, config, lib, inputs, ... }:

let
  spicetify-nix = inputs.spicetify-nix;
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{

  imports = [ inputs.spicetify-nix.homeManagerModule ];

  options.settings.spotify.enable = lib.mkEnableOption "Enable spotify";


  config = lib.mkIf config.settings.spotify.enable {
    # allow spotify to be installed if you don't have unfree enabled already
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "spotify"
    ];

    programs.spicetify = {
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
        shuffle # shuffle+ (special characters are sanitized out of ext names)
        hidePodcasts
      ];
    };
  };
}

