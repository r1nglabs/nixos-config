{ pkgs, config, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../common/laptop.nix
    ];
  system.stateVersion = "26.05";

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
