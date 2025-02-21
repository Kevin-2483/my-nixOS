{
  targets.darwin.defaults."com.apple.desktopservices".DSDontWriteUSBStores = true; # 是否阻止在 USB 驅動器上寫入 .DS_Store 文件。
  targets.darwin.defaults."com.apple.desktopservices".DSDontWriteNetworkStores = true; # 是否阻止在網絡卷上寫入 .DS_Store 文件。
}