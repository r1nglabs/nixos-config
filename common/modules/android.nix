{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    scrcpy
  ];

  boot.kernelPatches = [
    {
      name = "enable-dmabuf-heaps-for-redroid";
      patch = null;
      structuredExtraConfig = with lib.kernel; {
        DMA_SHARED_BUFFER = yes;
        DMABUF_HEAPS = yes;
        DMABUF_HEAPS_SYSTEM = yes;
      };
    }
  ];

  # redroid
  #boot.kernelParams = [ "binder.debug_mask=0" ];
  
  # fileSystems."/dev/binderfs" = {
  #   device = "binder";
  #   fsType = "binder";
  #   options = [ "nofail" ];
  # };
  #
  # systemd.services.setup-redroid-binder = {
  #   description = "Create symlinks for Redroid to legacy /dev paths";
  #   after = [ "dev-binderfs.mount" ];
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig = {
  #     Type = "oneshot";
  #     RemainAfterExit = true;
  #     ExecStart = pkgs.writeScript "setup-binder.sh" ''
  #       #!${pkgs.bash}/bin/bash
  #       if mountpoint -q /dev/binderfs; then
  #         ln -sf /dev/binderfs/binder /dev/binder
  #         ln -sf /dev/binderfs/hwbinder /dev/hwbinder
  #         ln -sf /dev/binderfs/vndbinder /dev/vndbinder
  #         ln -sf /dev/binderfs/binder-control /dev/binder-control
  #       fi
  #     '';
  #   };
  # };
}
