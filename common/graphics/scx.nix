{ ... }:
{
  services.scx = {
    enable = true;
    scheduler = "scx_bpfland";  # 高负载能顶到 60
    #scheduler = "scx_rusty"; # steamos 同款，高负载 30
    #scheduler = "scx_lavd";  # 高负载  50
  };
}

