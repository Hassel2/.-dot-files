{ pkgs, lib, config, ... }:

{
    services.xserver.videoDrivers = ["nvidia"];

    hardware = {
        opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bit = true;
        };

        nvidia = {
            modesetting.enable = true;

            powerManagement.enable = false;
            powerManagement.finegrained = false;

            nvidiaSettings = true;
            open = true;


            prime = {
                sync.enable = true;

                nvidiaBusId = "PCI:1:0:0";
                amdgpuBusId = "PCI:5:0:0";
            };

            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
    };
}
