{ config, pkgs, ... }: {
  imports =
    [
      ../../homeManagerModules/shells/sh.nix
      ../../homeManagerModules/terminals/foot.nix
      ../../homeManagerModules/editors/neovim.nix
      ../../homeManagerModules/bars/waybar.nix
      ../../homeManagerModules/launcher/fuzzel.nix
    ];

  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    stateVersion = "24.11";
  };
}
