{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-SAMSUNG_MZVL4512HBLU-00BL7_S67VNF1T902648";
      content = {
        type = "gpt";
        partitions = {

          boot = {
            size = "1M";
            type = "EF02";
          };

          ESP = {
            size = "256M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
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
