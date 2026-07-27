{ pkgs, ... }:
{
  fonts = {
    #fontDir.enable = true;
    packages = with pkgs; [
      nerd-fonts.roboto-mono
      font-awesome
      noto-fonts
      #noto-fonts-cjk-sans
      #noto-fonts-cjk-serif
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
      noto-fonts-color-emoji
      dejavu_fonts
      # material-design-icons
      wqy_zenhei
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      hinting.enable = true;
      defaultFonts = {
        sansSerif = ["WenQuanYi Zen Hei" "Noto Sans" "Noto Sans CJK SC" "DejaVu Sans" "Font Awesome 7 Free" ];
        serif = [ "Noto Serif" "Noto Serif CJK SC" "DejaVu Serif" ];
        monospace = [ "RobotoMono Nerd Font" "WenQuanYi Zen Hei Mono" "Noto Sans Mono" "DejaVu Sans Mono" ];
	emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}


