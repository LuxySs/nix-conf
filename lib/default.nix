{ lib }:

with lib;

rec {

  mkOption' = type: default: description: mkOption { inherit type default description; };

  mkStrOption = default: name: mkOption' types.str default name;

  mkDisableOption = name: mkEnableOption name // {default = true;};

  mkChoiceOption = choices: default: description: mkOption {
    type = types.enum choices;
    inherit default description;
  };

}
