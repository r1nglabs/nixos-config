{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      requests
      tomlkit
      numpy
      pillow
      matplotlib
      pycryptodome
    ]))

    basedpyright # lsp
    ruff # lint
  ];
}

