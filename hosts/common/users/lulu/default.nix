{
  pkgs,
  inputs,
  host ? throw "missing host parameter",
  ...
}:

{
  users.users.lulu = {
    description = "main user";
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [
      "audio"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs pkgs;
    };

    # import the user's home-manager according to the host.
    users.lulu = import ../../../../home/lulu/${host}.nix;
  };
}
