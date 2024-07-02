{ lib }:

with lib;

rec {

  mkOption' =
    type: default: description:
    mkOption { inherit type default description; };

  mkDisableOption = name: mkEnableOption name // { default = true; };

  mkStrOption = default: name: mkOption' types.str default name;
  mkPkgOption = default: name: mkOption' types.package default name;

  mkChoiceOption =
    choices: default: description:
    mkOption {
      type = types.enum choices;
      inherit default description;
    };

}
