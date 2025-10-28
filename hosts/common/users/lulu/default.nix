{
  pkgs,
  inputs,
  config,
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

      # add those 3 to make arduino-ide work
      # "dialout"
      # "uucp"
      # "tty"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9+UEWWxTkpeUr9MbPQeNA8ZciptrZvYDwhgU3kDcJyRbw8o15zkwNuDyPmKyZyRA9oK7VzsaJtNh32oOrrtbT+YRcT7BlT6fZCG7RJwG1HF890Y9RjbUAWK7sfME+nY7R1F4KXmYNwKTPzPvSgUbsViU/4JAe8pKVtAUbvv3zzex28FFRvjAJn5PjE2U5X2G59uLFlrDEaukr1aegIViLuCKzTVq75KiMGDVzgXXMxuSAIyblgqxGcL2hBoEjC3pXWKJVYfV1o8rNU7JfrcXlHaCGGjbcXpcEq3wsDotRjufIclK5P0BuwLIzUGWtEompxBgRpjJMNJH2JaJ9APlBewma0cigk4yNW6DldUdOeTBE0coYqeKccW7BO+BbROns3H9TpEZLV/qbaCtefMqGDw+sveIbyJ+NmonTmkzhZRxqgaNeP0BnvwW0FHgdAdJ7hBjIx7kB7SsfNXmUYRJyj6Plgn5XsCFaZBQ13ASIMhtfJWPlZ/Qio889ObmdagAeD59s9qU2Ywz43SNXahXu2QeSw8crAKw3KZ/bbXHJ4+5eKZePLqpH3Gcaqj2DkWZ+MgijVHLMZuhUEDJ7wU2eZlE4g03yStz7uEskEJFYCf8qvCi0h+nDf0ri9oQ/SQnTAzUo+sQB4Od1r1T/wVuKldZk0WKb65GtJAPmtu5DZQ== lucas.verbeiren@gmail.com"
    ];
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs pkgs;
    };

    # import the user's home-manager according to the host.
    users.lulu = import ../../../../home/lulu/${config.networking.hostName}.nix;
  };
}
