{ pkgs, ... }:
{
  environment.sessionVariables = {
    WGETRC = "$HOME/.config/wgetrc";
  };

  environment.shellInit = ''
    if [ ! -f "''${XDG_CONFIG_HOME:-$HOME/.config}/.config}/wgetrc" ]; then
      mkdir -p "''${XDG_CONFIG_HOME:-$HOME/.config}"
      echo "hsts-file = ''${XDG_CACHE_HOME:-$HOME/.cache}/wget-hsts" > "''${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
    fi
  '';

  environment.systemPackages = with pkgs; [
    wget
  ];
}
