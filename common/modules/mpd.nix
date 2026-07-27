{ pkgs, config, lib, ... }:
let
  main_user = "lynx"; 
in
{
  services.mpd = {
    enable = true;
    user = main_user;
    settings = {
      music_directory = "/home/${main_user}/Music";
      playlist_directory = "/home/${main_user}/Music/playlists";
      audio_output = [
        {
          type = "pipewire";
          name = "pipeWire output";
        }
      ];
    };
    startWhenNeeded = true;
  };

  systemd.services.mpd = {
    environment.XDG_RUNTIME_DIR = "/run/user/${main_user}.uid}";
  };

  environment.systemPackages = with pkgs; [
    rmpc
    mpc
  ];
}
