{ ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./main-user.nix
      ../../nixosModules/locale/locale.nix
    ];

  main-user.enable = true;
  main-user.userName = "lulu";
  main-user.extraGroups = [ "wheel" "NetworkManager" ];

  locale.enable = true;

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml"; 
  stylix.base16Scheme = {
    base00 = "282828"; # ----
    base01 = "3c3836"; # ---
    base02 = "504945"; # --
    base03 = "665c54"; # -
    base04 = "bdae93"; # +
    base05 = "d5c4a1"; # ++
    base06 = "ebdbb2"; # +++
    base07 = "fbf1c7"; # ++++
    base08 = "fb4934"; # red
    base09 = "fe8019"; # orange
    base0A = "fabd2f"; # yellow
    base0B = "b8bb26"; # green
    base0C = "8ec07c"; # aqua/cyan
    base0D = "83a598"; # blue
    base0E = "d3869b"; # purple
    base0F = "d65d0e"; # brown
  }; 

  stylix.image = /home/lulu/dotfiles/wallpapers/wallpapers/lightning.png;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

