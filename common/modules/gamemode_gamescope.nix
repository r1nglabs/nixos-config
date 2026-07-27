{ ... }:
{
  programs = {
    gamescope.enable = true;
      # capSysNice = true; 会导致 bubblewrap 报错而打不开 steam
      # capSysNice = false; 
    gamemode.enable = true;
    gamemode.enableRenice = true;
  };
}
