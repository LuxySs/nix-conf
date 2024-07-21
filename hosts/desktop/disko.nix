{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sdb";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {

            ESP = {
              type = "EF00";
              size = "256M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            home = {
              size = "250G";
              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/home";
              };
            };

            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "btrfs";
                mountpoint = "/";
              };
            };

          };
        };
      };
    };
  };
}
