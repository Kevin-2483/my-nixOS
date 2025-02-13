{ pkgs, ... }:
{
  services.samba = {
    enable = true; # 启用 Samba 服务

    package = pkgs.samba4Full; # 设置 Samba 包

    openFirewall = true; # 开启防火墙规则

    smbd = {
      enable = true; # 启用 smbd 服务
      extraArgs = [ ]; # 传递给 smbd 的额外参数
    };

    nmbd = {
      enable = true; # 启用 nmbd 服务
      extraArgs = [ ]; # 传递给 nmbd 的额外参数
    };

    winbindd = {
      enable = true; # 启用 winbindd 服务
      extraArgs = [ ]; # 传递给 winbindd 的额外参数
    };

    usershares = {
      enable = true; # 启用用户共享功能
      group = "samba"; # 允许创建共享的组
    };

    nsswins = true; # 启用 WINS NSS 插件

    settings = {
      global = {
        security = "user"; # 设置 Samba 安全性
        "invalid users" = [ "root" ]; # 禁止 root 用户通过 Samba 登录
        "passwd program" = "/run/wrappers/bin/passwd %u"; # 设置密码程序
      };
      public = {
        path = "/home/kevin/services/smb/public"; # 公共共享目录路径
        "read only" = "yes"; # 只读
        "browseable" = "yes"; # 可浏览
        "guest ok" = "yes"; # 允许游客访问
        "comment" = "Public samba share."; # 公共共享注释
        "public" = "yes"; # 公共共享
      };
      private = {
        path = "/home/kevin/services/smb/private"; # 私有共享目录路径
        "read only" = "no"; # 可读写
        "browseable" = "yes"; # 可浏览
        "guest ok" = "no"; # 禁止游客访问
        "comment" = "Private samba share."; # 私有共享注释
        "public" = "no"; # 私有共享
      };
    };
  };
}
