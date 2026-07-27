{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      requests
      tomlkit
      numpy
      pillow
      matplotlib
    ]))

    basedpyright # lsp
    ruff # lint
  ];
}

