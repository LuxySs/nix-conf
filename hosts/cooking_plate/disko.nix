{
  device ? throw "Set this to your disk devie, e.g /dev/sda",
}:
{
  disko.devices = {
    disk.main = {
      inherit device;
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
              format = "ext4";
              mountpoint = "/home";
            };
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
            };
          };

        };
      };
    };
  };
}
