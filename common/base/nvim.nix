{ pkgs, ... }: {
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.shellAliases = {
    vi = "nvim";
  };
  environment.systemPackages = with pkgs; [
    neovim
  ];
}
