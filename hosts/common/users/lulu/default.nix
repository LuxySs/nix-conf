{
  pkgs,
  pkgs-stable,
  inputs,
  profile ? "full",
  ...
}:
{
  users.users.lulu = {
    description = "main user";
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "audio"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs pkgs pkgs-stable;
    };

    # import the user's home-manager according to the disired profile.
    users.lulu = import ../../../../home/lulu/${profile}.nix;
  };
}
