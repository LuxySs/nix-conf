{
  pkgs,
  inputs,
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
      inherit inputs;
    };
    users.lulu = {

      /* profiles names instead of dishwasher would make more sense since the
      user doesn't care about the machine's hostname but cares about what
      type of tasks he would do the machine (profile) */
      imports = [ ../../../../home/lulu/dishwasher.nix ];
    };
  };

  # Import this user's personal/home configurations
  # home-manager.users.lulu = import (./../../../home/lulu + "/" + config.networking.hostName + ".nix");
}
