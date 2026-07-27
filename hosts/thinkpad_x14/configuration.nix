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

  environment.systemPackages = with pkgs; [
    #alsa-utils
    #rustdesk-flutter
    #door-knocker
    #pandoc
    #pulseaudio
    #playerctl
    #reaper
    #rawtherapee
    #darktable
    #vkdt
    #digikam
    #waypaper
    #ghostty
    #awww
    #hyprpicker
    #starship
    #lm_sensors # 温度监控
    #overskride # gtk 蓝牙配置工具
    #appimage-run
    #roc-toolkit
    #sdcv
    #wf-recorder
    #libnotify
    #zed-editor
    #biblioteca
    #cambalache
    hydrus
    upscaler
  ];
  system.stateVersion = "26.05";

  # wifi just support wallsupplant
  networking.hostName = "li";
  networking.networkmanager.wifi.backend = "wpa_supplicant";

  # 扬声器没声音 bug
  boot.kernelModules = [ "ec_sys" ];
  boot.extraModprobeConfig = ''
    options ec_sys write_support=1
  '';
  systemd.services.thinkpad-x14-ec-audio-fix = {
    description = "Fix ThinkPad X14 Gen 1 Speaker EC Latch";
    documentation = [ "https://github.com/Ray-D-Song/thinkpad-x14-gen1-speaker-ec-fix" ];
  
    after = [ "systemd-modules-load.service" "local-fs.target" ];
    wantedBy = [ "multi-user.target" ];
  
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # 1. 确保 /sys/kernel/debug/ec/ec0/io 存在
      # 2. 读取 0x3b 处的值，并通过位运算将 bit0 置为 0 (解开硬件静音锁)
      ExecStart = pkgs.writeShellScript "x14-ec-fix" ''
        set -euo pipefail
        EC_PATH="/sys/kernel/debug/ec/ec0/io"
        
        if [ ! -f "$EC_PATH" ]; then
          echo "错误: 找不到 EC 调试接口，请确保内核开启了 debugfs 且 ec_sys 模块已正确加载。" >&2
          exit 1
        fi

        CURRENT_VAL=$(od -An -t x1 -j 59 -N 1 "$EC_PATH" | tr -d '[:space:]')
        echo "当前 EC 0x3b 寄存器值为: 0x$CURRENT_VAL"

        DEC_VAL=$((16#$CURRENT_VAL))
      
        if [ $((DEC_VAL & 1)) -eq 1 ]; then
          NEW_VAL=$((DEC_VAL & 254))
          HEX_FORMAT=$(printf "\\x%02x" $NEW_VAL)
        
          echo "检测到扬声器被锁死，正在写入新值解开锁死..."
          printf "$HEX_FORMAT" | dd of="$EC_PATH" bs=1 seek=59 count=1 conv=notrunc 2>/dev/null
          echo "EC 寄存器更新成功。"
        else
          echo "扬声器 EC 状态正常，无需修改。"
        fi
      '';
    };
  };
}
