{ pkgs, ... }:
{
  fonts = {
    #fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.roboto-mono
      nerd-fonts.symbols-only
      emacs-all-the-icons-fonts
      font-awesome
      noto-fonts
      #noto-fonts-cjk-sans
      #noto-fonts-cjk-serif
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
      noto-fonts-color-emoji
      dejavu_fonts
      wqy_zenhei
      corefonts  # 微软核心字体，如 Arial、Times New Roman
      vista-fonts # 微软雅黑等
    ];
    fontconfig = {
      enable = true;
      hinting.enable = true;
      defaultFonts = {
        sansSerif = [
          "WenQuanYi Zen Hei"
          "Noto Sans"
          "Noto Sans CJK SC"
          "DejaVu Sans"
          "Font Awesome 7 Free"
        ];
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
          "DejaVu Serif"
        ];
        monospace = [
          "RobotoMono Nerd Font"
          "WenQuanYi Zen Hei Mono"
          "Noto Sans Mono"
          "DejaVu Sans Mono"
        ];
	      emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}


