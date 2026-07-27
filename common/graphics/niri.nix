{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.niri.enable = true;
 
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
    config = {
      # common.default = [ "gtk" ];
      niri = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.RemoteDesktop" = [ "gnome" ];
      };
      hyprland = {
        #"default" = [ "gtk" "hyprland" ];
      };
    };
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      niri = {
        prettyName = "Niri -- lynx";
        comment = "Scrollable tiling Wayland compositor managed by UWSM";
        binPath = "${pkgs.niri}/bin/niri";
	extraArgs = [ "--session" ];
      };
    };
  };

  #systemd.user.services.awww
  systemd.user.services.fcitx5-uwsm = {
    description = "Fcitx5 daemon managed via UWSM";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "fcitx5 -d -r";
      Type = "forking";
      Restart = "on-failure";
      Slice = "app.slice";
    };
  };

  #systemd.user.services.mako-uwsm = {
    #description = "Mako daemon managed via UWSM";
    #wantedBy = [ "graphical-session.target" ];
    #partOf = [ "graphical-session.target" ];
    #after = [ "graphical-session.target" ];

    #serviceConfig = {
      #ExecStart = "${pkgs.mako}/bin/mako";
      #Restart = "on-failure";
      #Slice = "app.slice";
    #};
  #};
 
  systemd.user.services.noctalia-uwsm = {
    description = "Noctalia-Shell managed via UWSM";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    path = with pkgs; [
      bash
      coreutils
      brightnessctl
      wireplumber
      networkmanager
      fontconfig
      xdg-utils
      gnome-themes-extra
    ];

    environment = {
      XDG_DATA_DIRS = "/run/current-system/sw/share";
      QT_QPA_PLATFORMTHEME = "gtk3";
    };

    serviceConfig = {
      ExecStart = "${pkgs.noctalia-shell}/bin/noctalia-shell";
      Restart = "on-failure";
      #Slice = "app.slice";
      Slice = "session.slice";
    };
  };

  # noctalia 需要的图标
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
  ];
}
