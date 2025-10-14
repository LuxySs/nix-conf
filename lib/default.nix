{ lib }:

with lib;

rec {

  mkOption' =
    type: default: description:
    mkOption { inherit type default description; };

  mkDisableOption = name: mkEnableOption name // { default = true; };

  mkIntOption = default: name: mkOption' types.int default name;
  mkStrOption = default: name: mkOption' types.str default name;
  mkPkgOption = default: name: mkOption' types.package default name;
  mkPathOption = default: name: mkOption' types.path default name;

  mkChoiceOption =
    choices: default: description:
    mkOption {
      type = types.enum choices;
      inherit default description;
    };

  ifAnyTrue = boolList: builtins.foldl' (acc: val: acc || val) false boolList;
}
