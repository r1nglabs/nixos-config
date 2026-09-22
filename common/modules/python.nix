{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      requests
      tomlkit
      tomli-w
      numpy
      pillow
      qrcode
      matplotlib
      opencv-python
      pycryptodome
    ]))

    basedpyright # lsp
    ruff # lint
  ];
}

