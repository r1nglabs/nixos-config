{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      requests
      tomlkit
      numpy
      pillow
      matplotlib
      pygobject3
    ]))

    gtk4
    gobject-introspection
    basedpyright # lsp
    ruff # lint
  ];

  environment.sessionVariables = {
    GI_TYPELIB_PATH = [
      "${pkgs.gtk4}/lib/girepository-1.0"
      "${pkgs.gobject-introspection}/lib/girepository-1.0"
    ];
  };
}

