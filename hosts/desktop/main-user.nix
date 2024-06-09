{ lib, config, pkgs, ... }:

{
  options = {
  };

  config = {
    users.users.lulu = {
      isNormalUser = true;
      description = "main-user";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.bash;
    };
  };
}
