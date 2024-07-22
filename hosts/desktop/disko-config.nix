{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {

            ESP = {
              priority = 1;
              name = "ESP";
              size = "256M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };

            home = {
              size = "250G";
              content = {
                type = "btrfs";
                mountpoint = "/home";
              };
            };

            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountpoint = "/";
              };
            };

          };
        };
      };
    };
  };
}
