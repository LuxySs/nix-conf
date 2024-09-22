{
  pkgs,
  pkgs-stable,
  inputs,
  host ? throw "missing host parameter",
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

    # import the user's home-manager according to the host.
    users.lulu = import ../../../../home/lulu/${host}.nix;
  };
}
