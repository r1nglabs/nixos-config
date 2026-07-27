{ pkgs, ... }:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # 强制 Electron/Qt 应用运行在 Wayland 后端
  };

  environment.systemPackages = with pkgs; [
    telegram-desktop
  ];
}
