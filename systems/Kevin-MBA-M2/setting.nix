{ lib, pkgs, username, ... }: {
  system.defaults = {
    WindowManager = {
      StandardHideDesktopIcons = true; # 是否隱藏桌面上的圖示。預設為 null。
      StandardHideWidgets = false; # 是否隱藏桌面上的小工具。預設為 null。
      EnableStandardClickToShowDesktop = false; # 是否啟用單擊顯示桌面。預設為 null。
    };
    finder = {
      _FXShowPosixPathInTitle = true; # 是否在視窗標題中顯示完整的 POSIX 檔案路徑。預設為 false。
      AppleShowAllExtensions = true; # 是否顯示所有檔案的擴展名。預設為 false。
      AppleShowAllFiles = true; # 是否顯示所有檔案。預設為 false。
      CreateDesktop = true; # 是否在桌面上顯示圖示。預設為 true。
      FXDefaultSearchScope = "SCcf"; # Finder 的默認搜索範圍。預設為 "This Mac"。
      FXEnableExtensionChangeWarning = false; # 是否在更改擴展名時顯示警告。預設為 true。
      FXPreferredViewStyle =
        "Nlsv"; # Finder 的首選視圖樣式。 “icnv”= 圖示視圖、“Nlsv”= 清單視圖、“clmv”= 列視圖、“Flwv”= 圖庫視圖 預設為 icnv。
      QuitMenuItem = false; # 是否允許退出 Finder。預設為 false。
      ShowPathbar = true; # 在查找器視窗中顯示路徑麵包屑。預設為 false。
      ShowStatusBar = true; # 在查找器視窗底部顯示狀態欄，其中包含項目/磁碟空間統計資料。預設為 false。
    };
    NSGlobalDomain = {
      _HIHideMenuBar = true; # 是否隱藏菜單欄。預設為 false。
      "com.apple.swipescrolldirection" = false; # 是否反轉滾動方向。預設為 true。
      AppleICUForce24HourTime = true; # 是否使用 24 小時制。
    };
    LaunchServices.LSQuarantine = true; # 是否對下載的應用程式啟用隔離。預設為 true。
    menuExtraClock = {
      IsAnalog = false; # 是否顯示模擬時鐘。預設為 false。
      Show24Hour = true; # 是否顯示 24 小時時鐘。預設為 false。
      ShowAMPM = false; # 是否顯示 AM/PM。預設為 false。
      ShowDate = 0; # 是否顯示日期。0 = 當空間允許時 1 = 始終 2 = 從不。
      ShowDayOfMonth = true; # 是否顯示月份的日期。預設為 false。
      ShowDayOfWeek = true; # 是否顯示星期幾。預設為 false。
      ShowSeconds = true; # 是否顯示秒數。預設為 false。
    };
    screencapture = {
      type = "png"; # 截圖的文件類型。
      disable-shadow = false; # 是否禁用窗口陰影。預設為 false。
      location = "~/Pictures"; # 截圖的保存位置。預設為桌面。
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates =
      false; # 是否自動安裝 macOS 更新。預設為 false。
    dock = {
      appswitcher-all-displays = false;
      # 是在所有顯示器上還是僅在主顯示器上顯示應用程式切換器。預設為 false。
      orientation =
        "bottom"; # Dock 的位置。預設為 bottom。null or one of "left", "bottom", "right"
      autohide = true;
      autohide-delay = 0.24; # 設定自動隱藏延遲的速度。預設值0.24。
      autohide-time-modifier = 1.0; # 設定自動隱藏的速度。預設值1。
      dashboard-in-overlay = false; # 是否將 Dashboard 顯示為覆蓋層。預設為 false。
      enable-spring-load-actions-on-all-items =
        true; # 啟用所有項目上的彈簧加載操作。預設為 false。
      expose-animation-duration = 1.0; # 設定任務控制動畫的速度。預設值1.0。
      expose-group-apps = true; # 是否按應用程式分組 Exposé。預設為 true。
      largesize = 64; # 懸停時放大的圖示大小。預設值為 16。
      launchanim = true; # 是否在啟動應用程式時顯示動畫。預設為 true。
      magnification = true; # 是否啟用 Dock 放大鏡。預設為 true。
      mineffect =
        "scale"; # Dock 的最小化效果。預設為 genie。null or one of "genie", "suck", "scale"
      minimize-to-application = false; # 是否將最小化的窗口放在 Dock 中的應用程式圖標中。預設為 false。
      mouse-over-hilite-stack = true; # 是否在 Dock 中的堆疊上懸停時突出顯示。預設為 true。
      mru-spaces = false; # 是否在 Dock 中顯示最近使用的空間。預設為 true。
      persistent-apps = [
        "/Applications/Visual Studio Code.app"
        "/Applications/Arc.app"
        "/Applications/WeChat.app"
        "/Applications/Obsidian.app"
        "/Applications/ChatGPT.app"
        "/Applications/Ghostty.app"
        # "/Users/${username}/Applications/Home Manager Apps/kitty.app"
        # "/Users/${username}/Applications/Home Manager Apps/Spotify.app"
        # "/Users/${username}/Applications/Home Manager Apps/Rio.app"
      ]; # Dock 中的應用程式圖標。預設為空。
      persistent-others = [ "/Users/${username}/Downloads" ]; # Dock 中的持久資料夾。
      show-process-indicators = true; # 是否在 Dock 中顯示應用程式的運行狀態。預設為 true。
      show-recents = false; # 是否在 Dock 中顯示最近使用的應用程式。預設為 true。
      showhidden = true; # 是否在 Dock 中顯示隱藏的應用程式。預設為 false。
      static-only = false; # 是否僅在 Dock 中顯示開啟的應用程式圖標。預設為 false。
      tilesize = 48; # Dock 中圖示的大小。預設值為 64。
      wvous-bl-corner = 1; # 左下角的熱角。預設為 5。
      wvous-br-corner = 1; # 右下角的熱角。預設為 10。
      wvous-tl-corner = 1; # 左上角的熱角。預設為 2。
      wvous-tr-corner = 11; # 右上角的熱角。預設為 6。
      #熱角動作。有效值包括：

      # 1: Disabled
      # 1 ：禁用
      # 2: Mission Control
      # 2 ：任務控制
      # 3: Application Windows
      # 3 ：應用程式視窗
      # 4: Desktop
      # 4 ：桌面
      # 5: Start Screen Saver
      # 5 ：啟動螢幕保護程式
      # 6: Disable Screen Saver
      # 6 ：停用螢幕保護程式
      # 7: Dashboard
      # 7 ：儀表板
      # 10: Put Display to Sleep
      # 10 ：讓顯示器進入睡眠狀態
      # 11: Launchpad
      # 11 ：啟動板
      # 12: Notification Center
      # 12 ：通知中心
      # 13: Lock Screen
      # 13 ：鎖屏
      # 14: Quick Note.
      # 14 ：快速說明。
    };
    # CustomSystemPreferences = 
    # {
    #   globalDomain = {
    #     NSStatusItemSpacing = 4; #設定菜單欄項目之間的間距。
    #     NSStatusItemSelectionPadding = 2; #内边距
    #   };
    # };
    # CustomUserPreferences = 
    # {
    #   globalDomain = {
    #     NSStatusItemSpacing = 4; #設定菜單欄項目之間的間距。
    #     NSStatusItemSelectionPadding = 2; #内边距
    #   };
    # };
  };
  system.startup.chime = false; # 是否在啟動時播放開機音效。預設為 true。
  system.stateVersion = 5; # 系統狀態版本。
  nix = {
    enable = true;
    gc = {
      automatic = true; # 是否自動執行垃圾回收。預設為 true。
      interval = {
        Day = 3;
        # Hour = 0; Minute = 0; 
      }; # 垃圾回收的頻率。
      options = "-d"; # 垃圾回收的選項。
    };
    optimise = {
      automatic = true; # 是否自動優化 Nix 存儲庫。預設為 false
      interval = {
        Day = 3;
        # Hour = 0; Minute = 0 ; 
      }; # 優化 Nix 存儲庫的頻率。
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
    package = pkgs.nixVersions.git;
  };
  documentation.info.enable = true;
}
