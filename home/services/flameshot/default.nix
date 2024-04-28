{ pkgs, ... }:{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;
    settings = {
      General = {
        savePath = "/home/kevin/Pictures/flameshot";
        savePathFixed = true;
        saveAsFileExtension = ".png";
        uiColor = "#181825";
        contrastUiColor = "#f5c2e7";
        drawColor = "#94e2d5";
        showHelp = true;
        showSidePanelButton = true;
        showDesktopNotification = true;
        filenamePattern = "%F-%H-%M";
        disabledTrayIcon = false;
        allowMultipleGuiInstances = true;
        drawThickness = 1;
        keepOpenAppLauncher = false;
        startupLaunch = true;
        contrastOpacity = 255;
        saveAfterCopy = false;
        copyPathAfterSave = false;
        copyAndCloseAfterUpload = true;
        antialiasingPinZoom = true;
        useJpgForClipboard = false;
        uploadWithoutConfirmation = false;
        predefinedColorPaletteLarge = false;
        # jpegQuality = 99; 

        #[Shortcuts]
        #   ;TYPE_ARROW=A
        #   ;TYPE_CIRCLE=C
        #   ;TYPE_CIRCLECOUNT=
        #   ;TYPE_COMMIT_CURRENT_TOOL=Ctrl+Return
        #   ;TYPE_COPY=Ctrl+C
        #   ;TYPE_DRAWER=D
        #   ;TYPE_EXIT=Ctrl+Q
        #   ;TYPE_IMAGEUPLOADER=Return
        #   ;TYPE_MARKER=M
        #   ;TYPE_MOVESELECTION=Ctrl+M
        #   ;TYPE_MOVE_DOWN=Down
        #   ;TYPE_MOVE_LEFT=Left
        #   ;TYPE_MOVE_RIGHT=Right
        #   ;TYPE_MOVE_UP=Up
        #   ;TYPE_OPEN_APP=Ctrl+O
        #   ;TYPE_PENCIL=P
        #   ;TYPE_PIN=
        #   ;TYPE_PIXELATE=B
        #   ;TYPE_RECTANGLE=R
        #   ;TYPE_REDO=Ctrl+Shift+Z
        #   ;TYPE_RESIZE_DOWN=Shift+Down
        #   ;TYPE_RESIZE_LEFT=Shift+Left
        #   ;TYPE_RESIZE_RIGHT=Shift+Right
        #   ;TYPE_RESIZE_UP=Shift+Up
        #   ;TYPE_SYM_RESIZE_DOWN=Ctrl+Shift+Down
        #   ;TYPE_SYM_RESIZE_LEFT=Ctrl+Shift+Left
        #   ;TYPE_SYM_RESIZE_RIGHT=Ctrl+Shift+Right
        #   ;TYPE_SYM_RESIZE_UP=Ctrl+Shift+Up
        #   ;TYPE_SAVE=Ctrl+S
        #   ;TYPE_SELECTION=S
        #   ;TYPE_SELECTIONINDICATOR=
        #   ;TYPE_SELECT_ALL=Ctrl+A
        #   ;TYPE_TEXT=T
        #   ;TYPE_TOGGLE_PANEL=Space
        #   ;TYPE_UNDO=Ctrl+Z
      };
    };
  };
}
