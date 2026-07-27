{ pkgs, config, ... }:
{
  imports =
    [
      ./hardware-configuration.nix

      ../../common/system/boot.nix
      ../../common/system/kernel.nix
      ../../common/system/lidswitch.nix
      ../../common/system/upower.nix
      ../../common/system/power-profiles-daemon.nix
      ../../common/system/networkmanager.nix
      ../../common/system/pipewire.nix
      ../../common/system/bluetooth.nix
      ../../common/system/nix_settings.nix
      ../../common/system/user.nix
      ../../common/system/unfree.nix
      ../../common/system/timezone.nix
      ../../common/system/nodefault.nix

      ../../common/base/nvim.nix
      ../../common/base/wget.nix
      ../../common/base/zsh.nix
      ../../common/base/git.nix
      ../../common/base/curl.nix
      ../../common/base/p7zip.nix
      ../../common/base/jq.nix
      ../../common/base/ripgrep.nix
      ../../common/base/fzf.nix
      ../../common/base/fd.nix
      ../../common/base/fastfetch.nix
      ../../common/base/tealdeer.nix
      ../../common/base/flatpak.nix
      ../../common/base/yazi.nix
      ../../common/base/brightnessctl.nix
      ../../common/base/btop.nix
      ../../common/base/bintools.nix
      ../../common/base/v2raya.nix
      ../../common/base/emacs.nix
      ../../common/base/keyd.nix

      ../../common/graphics/display_manager.nix
      ../../common/graphics/niri.nix
      ../../common/graphics/graphics.nix
      ../../common/graphics/fonts.nix
      ../../common/graphics/fcitx.nix
      ../../common/graphics/scx.nix
      ../../common/graphics/file-roller.nix
      ../../common/graphics/gnome-text-editor.nix
      ../../common/graphics/noctalia.nix
      ../../common/graphics/nautilus.nix
      ../../common/graphics/loupe.nix
      ../../common/graphics/mpv.nix
      ../../common/graphics/foot.nix
      ../../common/graphics/xwayland.nix
      ../../common/graphics/firefox.nix
      ../../common/graphics/ungoogled-chromium.nix
      ../../common/graphics/fuzzel.nix
      ../../common/graphics/clash_verge_rev.nix
      ../../common/graphics/localsend.nix
      ../../common/graphics/kdbx.nix
      ../../common/graphics/mission-center.nix
      ../../common/graphics/wdisplays.nix
      ../../common/graphics/crosspipe.nix
      ../../common/graphics/easyeffects.nix
      ../../common/graphics/appimage.nix
      ../../common/graphics/gnome-decoder.nix
      ../../common/graphics/screen_shot.nix
      ../../common/graphics/gnome-text-editor.nix
      #../../common/graphics/gnome.nix


      # 命令行
      #../../common/modules/sshd.nix
      #../../common/modules/rclone.nix
      #../../common/modules/mpd.nix
      #../../common/modules/pentesting.nix
      #../../common/modules/tun2socks.nix
      #../../common/modules/rust.nix
      #../../common/modules/lilypond.nix
      ../../common/modules/tts.nix
      ../../common/modules/tcpdump.nix
      ../../common/modules/ydict.nix
      ../../common/modules/typst.nix
      ../../common/modules/wayland_clipboard_utilities.nix
      ../../common/modules/c.nix
      ../../common/modules/python.nix
      ../../common/modules/go.nix
      ../../common/modules/zig.nix
      ../../common/modules/vulkan-tools.nix
      ../../common/modules/tombi.nix
      ../../common/modules/pciutils.nix
      ../../common/modules/ffmpeg.nix
      ../../common/modules/nethogs.nix
      ../../common/modules/podman.nix

      # 可视化软件
      ../../common/modules/gram.nix
      ../../common/modules/steam.nix
      ../../common/modules/mangohud.nix
      ../../common/modules/gamemode_gamescope.nix
      ../../common/modules/telegram-desktop.nix
      ../../common/modules/zotero.nix
      ../../common/modules/sqlitebrowser.nix
      ../../common/modules/fragments.nix
      ../../common/modules/buffer.nix
      ../../common/modules/readest.nix
      ../../common/modules/imhex.nix
      ../../common/modules/wireshark.nix
      ../../common/modules/typesetter.nix
      ../../common/modules/zathura.nix
      ../../common/modules/splayer.nix
      ../../common/modules/lingot.nix
      ../../common/modules/gmetronome.nix
      ../../common/modules/obs.nix
      #../../common/modules/musescore.nix
      #../../common/modules/digikam.nix
      #../../common/modules/d-spy.nix
      #../../common/modules/libreoffice.nix
      #../../common/modules/fluffychat.nix
      #../../common/modules/apostrophe.nix
      #../../common/modules/bottles.nix
      #../../common/modules/anytype.nix
      #../../common/modules/sunshine.nix
      #../../common/modules/vesktop.nix
      #../../common/modules/qbittorrent.nix
    ];

  hardware.cpu.amd.updateMicrocode = true;
  boot.kernelParams = [
    "asus_wmi.fnlock_default=1"
  ];
  boot.loader.timeout = 2;
  boot.extraModprobeConfig = ''
    options iwlwifi lln_disable=0 power_save=0
    options nvidia NVreg_RegistryDwords="EnableDynamicBoost=1;OPM=1"
  '';


  # network
  networking.hostName = "mercury";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.wifi.powersave = false;
  networking.firewall.enable = false;
  zramSwap.enable = true;

  environment.shellAliases = {
    say = ''f(){ echo "$*" | ${pkgs.piper-tts}/bin/piper --model ~/sync/resource/en_US-danny-low.onnx --output-file - | ${pkgs.ffmpeg}/bin/ffplay -nodisp -autoexit -loglevel error -; unset -f f; }; f'';
    ew = ''f(){ ${pkgs.ydict}/bin/ydict "$1"; echo "that $1" | ${pkgs.piper-tts}/bin/piper --model ~/sync/resource/en_US-danny-low.onnx --output-file - | ${pkgs.ffmpeg}/bin/ffplay -nodisp -autoexit -loglevel error -; }; f'';
  };


  # 华硕
  services = {
    asusd.enable = true;
    supergfxd.enable = true;
    logind = {
      settings.Login.HandleLidSwitchDocked = "ignore"; # 仅在连接电源时合屏不挂起
      settings.Login.HandleLidSwitchExternalPower = "ignore"; # 仅在连接扩展坞/外接显示器时合屏不挂起
    };
  };

 
  # 5060
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement = {
      enable = true;
      finegrained = false;
    };
  };
  environment.systemPackages = with pkgs; [
    asusctl
    supergfxctl
    nvtopPackages.full
    xrandr
    powertop
    mesa-demos
    roc-toolkit
    heroic
    protonup-qt
    protonplus
    lutris
    upscaler
  ];

  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
    rules = [
      {
        pattern = {
          feature = "procname";
          matches = "niri";
        };
        profile = "Limit free buffer pool on Wayland compositors";
      }
    ];
    profiles = [
      {
        name = "Limit free buffer pool on Wayland compositors";
        settings = [
          {
            key = "GLVidHeapReuseRatio";
            value = 0;
          }
        ];
      }
    ];
  };

  system.stateVersion = "25.11";
}
