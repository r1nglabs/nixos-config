{ ... }:
{
  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = ["*"];
      settings = {
        main = {
          leftalt = "leftmeta";
          leftmeta = "leftalt";
          capslock = "overload(control, capslock)";
        };
      };
    };
  };
}
